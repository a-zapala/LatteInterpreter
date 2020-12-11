module TypeChecker where

import           Control.Monad.Except
import           Control.Monad.State

import           AbsLatte

import qualified Data.Map             as M


type Position = Maybe (Int,Int)

show':: Position -> String
show' (Just (a,b)) = " line:" ++ show a ++ " column:" ++ show b 

type Env = M.Map Ident (Type Position , Bool) -- bool indicate if variable is declared in current block

data TypeCheckingError = TypeCheckingError {msg :: String, position :: Position}
  deriving (Eq)

instance Show TypeCheckingError where
    show (TypeCheckingError msg pos) =
        "ERROR: " ++ msg ++ show' pos

type TCM a = StateT Env (Except TypeCheckingError) a


throwTypeCheckingError :: String -> Position -> TCM a
throwTypeCheckingError msg pos = throwError (
    TypeCheckingError {
        msg = msg,
        position = pos} )


pureArgType :: ArgType Position -> ArgType Position
pureArgType x  = case x of
    RefArgType _ t   -> RefArgType Nothing (pureType t)
    ValueArgType _ t -> ValueArgType Nothing (pureType t)

pureType :: Type Position -> Type Position
pureType x = case x of
    Int _            -> Int Nothing
    Str _            -> Str Nothing
    Bool _           -> Bool Nothing
    Void _           -> Void Nothing
    Fun _  argTs retT->  Fun Nothing (fmap pureArgType argTs) (pureType retT)

isEqual:: Type Position -> Type Position -> Bool
isEqual t1 t2 = pureType t1 == pureType t2


guardOrError :: Bool -> String -> Position -> TCM ()
guardOrError True _ _      = pure ()
guardOrError False msg pos = throwTypeCheckingError msg pos

getExprPosition :: Expr Position -> Position
getExprPosition x = case x of
    EVar a _          -> a
    ELitInt a _       -> a
    ELitTrue a        -> a
    ELitFalse a       -> a
    EApp a _ _        -> a
    EString a _       -> a
    Anonymoys a _ _ _ -> a
    Neg a _           -> a
    Not a _           -> a
    EMul a _ _ _      -> a
    EAdd a _ _ _      -> a
    ERel a _ _ _      -> a
    EAnd a _ _        -> a
    EOr a _ _         -> a

getArgTypePosition :: ArgType Position -> Position
getArgTypePosition (RefArgType pos _) = pos
getArgTypePosition (ValueArgType pos _) = pos

checkArithmetic :: Expr Position -> Expr Position ->  TCM ()
checkArithmetic e1 e2 = do
    expectType (Int Nothing) e1
    expectType (Int Nothing) e2
    pure ()

checkLogic :: Expr Position -> Expr Position ->  TCM ()
checkLogic e1 e2 = do
    expectType (Bool Nothing) e1
    expectType (Bool Nothing) e2
    pure ()

expectVariable :: Expr Position -> TCM ()
expectVariable (EVar _ _ ) = pure ()
expectVariable e = throwTypeCheckingError "Only variable for reference type" (getExprPosition e)

checkArguments :: [ArgType Position] -> [Expr Position] -> TCM ()
checkArguments [] [] = pure ()
checkArguments [] (e:exprs) = throwTypeCheckingError "Too many arguments " $ getExprPosition e
checkArguments (t:types) [] = throwTypeCheckingError "Not enough arguments " $ getArgTypePosition t
checkArguments (t:types) (e:exprs) = case t of
        (RefArgType _ t) -> do
            expectVariable e
            expectType t e
            checkArguments types exprs
        (ValueArgType _ t) -> do
            expectType t e
            checkArguments types exprs


getType :: Expr Position -> TCM (Type Position)
getType (ELitInt _ _ ) = pure  $ Int Nothing
getType (EString _ _) = pure $ Str Nothing
getType (ELitTrue _ )= pure $ Bool Nothing
getType (ELitFalse _) = pure $ Bool Nothing

getType (EVar pos name) = do
    env <- get
    case M.lookup name env of
        Just (a, _)   -> pure a
        Nothing -> throwTypeCheckingError ("Variable is not defined " ++ show name) pos

getType (EMul pos e1 _ e2) = do
        checkArithmetic e1 e2
        pure (Int pos)
    
getType (EAdd pos e1 _ e2) = do
    checkArithmetic e1 e2
    pure (Int pos)

getType (ERel pos e1 _ e2) = do
    checkArithmetic e1 e2
    pure (Bool pos)

getType (EAnd pos e1  e2) = do
    checkLogic e1 e2
    pure (Bool pos)

getType (EOr pos e1  e2) = do
    checkLogic e1 e2
    pure (Bool pos)

getType (Neg pos expr) = do
    et <- getType expr
    guardOrError (isEqual (Int Nothing) et) "'-' operator for only int " pos
    pure et

getType (Not pos expr) = do
    et <- getType expr
    guardOrError (isEqual (Bool Nothing) et) "'!' operatore for only bool" pos
    pure et

getType (EApp pos name exprs) = do
  env <- get
  case M.lookup name env of
    Just (Fun _  args t, _ ) -> do
      checkArguments args exprs
      pure t -- change from f to t don't know wheter ok
    Nothing -> throwTypeCheckingError  ("Function not defined " ++ show name)  pos

getType (Anonymoys _ retType args (Block _ body)) = do
  env <- get
  declareArguments args
  modify $ M.insert (Ident "return") (retType, False)
  checkStmts body
  pure $ Fun Nothing  (fmap extractArgType args) retType

expectType :: Type Position -> Expr Position -> TCM ()
expectType expT  expr = do
    eT <- getType expr
    guardOrError (isEqual eT expT)   ("Expected type: " ++ show expT ++ ", but got: " ++ show eT ) (getExprPosition expr)


declareVariables:: Type Position -> [Item Position] -> TCM ()
declareVariables _ [] = pure ()

-- how delete redunance
declareVariables expt (item:items) = do
    env <- get
    case item of
        Init pos ident expr ->
            case M.lookup ident env of
                Just (_, True) -> throwTypeCheckingError ("Redeclare variable " ++ show ident) pos
                _ -> do
                    expectType expt expr
                    put $ M.insert ident (expt,True) env
                    declareVariables expt items
        NoInit pos ident -> 
            case M.lookup ident env of
                Just (_, True) -> throwTypeCheckingError ("Redeclare variable " ++ show ident) pos
                _ -> do
                    put $ M.insert ident (expt,True) env
                    declareVariables expt items

declareArguments :: [Arg Position] -> TCM ()
declareArguments [] = pure ()
declareArguments (a: args)    = do
    let name = extractName a
    let t = extractType a
    modify $ M.insert name (t, False)
    declareArguments args

allowRedeclare:: Env -> Env
allowRedeclare  = M.map (\(t,flag) -> (t,False))

extractType :: Arg Position -> Type Position
extractType (Arg _ (RefArgType _ t) _ )   =  t
extractType (Arg _ (ValueArgType _ t) _ ) =  t

extractArgType :: Arg Position -> ArgType Position
extractArgType (Arg _ argT _ ) = argT

extractName :: Arg Position -> Ident
extractName (Arg _ _ name)   =  name

checkStmt :: Stmt Position -> TCM ()
checkStmt (Empty _)       = pure ()

checkStmt (Decl _ varType variableList) = declareVariables varType variableList

checkStmt (BStmt _ (Block _ stmts)) = do
    env <- get
    modify allowRedeclare
    checkStmts stmts
    put env

checkStmt (SExp _ exp) = do
    getType exp
    pure ()

checkStmt (Ass pos name expr) = do
  env <- get
  case M.lookup name env of
    Nothing -> throwTypeCheckingError ("Variable is not defined " ++ show name) pos
    Just (varType, _) -> expectType varType expr

checkStmt (Incr pos name) =
  expectType (Int Nothing) (EVar pos name)

checkStmt (Decr pos name) =
    expectType (Int Nothing) (EVar pos name)

checkStmt (FnDef pos retType ident args (Block _ body)) = do
  let funType = Fun pos (fmap extractArgType args) retType
  -- idents for recurtion and value "return" for checking return type
  modify $ M.insert ident (funType, False)
  env <- get
  modify $ M.insert (Ident "return") (retType,False)  
  modify allowRedeclare 
  declareArguments args
  checkStmts body
  put env
    
checkStmt (Ret pos expr) = do
  env <- get
  case M.lookup (Ident "return") env of
        Just (t, _)  -> expectType t expr
        Nothing -> throwTypeCheckingError "Unexcepted return" pos


checkStmt (VRet pos) = do
  env <- get
  case M.lookup (Ident "return") env of
        Just (Void _, _) -> pure ()
        _             -> throwTypeCheckingError "Unexcepted void return" pos

checkStmt (Cond _ expr stmt) = do
    expectType (Bool Nothing) expr
    checkStmt stmt

checkStmt (CondElse _ expr stmtT stmtF) = do
    expectType (Bool Nothing) expr
    checkStmt stmtT
    checkStmt stmtF

checkStmt (While _ expr stmt) = do
    expectType (Bool Nothing) expr
    checkStmt stmt

checkStmt (Print _ expr) = do
    getType expr
    pure ()


checkStmts :: [Stmt Position] -> TCM ()
checkStmts []       = pure ()

checkStmts (x : stmts) = do
  checkStmt x
  checkStmts stmts


checkProgram :: Program Position -> Either TypeCheckingError ((), Env)
checkProgram (Program pos stmts) = runExcept $ runStateT (checkStmts stmts) M.empty