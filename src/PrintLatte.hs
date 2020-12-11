{-# OPTIONS_GHC -fno-warn-incomplete-patterns #-}
module PrintLatte where

-- pretty-printer generated by the BNF converter

import AbsLatte
import Data.Char


-- the top-level printing method
printTree :: Print a => a -> String
printTree = render . prt 0

type Doc = [ShowS] -> [ShowS]

doc :: ShowS -> Doc
doc = (:)

render :: Doc -> String
render d = rend 0 (map ($ "") $ d []) "" where
  rend i ss = case ss of
    "["      :ts -> showChar '[' . rend i ts
    "("      :ts -> showChar '(' . rend i ts
    "{"      :ts -> showChar '{' . new (i+1) . rend (i+1) ts
    "}" : ";":ts -> new (i-1) . space "}" . showChar ';' . new (i-1) . rend (i-1) ts
    "}"      :ts -> new (i-1) . showChar '}' . new (i-1) . rend (i-1) ts
    ";"      :ts -> showChar ';' . new i . rend i ts
    t  : "," :ts -> showString t . space "," . rend i ts
    t  : ")" :ts -> showString t . showChar ')' . rend i ts
    t  : "]" :ts -> showString t . showChar ']' . rend i ts
    t        :ts -> space t . rend i ts
    _            -> id
  new i   = showChar '\n' . replicateS (2*i) (showChar ' ') . dropWhile isSpace
  space t = showString t . (\s -> if null s then "" else (' ':s))

parenth :: Doc -> Doc
parenth ss = doc (showChar '(') . ss . doc (showChar ')')

concatS :: [ShowS] -> ShowS
concatS = foldr (.) id

concatD :: [Doc] -> Doc
concatD = foldr (.) id

replicateS :: Int -> ShowS -> ShowS
replicateS n f = concatS (replicate n f)

-- the printer class does the job
class Print a where
  prt :: Int -> a -> Doc
  prtList :: Int -> [a] -> Doc
  prtList i = concatD . map (prt i)

instance Print a => Print [a] where
  prt = prtList

instance Print Char where
  prt _ s = doc (showChar '\'' . mkEsc '\'' s . showChar '\'')
  prtList _ s = doc (showChar '"' . concatS (map (mkEsc '"') s) . showChar '"')

mkEsc :: Char -> Char -> ShowS
mkEsc q s = case s of
  _ | s == q -> showChar '\\' . showChar s
  '\\'-> showString "\\\\"
  '\n' -> showString "\\n"
  '\t' -> showString "\\t"
  _ -> showChar s

prPrec :: Int -> Int -> Doc -> Doc
prPrec i j = if j<i then parenth else id


instance Print Integer where
  prt _ x = doc (shows x)


instance Print Double where
  prt _ x = doc (shows x)


instance Print Ident where
  prt _ (Ident i) = doc (showString ( i))



instance Print (Program a) where
  prt i e = case e of
    Program _ stmts -> prPrec i 0 (concatD [prt 0 stmts])

instance Print (Arg a) where
  prt i e = case e of
    Arg _ argtype id -> prPrec i 0 (concatD [prt 0 argtype, prt 0 id])
  prtList _ [] = (concatD [])
  prtList _ [x] = (concatD [prt 0 x])
  prtList _ (x:xs) = (concatD [prt 0 x, doc (showString ","), prt 0 xs])
instance Print (ArgType a) where
  prt i e = case e of
    RefArgType _ type_ -> prPrec i 0 (concatD [prt 0 type_, doc (showString "&")])
    ValueArgType _ type_ -> prPrec i 0 (concatD [prt 0 type_])
  prtList _ [] = (concatD [])
  prtList _ [x] = (concatD [prt 0 x])
  prtList _ (x:xs) = (concatD [prt 0 x, doc (showString ","), prt 0 xs])
instance Print (Stmt a) where
  prt i e = case e of
    FnDef _ type_ id args block -> prPrec i 0 (concatD [prt 0 type_, prt 0 id, doc (showString "("), prt 0 args, doc (showString ")"), prt 0 block])
    Empty _ -> prPrec i 0 (concatD [doc (showString ";")])
    BStmt _ block -> prPrec i 0 (concatD [prt 0 block])
    Decl _ type_ items -> prPrec i 0 (concatD [prt 0 type_, prt 0 items, doc (showString ";")])
    Ass _ id expr -> prPrec i 0 (concatD [prt 0 id, doc (showString "="), prt 0 expr, doc (showString ";")])
    Incr _ id -> prPrec i 0 (concatD [prt 0 id, doc (showString "++"), doc (showString ";")])
    Decr _ id -> prPrec i 0 (concatD [prt 0 id, doc (showString "--"), doc (showString ";")])
    Ret _ expr -> prPrec i 0 (concatD [doc (showString "return"), prt 0 expr, doc (showString ";")])
    VRet _ -> prPrec i 0 (concatD [doc (showString "return"), doc (showString ";")])
    Cond _ expr stmt -> prPrec i 0 (concatD [doc (showString "if"), doc (showString "("), prt 0 expr, doc (showString ")"), prt 0 stmt])
    CondElse _ expr stmt1 stmt2 -> prPrec i 0 (concatD [doc (showString "if"), doc (showString "("), prt 0 expr, doc (showString ")"), prt 0 stmt1, doc (showString "else"), prt 0 stmt2])
    While _ expr stmt -> prPrec i 0 (concatD [doc (showString "while"), doc (showString "("), prt 0 expr, doc (showString ")"), prt 0 stmt])
    SExp _ expr -> prPrec i 0 (concatD [prt 0 expr, doc (showString ";")])
    Print _ expr -> prPrec i 0 (concatD [doc (showString "print"), doc (showString "("), prt 0 expr, doc (showString ")")])
  prtList _ [] = (concatD [])
  prtList _ (x:xs) = (concatD [prt 0 x, prt 0 xs])
instance Print (Block a) where
  prt i e = case e of
    Block _ stmts -> prPrec i 0 (concatD [doc (showString "{"), prt 0 stmts, doc (showString "}")])

instance Print (Item a) where
  prt i e = case e of
    NoInit _ id -> prPrec i 0 (concatD [prt 0 id])
    Init _ id expr -> prPrec i 0 (concatD [prt 0 id, doc (showString "="), prt 0 expr])
  prtList _ [x] = (concatD [prt 0 x])
  prtList _ (x:xs) = (concatD [prt 0 x, doc (showString ","), prt 0 xs])
instance Print (Type a) where
  prt i e = case e of
    Int _ -> prPrec i 0 (concatD [doc (showString "int")])
    Str _ -> prPrec i 0 (concatD [doc (showString "string")])
    Bool _ -> prPrec i 0 (concatD [doc (showString "boolean")])
    Void _ -> prPrec i 0 (concatD [doc (showString "void")])
    Fun _ argtypes type_ -> prPrec i 0 (concatD [doc (showString "("), prt 0 argtypes, doc (showString ")"), doc (showString "->"), prt 0 type_])
  prtList _ [] = (concatD [])
  prtList _ [x] = (concatD [prt 0 x])
  prtList _ (x:xs) = (concatD [prt 0 x, doc (showString ","), prt 0 xs])
instance Print (Expr a) where
  prt i e = case e of
    EVar _ id -> prPrec i 7 (concatD [prt 0 id])
    ELitInt _ n -> prPrec i 7 (concatD [prt 0 n])
    ELitTrue _ -> prPrec i 7 (concatD [doc (showString "true")])
    ELitFalse _ -> prPrec i 7 (concatD [doc (showString "false")])
    EApp _ id exprs -> prPrec i 7 (concatD [prt 0 id, doc (showString "("), prt 0 exprs, doc (showString ")")])
    EString _ str -> prPrec i 7 (concatD [prt 0 str])
    Anonymoys _ type_ args block -> prPrec i 6 (concatD [doc (showString "lambda:"), prt 0 type_, doc (showString "("), prt 0 args, doc (showString ")"), prt 0 block])
    Neg _ expr -> prPrec i 5 (concatD [doc (showString "-"), prt 6 expr])
    Not _ expr -> prPrec i 5 (concatD [doc (showString "!"), prt 6 expr])
    EMul _ expr1 mulop expr2 -> prPrec i 4 (concatD [prt 4 expr1, prt 0 mulop, prt 5 expr2])
    EAdd _ expr1 addop expr2 -> prPrec i 3 (concatD [prt 3 expr1, prt 0 addop, prt 4 expr2])
    ERel _ expr1 relop expr2 -> prPrec i 2 (concatD [prt 2 expr1, prt 0 relop, prt 3 expr2])
    EAnd _ expr1 expr2 -> prPrec i 1 (concatD [prt 2 expr1, doc (showString "&&"), prt 1 expr2])
    EOr _ expr1 expr2 -> prPrec i 0 (concatD [prt 1 expr1, doc (showString "||"), prt 0 expr2])
  prtList _ [] = (concatD [])
  prtList _ [x] = (concatD [prt 0 x])
  prtList _ (x:xs) = (concatD [prt 0 x, doc (showString ","), prt 0 xs])
instance Print (AddOp a) where
  prt i e = case e of
    Plus _ -> prPrec i 0 (concatD [doc (showString "+")])
    Minus _ -> prPrec i 0 (concatD [doc (showString "-")])

instance Print (MulOp a) where
  prt i e = case e of
    Times _ -> prPrec i 0 (concatD [doc (showString "*")])
    Div _ -> prPrec i 0 (concatD [doc (showString "/")])
    Mod _ -> prPrec i 0 (concatD [doc (showString "%")])

instance Print (RelOp a) where
  prt i e = case e of
    LTH _ -> prPrec i 0 (concatD [doc (showString "<")])
    LE _ -> prPrec i 0 (concatD [doc (showString "<=")])
    GTH _ -> prPrec i 0 (concatD [doc (showString ">")])
    GE _ -> prPrec i 0 (concatD [doc (showString ">=")])
    EQU _ -> prPrec i 0 (concatD [doc (showString "==")])
    NE _ -> prPrec i 0 (concatD [doc (showString "!=")])


