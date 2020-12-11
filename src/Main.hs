module Main where

import           System.Environment
import           System.IO

import           AbsLatte
import           LexLatte
import           ParLatte

import           ErrM

import           Interpreter
import           TypeChecker
main = do
  args  <- getArgs
  pText <- readFile (head args)
  let tokens = myLexer pText
  case pProgram tokens of
    Ok program ->
      print program
--      case checkProgram program of
--        Right _    ->  interpret program
--        Left  error -> print error
    Bad err -> print err
