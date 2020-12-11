module Interpreter where

import           Control.Monad.Cont
import           Control.Monad.Except
import           Control.Monad.Reader
import           Control.Monad.State
import           System.IO
import           System.IO.Unsafe

import           Data.IORef
import qualified Data.Map             as M

import           AbsLatte

type Position = Maybe (Int,Int)

show':: Position -> String
show' (Just (a,b)) = " line:" ++ show a ++ " column:" ++ show b 


instance (Show a) => Show (IORef a) where
    show a = show (unsafePerformIO (readIORef a))

data ArgName = ValType Ident | RefType Ident
    deriving (Show)

data Value =
    VInt  Integer |
    VString String |
    VBool Bool |
    Undefined |
    Function [ArgName] [Stmt Position] Env

instance Show Value where
    show (VInt i) = show i
    show (VString s) = s
    show (VBool True) = "true"
    show (VBool False) = "false"
    show Undefined = "Undefined"
    show (Function _ _ env) = "Function" ++ show env 


data Error =
    ZeroDiv Position | GetUndefined Position | NoReturn Position | Return | Inner String

instance Show Error where 
    show (ZeroDiv pos) = "Divide by zero" ++ show' pos
    show (GetUndefined pos) = "Get undefined value" ++ show' pos
    show (NoReturn pos) = "Last instruction in function must be 'return;'" ++ show' pos


type IM  a = ExceptT Error (StateT Env IO) a

type Env = M.Map Ident (IORef Value)


newVariable:: Value -> Ident -> IM ()
newVariable v ident = do
    env <- get
    vRef <- liftIO $ newIORef v
    put $ M.insert ident vRef env

declareVariables:: [Item Position] -> IM ()
declareVariables [] = pure ()
declareVariables (item:items) =
    case item of
        Init _ ident expr -> do
            initValue <- getValue expr
            newVariable initValue ident
        NoInit _ ident ->
            newVariable Undefined ident

transofrmToArgName:: Arg Position -> ArgName
transofrmToArgName (Arg _ argT ident) =
    case argT of
        (RefArgType _ _)   -> RefType ident
        (ValueArgType _ _) -> ValType ident

copyIORefValue::IORef Value -> IM (IORef Value)
copyIORefValue ioref = do
    val <- liftIO $ readIORef ioref
    liftIO $ newIORef val


interpretStmt:: Stmt Position -> IM ()
interpretStmt (Empty _) = pure ()

interpretStmt (FnDef _ _ ident args (Block _ stmts) ) = do
    env <- get
    copy <- mapM copyIORefValue env
    let fun =  Function (fmap transofrmToArgName args) stmts copy
    newVariable fun ident

interpretStmt (BStmt  _ (Block _ stmts)) = do
    env <- get
    interpretStmts stmts
    put env

interpretStmt (SExp _ expr) = do
    v <- getValue expr
    pure ()

interpretStmt (Print _ expr) = do
    val <- getValue expr
    liftIO $ print val

interpretStmt (Decl _ _ items) = declareVariables items

interpretStmt (Ass _ ident expr) = do
    val <- getValue expr
    Just ioref <- gets (M.lookup ident)
    liftIO $ writeIORef ioref val

interpretStmt (Ret _ expr) = do
    val <- getValue expr
    newVariable val (Ident "return")
    throwError Return

interpretStmt (VRet _ ) = do
    newVariable Undefined (Ident "return")
    throwError Return

interpretStmt (Incr _ name) = do
    ioref <- getIORefFromEnv name
    (VInt val) <- liftIO $ readIORef ioref
    liftIO $ writeIORef ioref  $ VInt (val + 1)

interpretStmt (Decr _ name) = do
    ioref <- getIORefFromEnv name
    (VInt val) <- liftIO $ readIORef ioref
    liftIO $ writeIORef ioref  $ VInt (val - 1)

interpretStmt (Cond _ expr stmt) = do
    (VBool cond) <- getValue expr
    if cond
        then interpretStmt stmt
        else pure ()

interpretStmt (CondElse  _ expr stmtT stmtF) = do
    (VBool cond) <- getValue expr
    if cond
        then interpretStmt stmtT
        else interpretStmt stmtF

interpretStmt loop@(While _ expr stmt) = do
    (VBool cond) <- getValue expr
    if cond
        then do {
            interpretStmt stmt;
            interpretStmt loop;
        }
        else pure ()

interpretStmts :: [Stmt Position] -> IM ()
interpretStmts [] = pure ()
interpretStmts (s:stmts) = do
    interpretStmt s
    interpretStmts stmts

getValue:: Expr Position -> IM Value
getValue (ELitInt _ v ) = pure  $ VInt v
getValue (EString _ v ) = pure  $ VString v
getValue (ELitTrue _) = pure  $ VBool True
getValue (ELitFalse _) = pure  $ VBool False

getValue (EVar pos name) = do
    env <- get
    case M.lookup name env of
        Just a  -> do
            val <- liftIO $ readIORef a
            case val of
                Undefined -> throwError $ GetUndefined pos
                _         -> pure val
        Nothing -> throwError $ Inner  (show name ++ "Not in enviroment")

getValue (Neg _ expr) = do
    (VInt n) <- getValue expr
    pure $ VInt $ (-1) * n

getValue (Not _ expr) = do
    val <- getValue expr
    case val of
        VBool False -> pure $ VBool True
        VBool True  -> pure $ VBool False


getValue (EMul _ e1 op e2) = do
    (VInt val1) <- getValue e1
    (VInt val2) <- getValue e2
    case op of
        Times _ -> pure $ VInt $ val1 * val2
        Div pos -> case val2 of
            0 -> throwError $ ZeroDiv pos
            _ ->  pure $ VInt $ val1 `div` val2
        Mod pos -> case val2 of 
            0 -> throwError $ ZeroDiv pos
            _ -> pure $ VInt $ val1 `mod` val2

getValue (EAdd _ e1 op e2) = do
    (VInt val1) <- getValue e1
    (VInt val2) <- getValue e2
    case op of
        Plus _  -> pure $ VInt $ val1 + val2
        Minus _ -> pure $ VInt $ val1 - val2

getValue (ERel pos e1 op e2) = do
    (VInt val1) <- getValue e1
    (VInt val2) <- getValue e2
    case op of
        LTH _ -> pure $ VBool $ val1 < val2
        LE _  -> pure $ VBool $ val1 <= val2
        GTH _ -> pure $ VBool $ val1 > val2
        GE _  -> pure $ VBool $ val1 >= val2
        EQU _ -> pure $ VBool $ val1 == val2
        NE _  -> pure $ VBool $ val1 /= val2


getValue (EAnd _ e1 e2) = do
    (VBool val1) <- getValue e1
    (VBool val2) <- getValue e2
    pure $ VBool $ val1 && val2

getValue (EOr _ e1 e2) = do
    (VBool val1) <- getValue e1
    (VBool val2) <- getValue e2
    pure $ VBool $ val1 || val2


getValue (EApp pos ident exprs) = do
    oldEnv <- get
    (Function args stmts env) <- getValueFromEnv ident
    funioref <- getIORefFromEnv ident
    put $ M.insert ident funioref env -- for recursion
    loadArgsToEnv args exprs oldEnv
    runFunction pos stmts
    retVal <-  getValueFromEnv (Ident "return")
    put oldEnv
    pure retVal

getValue (Anonymoys _ retT args (Block _ stmts)) = do
    env <- get
    copy <- mapM copyIORefValue env
    pure  $ Function (fmap transofrmToArgName args) stmts copy

getIORefFromEnv:: Ident -> IM (IORef Value)
getIORefFromEnv ident  = do
    env <- get
    case M.lookup ident env of
        Just a  ->  pure a
        Nothing -> throwError $ Inner ( "not find" ++ show ident)

getValueFromEnv:: Ident -> IM Value
getValueFromEnv ident = do
    ioref <- getIORefFromEnv ident
    liftIO $ readIORef ioref


atEndThrowError:: Position -> [Stmt Position] -> IM ()
atEndThrowError appPos stmts = do
    interpretStmts stmts
    throwError $ NoReturn appPos

returnChecker :: Error -> IM ()
returnChecker e = case e of
    Return -> pure ()
    _      -> throwError e

runFunction:: Position -> [Stmt Position] -> IM ()
runFunction appPos stmts = catchError (atEndThrowError appPos stmts) returnChecker


getIdent:: Expr Position -> Ident
getIdent (EVar _ ident) = ident

loadArgsToEnv:: [ArgName] -> [Expr Position]-> Env -> IM ()
loadArgsToEnv [] [] _ = pure ()
loadArgsToEnv (a:args) (e:exprs) oldEnv = do
    env <- get
    case a of
        (RefType ident) -> do
            let refIdent = getIdent e
            case M.lookup refIdent oldEnv of
                Just ioref  -> do
                    put $ M.insert ident ioref env
                    loadArgsToEnv args exprs oldEnv
                Nothing -> throwError $ Inner (show refIdent ++ "not in env")
        (ValType ident) -> do
            put oldEnv
            val <- getValue e
            put env
            newVariable val ident
            loadArgsToEnv args exprs oldEnv


interpret :: Program Position -> IO ()
interpret (Program _ stmts) = do
    res <- runStateT (runExceptT (interpretStmts stmts) ) M.empty
    let (error, env) = res
    case error of
        Left error -> print error
        Right ()   -> pure ()
