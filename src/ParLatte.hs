{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
{-# OPTIONS_GHC -fno-warn-incomplete-patterns -fno-warn-overlapping-patterns #-}
module ParLatte where
import AbsLatte
import LexLatte
import ErrM
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.19.11

data HappyAbsSyn 
	= HappyTerminal (Token)
	| HappyErrorToken Int
	| HappyAbsSyn4 (Ident)
	| HappyAbsSyn5 (Integer)
	| HappyAbsSyn6 (String)
	| HappyAbsSyn7 ((Program ()))
	| HappyAbsSyn8 ((Arg ()))
	| HappyAbsSyn9 ((ArgType ()))
	| HappyAbsSyn10 ([ArgType ()])
	| HappyAbsSyn11 ((Stmt ()))
	| HappyAbsSyn12 ([Arg ()])
	| HappyAbsSyn13 ((Block ()))
	| HappyAbsSyn14 ([Stmt ()])
	| HappyAbsSyn15 ((Item ()))
	| HappyAbsSyn16 ([Item ()])
	| HappyAbsSyn17 ((Type ()))
	| HappyAbsSyn18 ([Type ()])
	| HappyAbsSyn19 (Expr ())
	| HappyAbsSyn26 ((Expr ()))
	| HappyAbsSyn27 ([Expr ()])
	| HappyAbsSyn28 ((AddOp ()))
	| HappyAbsSyn29 ((MulOp ()))
	| HappyAbsSyn30 ((RelOp ()))

{- to allow type-synonyms as our monads (likely
 - with explicitly-specified bind and return)
 - in Haskell98, it seems that with
 - /type M a = .../, then /(HappyReduction M)/
 - is not allowed.  But Happy is a
 - code-generator that can just substitute it.
type HappyReduction m = 
	   Happy_GHC_Exts.Int# 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> m HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> m HappyAbsSyn
-}

action_0,
 action_1,
 action_2,
 action_3,
 action_4,
 action_5,
 action_6,
 action_7,
 action_8,
 action_9,
 action_10,
 action_11,
 action_12,
 action_13,
 action_14,
 action_15,
 action_16,
 action_17,
 action_18,
 action_19,
 action_20,
 action_21,
 action_22,
 action_23,
 action_24,
 action_25,
 action_26,
 action_27,
 action_28,
 action_29,
 action_30,
 action_31,
 action_32,
 action_33,
 action_34,
 action_35,
 action_36,
 action_37,
 action_38,
 action_39,
 action_40,
 action_41,
 action_42,
 action_43,
 action_44,
 action_45,
 action_46,
 action_47,
 action_48,
 action_49,
 action_50,
 action_51,
 action_52,
 action_53,
 action_54,
 action_55,
 action_56,
 action_57,
 action_58,
 action_59,
 action_60,
 action_61,
 action_62,
 action_63,
 action_64,
 action_65,
 action_66,
 action_67,
 action_68,
 action_69,
 action_70,
 action_71,
 action_72,
 action_73,
 action_74,
 action_75,
 action_76,
 action_77,
 action_78,
 action_79,
 action_80,
 action_81,
 action_82,
 action_83,
 action_84,
 action_85,
 action_86,
 action_87,
 action_88,
 action_89,
 action_90,
 action_91,
 action_92,
 action_93,
 action_94,
 action_95,
 action_96,
 action_97,
 action_98,
 action_99,
 action_100,
 action_101,
 action_102,
 action_103,
 action_104,
 action_105,
 action_106,
 action_107,
 action_108,
 action_109,
 action_110,
 action_111,
 action_112,
 action_113,
 action_114,
 action_115,
 action_116,
 action_117,
 action_118,
 action_119,
 action_120,
 action_121,
 action_122,
 action_123,
 action_124,
 action_125,
 action_126,
 action_127,
 action_128 :: () => Happy_GHC_Exts.Int# -> ({-HappyReduction (Err) = -}
	   Happy_GHC_Exts.Int# 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyReduce_1,
 happyReduce_2,
 happyReduce_3,
 happyReduce_4,
 happyReduce_5,
 happyReduce_6,
 happyReduce_7,
 happyReduce_8,
 happyReduce_9,
 happyReduce_10,
 happyReduce_11,
 happyReduce_12,
 happyReduce_13,
 happyReduce_14,
 happyReduce_15,
 happyReduce_16,
 happyReduce_17,
 happyReduce_18,
 happyReduce_19,
 happyReduce_20,
 happyReduce_21,
 happyReduce_22,
 happyReduce_23,
 happyReduce_24,
 happyReduce_25,
 happyReduce_26,
 happyReduce_27,
 happyReduce_28,
 happyReduce_29,
 happyReduce_30,
 happyReduce_31,
 happyReduce_32,
 happyReduce_33,
 happyReduce_34,
 happyReduce_35,
 happyReduce_36,
 happyReduce_37,
 happyReduce_38,
 happyReduce_39,
 happyReduce_40,
 happyReduce_41,
 happyReduce_42,
 happyReduce_43,
 happyReduce_44,
 happyReduce_45,
 happyReduce_46,
 happyReduce_47,
 happyReduce_48,
 happyReduce_49,
 happyReduce_50,
 happyReduce_51,
 happyReduce_52,
 happyReduce_53,
 happyReduce_54,
 happyReduce_55,
 happyReduce_56,
 happyReduce_57,
 happyReduce_58,
 happyReduce_59,
 happyReduce_60,
 happyReduce_61,
 happyReduce_62,
 happyReduce_63,
 happyReduce_64,
 happyReduce_65,
 happyReduce_66,
 happyReduce_67,
 happyReduce_68,
 happyReduce_69,
 happyReduce_70,
 happyReduce_71,
 happyReduce_72,
 happyReduce_73,
 happyReduce_74,
 happyReduce_75,
 happyReduce_76,
 happyReduce_77,
 happyReduce_78 :: () => ({-HappyReduction (Err) = -}
	   Happy_GHC_Exts.Int# 
	-> (Token)
	-> HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)
	-> [HappyState (Token) (HappyStk HappyAbsSyn -> [(Token)] -> (Err) HappyAbsSyn)] 
	-> HappyStk HappyAbsSyn 
	-> [(Token)] -> (Err) HappyAbsSyn)

happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x84\x20\x02\xfd\x9f\x03\x00\x00\x00\x40\x24\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x84\x40\x00\x00\x00\x00\x00\x00\x00\x80\x04\x00\x00\x00\x00\x00\x00\x80\x04\xc0\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x01\x00\x48\x04\x07\x00\x00\x00\x84\x20\x00\x35\x87\x03\x00\x00\x00\x40\x00\x00\x12\xc1\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x22\x0a\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x42\x10\x01\x12\xc1\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x10\x81\xfe\xef\x01\x00\x00\x00\x21\x08\x00\x89\xe0\x00\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x20\x04\x01\x20\x11\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x41\x00\x48\x04\x07\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x80\x88\x02\x00\x00\x00\x00\x21\x08\x00\x89\xe0\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x21\x08\x00\x89\xe0\x00\x00\x00\x80\x10\x04\x80\x44\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x04\x01\x20\x11\x1c\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x10\x04\x80\x44\x70\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x82\x00\x90\x08\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x04\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x20\x04\x01\x20\x11\x1c\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x84\x20\x00\x24\x82\x03\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x80\x00\x00\x11\x05\x00\x00\x00\x00\x42\x10\x00\x12\xc1\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x20\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x20\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x20\x00\x40\x44\x01\x00\x00\x00\x00\x20\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x10\x51\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x42\x10\x81\xfe\xcf\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x10\x82\x08\xf4\x7f\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x11\x05\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x10\x82\x00\x90\x08\x0e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x01\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x02\x00\x44\x14\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x21\x88\x40\xff\xe7\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_pProgram","Ident","Integer","String","Program","Arg","ArgType","ListArgType","Stmt","ListArg","Block","ListStmt","Item","ListItem","Type","ListType","Expr7","Expr6","Expr5","Expr4","Expr3","Expr2","Expr1","Expr","ListExpr","AddOp","MulOp","RelOp","'!'","'!='","'%'","'&'","'&&'","'('","')'","'*'","'+'","'++'","','","'-'","'--'","'->'","'/'","';'","'<'","'<='","'='","'=='","'>'","'>='","'boolean'","'else'","'false'","'if'","'int'","'lambda:'","'print'","'return'","'string'","'true'","'void'","'while'","'{'","'||'","'}'","L_ident","L_integ","L_quoted","%eof"]
        bit_start = st * 71
        bit_end = (st + 1) * 71
        read_bit = readArrayBit happyExpList
        bits = map read_bit [bit_start..bit_end - 1]
        bits_indexed = zip bits [0..70]
        token_strs_expected = concatMap f bits_indexed
        f (False, _) = []
        f (True, nr) = [token_strs !! nr]

action_0 (7#) = happyGoto action_3
action_0 (14#) = happyGoto action_4
action_0 x = happyTcHack x happyReduce_29

action_1 (68#) = happyShift action_2
action_1 x = happyTcHack x happyFail (happyExpListPerState 1)

action_2 x = happyTcHack x happyReduce_1

action_3 (71#) = happyAccept
action_3 x = happyTcHack x happyFail (happyExpListPerState 3)

action_4 (31#) = happyShift action_19
action_4 (36#) = happyShift action_20
action_4 (42#) = happyShift action_21
action_4 (46#) = happyShift action_22
action_4 (53#) = happyShift action_23
action_4 (55#) = happyShift action_24
action_4 (56#) = happyShift action_25
action_4 (57#) = happyShift action_26
action_4 (58#) = happyShift action_27
action_4 (59#) = happyShift action_28
action_4 (60#) = happyShift action_29
action_4 (61#) = happyShift action_30
action_4 (62#) = happyShift action_31
action_4 (63#) = happyShift action_32
action_4 (64#) = happyShift action_33
action_4 (65#) = happyShift action_34
action_4 (68#) = happyShift action_2
action_4 (69#) = happyShift action_35
action_4 (70#) = happyShift action_36
action_4 (4#) = happyGoto action_5
action_4 (5#) = happyGoto action_6
action_4 (6#) = happyGoto action_7
action_4 (11#) = happyGoto action_8
action_4 (13#) = happyGoto action_9
action_4 (17#) = happyGoto action_10
action_4 (19#) = happyGoto action_11
action_4 (20#) = happyGoto action_12
action_4 (21#) = happyGoto action_13
action_4 (22#) = happyGoto action_14
action_4 (23#) = happyGoto action_15
action_4 (24#) = happyGoto action_16
action_4 (25#) = happyGoto action_17
action_4 (26#) = happyGoto action_18
action_4 x = happyTcHack x happyReduce_4

action_5 (36#) = happyShift action_73
action_5 (40#) = happyShift action_74
action_5 (43#) = happyShift action_75
action_5 (49#) = happyShift action_76
action_5 x = happyTcHack x happyReduce_43

action_6 x = happyTcHack x happyReduce_44

action_7 x = happyTcHack x happyReduce_48

action_8 x = happyTcHack x happyReduce_30

action_9 x = happyTcHack x happyReduce_13

action_10 (68#) = happyShift action_2
action_10 (4#) = happyGoto action_70
action_10 (15#) = happyGoto action_71
action_10 (16#) = happyGoto action_72
action_10 x = happyTcHack x happyFail (happyExpListPerState 10)

action_11 x = happyTcHack x happyReduce_51

action_12 x = happyTcHack x happyReduce_54

action_13 x = happyTcHack x happyReduce_56

action_14 (33#) = happyShift action_67
action_14 (38#) = happyShift action_68
action_14 (45#) = happyShift action_69
action_14 (29#) = happyGoto action_66
action_14 x = happyTcHack x happyReduce_58

action_15 (39#) = happyShift action_64
action_15 (42#) = happyShift action_65
action_15 (28#) = happyGoto action_63
action_15 x = happyTcHack x happyReduce_60

action_16 (32#) = happyShift action_56
action_16 (35#) = happyShift action_57
action_16 (47#) = happyShift action_58
action_16 (48#) = happyShift action_59
action_16 (50#) = happyShift action_60
action_16 (51#) = happyShift action_61
action_16 (52#) = happyShift action_62
action_16 (30#) = happyGoto action_55
action_16 x = happyTcHack x happyReduce_62

action_17 (66#) = happyShift action_54
action_17 x = happyTcHack x happyReduce_64

action_18 (46#) = happyShift action_53
action_18 x = happyTcHack x happyFail (happyExpListPerState 18)

action_19 (36#) = happyShift action_41
action_19 (55#) = happyShift action_24
action_19 (58#) = happyShift action_27
action_19 (62#) = happyShift action_31
action_19 (68#) = happyShift action_2
action_19 (69#) = happyShift action_35
action_19 (70#) = happyShift action_36
action_19 (4#) = happyGoto action_39
action_19 (5#) = happyGoto action_6
action_19 (6#) = happyGoto action_7
action_19 (19#) = happyGoto action_11
action_19 (20#) = happyGoto action_52
action_19 x = happyTcHack x happyFail (happyExpListPerState 19)

action_20 (31#) = happyShift action_19
action_20 (36#) = happyShift action_20
action_20 (42#) = happyShift action_21
action_20 (53#) = happyShift action_23
action_20 (55#) = happyShift action_24
action_20 (57#) = happyShift action_26
action_20 (58#) = happyShift action_27
action_20 (61#) = happyShift action_30
action_20 (62#) = happyShift action_31
action_20 (63#) = happyShift action_32
action_20 (68#) = happyShift action_2
action_20 (69#) = happyShift action_35
action_20 (70#) = happyShift action_36
action_20 (4#) = happyGoto action_39
action_20 (5#) = happyGoto action_6
action_20 (6#) = happyGoto action_7
action_20 (9#) = happyGoto action_48
action_20 (10#) = happyGoto action_49
action_20 (17#) = happyGoto action_50
action_20 (19#) = happyGoto action_11
action_20 (20#) = happyGoto action_12
action_20 (21#) = happyGoto action_13
action_20 (22#) = happyGoto action_14
action_20 (23#) = happyGoto action_15
action_20 (24#) = happyGoto action_16
action_20 (25#) = happyGoto action_17
action_20 (26#) = happyGoto action_51
action_20 x = happyTcHack x happyReduce_8

action_21 (36#) = happyShift action_41
action_21 (55#) = happyShift action_24
action_21 (58#) = happyShift action_27
action_21 (62#) = happyShift action_31
action_21 (68#) = happyShift action_2
action_21 (69#) = happyShift action_35
action_21 (70#) = happyShift action_36
action_21 (4#) = happyGoto action_39
action_21 (5#) = happyGoto action_6
action_21 (6#) = happyGoto action_7
action_21 (19#) = happyGoto action_11
action_21 (20#) = happyGoto action_47
action_21 x = happyTcHack x happyFail (happyExpListPerState 21)

action_22 x = happyTcHack x happyReduce_12

action_23 x = happyTcHack x happyReduce_37

action_24 x = happyTcHack x happyReduce_46

action_25 (36#) = happyShift action_46
action_25 x = happyTcHack x happyFail (happyExpListPerState 25)

action_26 x = happyTcHack x happyReduce_35

action_27 (36#) = happyShift action_45
action_27 (53#) = happyShift action_23
action_27 (57#) = happyShift action_26
action_27 (61#) = happyShift action_30
action_27 (63#) = happyShift action_32
action_27 (17#) = happyGoto action_44
action_27 x = happyTcHack x happyFail (happyExpListPerState 27)

action_28 (36#) = happyShift action_43
action_28 x = happyTcHack x happyFail (happyExpListPerState 28)

action_29 (31#) = happyShift action_19
action_29 (36#) = happyShift action_41
action_29 (42#) = happyShift action_21
action_29 (46#) = happyShift action_42
action_29 (55#) = happyShift action_24
action_29 (58#) = happyShift action_27
action_29 (62#) = happyShift action_31
action_29 (68#) = happyShift action_2
action_29 (69#) = happyShift action_35
action_29 (70#) = happyShift action_36
action_29 (4#) = happyGoto action_39
action_29 (5#) = happyGoto action_6
action_29 (6#) = happyGoto action_7
action_29 (19#) = happyGoto action_11
action_29 (20#) = happyGoto action_12
action_29 (21#) = happyGoto action_13
action_29 (22#) = happyGoto action_14
action_29 (23#) = happyGoto action_15
action_29 (24#) = happyGoto action_16
action_29 (25#) = happyGoto action_17
action_29 (26#) = happyGoto action_40
action_29 x = happyTcHack x happyFail (happyExpListPerState 29)

action_30 x = happyTcHack x happyReduce_36

action_31 x = happyTcHack x happyReduce_45

action_32 x = happyTcHack x happyReduce_38

action_33 (36#) = happyShift action_38
action_33 x = happyTcHack x happyFail (happyExpListPerState 33)

action_34 (14#) = happyGoto action_37
action_34 x = happyTcHack x happyReduce_29

action_35 x = happyTcHack x happyReduce_2

action_36 x = happyTcHack x happyReduce_3

action_37 (31#) = happyShift action_19
action_37 (36#) = happyShift action_20
action_37 (42#) = happyShift action_21
action_37 (46#) = happyShift action_22
action_37 (53#) = happyShift action_23
action_37 (55#) = happyShift action_24
action_37 (56#) = happyShift action_25
action_37 (57#) = happyShift action_26
action_37 (58#) = happyShift action_27
action_37 (59#) = happyShift action_28
action_37 (60#) = happyShift action_29
action_37 (61#) = happyShift action_30
action_37 (62#) = happyShift action_31
action_37 (63#) = happyShift action_32
action_37 (64#) = happyShift action_33
action_37 (65#) = happyShift action_34
action_37 (67#) = happyShift action_100
action_37 (68#) = happyShift action_2
action_37 (69#) = happyShift action_35
action_37 (70#) = happyShift action_36
action_37 (4#) = happyGoto action_5
action_37 (5#) = happyGoto action_6
action_37 (6#) = happyGoto action_7
action_37 (11#) = happyGoto action_8
action_37 (13#) = happyGoto action_9
action_37 (17#) = happyGoto action_10
action_37 (19#) = happyGoto action_11
action_37 (20#) = happyGoto action_12
action_37 (21#) = happyGoto action_13
action_37 (22#) = happyGoto action_14
action_37 (23#) = happyGoto action_15
action_37 (24#) = happyGoto action_16
action_37 (25#) = happyGoto action_17
action_37 (26#) = happyGoto action_18
action_37 x = happyTcHack x happyFail (happyExpListPerState 37)

action_38 (31#) = happyShift action_19
action_38 (36#) = happyShift action_41
action_38 (42#) = happyShift action_21
action_38 (55#) = happyShift action_24
action_38 (58#) = happyShift action_27
action_38 (62#) = happyShift action_31
action_38 (68#) = happyShift action_2
action_38 (69#) = happyShift action_35
action_38 (70#) = happyShift action_36
action_38 (4#) = happyGoto action_39
action_38 (5#) = happyGoto action_6
action_38 (6#) = happyGoto action_7
action_38 (19#) = happyGoto action_11
action_38 (20#) = happyGoto action_12
action_38 (21#) = happyGoto action_13
action_38 (22#) = happyGoto action_14
action_38 (23#) = happyGoto action_15
action_38 (24#) = happyGoto action_16
action_38 (25#) = happyGoto action_17
action_38 (26#) = happyGoto action_99
action_38 x = happyTcHack x happyFail (happyExpListPerState 38)

action_39 (36#) = happyShift action_73
action_39 x = happyTcHack x happyReduce_43

action_40 (46#) = happyShift action_98
action_40 x = happyTcHack x happyFail (happyExpListPerState 40)

action_41 (31#) = happyShift action_19
action_41 (36#) = happyShift action_41
action_41 (42#) = happyShift action_21
action_41 (55#) = happyShift action_24
action_41 (58#) = happyShift action_27
action_41 (62#) = happyShift action_31
action_41 (68#) = happyShift action_2
action_41 (69#) = happyShift action_35
action_41 (70#) = happyShift action_36
action_41 (4#) = happyGoto action_39
action_41 (5#) = happyGoto action_6
action_41 (6#) = happyGoto action_7
action_41 (19#) = happyGoto action_11
action_41 (20#) = happyGoto action_12
action_41 (21#) = happyGoto action_13
action_41 (22#) = happyGoto action_14
action_41 (23#) = happyGoto action_15
action_41 (24#) = happyGoto action_16
action_41 (25#) = happyGoto action_17
action_41 (26#) = happyGoto action_51
action_41 x = happyTcHack x happyFail (happyExpListPerState 41)

action_42 x = happyTcHack x happyReduce_19

action_43 (31#) = happyShift action_19
action_43 (36#) = happyShift action_41
action_43 (42#) = happyShift action_21
action_43 (55#) = happyShift action_24
action_43 (58#) = happyShift action_27
action_43 (62#) = happyShift action_31
action_43 (68#) = happyShift action_2
action_43 (69#) = happyShift action_35
action_43 (70#) = happyShift action_36
action_43 (4#) = happyGoto action_39
action_43 (5#) = happyGoto action_6
action_43 (6#) = happyGoto action_7
action_43 (19#) = happyGoto action_11
action_43 (20#) = happyGoto action_12
action_43 (21#) = happyGoto action_13
action_43 (22#) = happyGoto action_14
action_43 (23#) = happyGoto action_15
action_43 (24#) = happyGoto action_16
action_43 (25#) = happyGoto action_17
action_43 (26#) = happyGoto action_97
action_43 x = happyTcHack x happyFail (happyExpListPerState 43)

action_44 (36#) = happyShift action_96
action_44 x = happyTcHack x happyFail (happyExpListPerState 44)

action_45 (36#) = happyShift action_45
action_45 (53#) = happyShift action_23
action_45 (57#) = happyShift action_26
action_45 (61#) = happyShift action_30
action_45 (63#) = happyShift action_32
action_45 (9#) = happyGoto action_48
action_45 (10#) = happyGoto action_49
action_45 (17#) = happyGoto action_50
action_45 x = happyTcHack x happyReduce_8

action_46 (31#) = happyShift action_19
action_46 (36#) = happyShift action_41
action_46 (42#) = happyShift action_21
action_46 (55#) = happyShift action_24
action_46 (58#) = happyShift action_27
action_46 (62#) = happyShift action_31
action_46 (68#) = happyShift action_2
action_46 (69#) = happyShift action_35
action_46 (70#) = happyShift action_36
action_46 (4#) = happyGoto action_39
action_46 (5#) = happyGoto action_6
action_46 (6#) = happyGoto action_7
action_46 (19#) = happyGoto action_11
action_46 (20#) = happyGoto action_12
action_46 (21#) = happyGoto action_13
action_46 (22#) = happyGoto action_14
action_46 (23#) = happyGoto action_15
action_46 (24#) = happyGoto action_16
action_46 (25#) = happyGoto action_17
action_46 (26#) = happyGoto action_95
action_46 x = happyTcHack x happyFail (happyExpListPerState 46)

action_47 x = happyTcHack x happyReduce_52

action_48 (41#) = happyShift action_94
action_48 x = happyTcHack x happyReduce_9

action_49 (37#) = happyShift action_93
action_49 x = happyTcHack x happyFail (happyExpListPerState 49)

action_50 (34#) = happyShift action_92
action_50 x = happyTcHack x happyReduce_7

action_51 (37#) = happyShift action_91
action_51 x = happyTcHack x happyFail (happyExpListPerState 51)

action_52 x = happyTcHack x happyReduce_53

action_53 x = happyTcHack x happyReduce_23

action_54 (31#) = happyShift action_19
action_54 (36#) = happyShift action_41
action_54 (42#) = happyShift action_21
action_54 (55#) = happyShift action_24
action_54 (58#) = happyShift action_27
action_54 (62#) = happyShift action_31
action_54 (68#) = happyShift action_2
action_54 (69#) = happyShift action_35
action_54 (70#) = happyShift action_36
action_54 (4#) = happyGoto action_39
action_54 (5#) = happyGoto action_6
action_54 (6#) = happyGoto action_7
action_54 (19#) = happyGoto action_11
action_54 (20#) = happyGoto action_12
action_54 (21#) = happyGoto action_13
action_54 (22#) = happyGoto action_14
action_54 (23#) = happyGoto action_15
action_54 (24#) = happyGoto action_16
action_54 (25#) = happyGoto action_17
action_54 (26#) = happyGoto action_90
action_54 x = happyTcHack x happyFail (happyExpListPerState 54)

action_55 (31#) = happyShift action_19
action_55 (36#) = happyShift action_41
action_55 (42#) = happyShift action_21
action_55 (55#) = happyShift action_24
action_55 (58#) = happyShift action_27
action_55 (62#) = happyShift action_31
action_55 (68#) = happyShift action_2
action_55 (69#) = happyShift action_35
action_55 (70#) = happyShift action_36
action_55 (4#) = happyGoto action_39
action_55 (5#) = happyGoto action_6
action_55 (6#) = happyGoto action_7
action_55 (19#) = happyGoto action_11
action_55 (20#) = happyGoto action_12
action_55 (21#) = happyGoto action_13
action_55 (22#) = happyGoto action_14
action_55 (23#) = happyGoto action_89
action_55 x = happyTcHack x happyFail (happyExpListPerState 55)

action_56 x = happyTcHack x happyReduce_78

action_57 (31#) = happyShift action_19
action_57 (36#) = happyShift action_41
action_57 (42#) = happyShift action_21
action_57 (55#) = happyShift action_24
action_57 (58#) = happyShift action_27
action_57 (62#) = happyShift action_31
action_57 (68#) = happyShift action_2
action_57 (69#) = happyShift action_35
action_57 (70#) = happyShift action_36
action_57 (4#) = happyGoto action_39
action_57 (5#) = happyGoto action_6
action_57 (6#) = happyGoto action_7
action_57 (19#) = happyGoto action_11
action_57 (20#) = happyGoto action_12
action_57 (21#) = happyGoto action_13
action_57 (22#) = happyGoto action_14
action_57 (23#) = happyGoto action_15
action_57 (24#) = happyGoto action_16
action_57 (25#) = happyGoto action_88
action_57 x = happyTcHack x happyFail (happyExpListPerState 57)

action_58 x = happyTcHack x happyReduce_73

action_59 x = happyTcHack x happyReduce_74

action_60 x = happyTcHack x happyReduce_77

action_61 x = happyTcHack x happyReduce_75

action_62 x = happyTcHack x happyReduce_76

action_63 (31#) = happyShift action_19
action_63 (36#) = happyShift action_41
action_63 (42#) = happyShift action_21
action_63 (55#) = happyShift action_24
action_63 (58#) = happyShift action_27
action_63 (62#) = happyShift action_31
action_63 (68#) = happyShift action_2
action_63 (69#) = happyShift action_35
action_63 (70#) = happyShift action_36
action_63 (4#) = happyGoto action_39
action_63 (5#) = happyGoto action_6
action_63 (6#) = happyGoto action_7
action_63 (19#) = happyGoto action_11
action_63 (20#) = happyGoto action_12
action_63 (21#) = happyGoto action_13
action_63 (22#) = happyGoto action_87
action_63 x = happyTcHack x happyFail (happyExpListPerState 63)

action_64 x = happyTcHack x happyReduce_68

action_65 x = happyTcHack x happyReduce_69

action_66 (31#) = happyShift action_19
action_66 (36#) = happyShift action_41
action_66 (42#) = happyShift action_21
action_66 (55#) = happyShift action_24
action_66 (58#) = happyShift action_27
action_66 (62#) = happyShift action_31
action_66 (68#) = happyShift action_2
action_66 (69#) = happyShift action_35
action_66 (70#) = happyShift action_36
action_66 (4#) = happyGoto action_39
action_66 (5#) = happyGoto action_6
action_66 (6#) = happyGoto action_7
action_66 (19#) = happyGoto action_11
action_66 (20#) = happyGoto action_12
action_66 (21#) = happyGoto action_86
action_66 x = happyTcHack x happyFail (happyExpListPerState 66)

action_67 x = happyTcHack x happyReduce_72

action_68 x = happyTcHack x happyReduce_70

action_69 x = happyTcHack x happyReduce_71

action_70 (36#) = happyShift action_84
action_70 (49#) = happyShift action_85
action_70 x = happyTcHack x happyReduce_31

action_71 (41#) = happyShift action_83
action_71 x = happyTcHack x happyReduce_33

action_72 (46#) = happyShift action_82
action_72 x = happyTcHack x happyFail (happyExpListPerState 72)

action_73 (31#) = happyShift action_19
action_73 (36#) = happyShift action_41
action_73 (42#) = happyShift action_21
action_73 (55#) = happyShift action_24
action_73 (58#) = happyShift action_27
action_73 (62#) = happyShift action_31
action_73 (68#) = happyShift action_2
action_73 (69#) = happyShift action_35
action_73 (70#) = happyShift action_36
action_73 (4#) = happyGoto action_39
action_73 (5#) = happyGoto action_6
action_73 (6#) = happyGoto action_7
action_73 (19#) = happyGoto action_11
action_73 (20#) = happyGoto action_12
action_73 (21#) = happyGoto action_13
action_73 (22#) = happyGoto action_14
action_73 (23#) = happyGoto action_15
action_73 (24#) = happyGoto action_16
action_73 (25#) = happyGoto action_17
action_73 (26#) = happyGoto action_80
action_73 (27#) = happyGoto action_81
action_73 x = happyTcHack x happyReduce_65

action_74 (46#) = happyShift action_79
action_74 x = happyTcHack x happyFail (happyExpListPerState 74)

action_75 (46#) = happyShift action_78
action_75 x = happyTcHack x happyFail (happyExpListPerState 75)

action_76 (31#) = happyShift action_19
action_76 (36#) = happyShift action_41
action_76 (42#) = happyShift action_21
action_76 (55#) = happyShift action_24
action_76 (58#) = happyShift action_27
action_76 (62#) = happyShift action_31
action_76 (68#) = happyShift action_2
action_76 (69#) = happyShift action_35
action_76 (70#) = happyShift action_36
action_76 (4#) = happyGoto action_39
action_76 (5#) = happyGoto action_6
action_76 (6#) = happyGoto action_7
action_76 (19#) = happyGoto action_11
action_76 (20#) = happyGoto action_12
action_76 (21#) = happyGoto action_13
action_76 (22#) = happyGoto action_14
action_76 (23#) = happyGoto action_15
action_76 (24#) = happyGoto action_16
action_76 (25#) = happyGoto action_17
action_76 (26#) = happyGoto action_77
action_76 x = happyTcHack x happyFail (happyExpListPerState 76)

action_77 (46#) = happyShift action_115
action_77 x = happyTcHack x happyFail (happyExpListPerState 77)

action_78 x = happyTcHack x happyReduce_17

action_79 x = happyTcHack x happyReduce_16

action_80 (41#) = happyShift action_114
action_80 x = happyTcHack x happyReduce_66

action_81 (37#) = happyShift action_113
action_81 x = happyTcHack x happyFail (happyExpListPerState 81)

action_82 x = happyTcHack x happyReduce_14

action_83 (68#) = happyShift action_2
action_83 (4#) = happyGoto action_111
action_83 (15#) = happyGoto action_71
action_83 (16#) = happyGoto action_112
action_83 x = happyTcHack x happyFail (happyExpListPerState 83)

action_84 (36#) = happyShift action_45
action_84 (53#) = happyShift action_23
action_84 (57#) = happyShift action_26
action_84 (61#) = happyShift action_30
action_84 (63#) = happyShift action_32
action_84 (8#) = happyGoto action_103
action_84 (9#) = happyGoto action_104
action_84 (12#) = happyGoto action_110
action_84 (17#) = happyGoto action_50
action_84 x = happyTcHack x happyReduce_25

action_85 (31#) = happyShift action_19
action_85 (36#) = happyShift action_41
action_85 (42#) = happyShift action_21
action_85 (55#) = happyShift action_24
action_85 (58#) = happyShift action_27
action_85 (62#) = happyShift action_31
action_85 (68#) = happyShift action_2
action_85 (69#) = happyShift action_35
action_85 (70#) = happyShift action_36
action_85 (4#) = happyGoto action_39
action_85 (5#) = happyGoto action_6
action_85 (6#) = happyGoto action_7
action_85 (19#) = happyGoto action_11
action_85 (20#) = happyGoto action_12
action_85 (21#) = happyGoto action_13
action_85 (22#) = happyGoto action_14
action_85 (23#) = happyGoto action_15
action_85 (24#) = happyGoto action_16
action_85 (25#) = happyGoto action_17
action_85 (26#) = happyGoto action_109
action_85 x = happyTcHack x happyFail (happyExpListPerState 85)

action_86 x = happyTcHack x happyReduce_55

action_87 (33#) = happyShift action_67
action_87 (38#) = happyShift action_68
action_87 (45#) = happyShift action_69
action_87 (29#) = happyGoto action_66
action_87 x = happyTcHack x happyReduce_57

action_88 x = happyTcHack x happyReduce_61

action_89 (39#) = happyShift action_64
action_89 (42#) = happyShift action_65
action_89 (28#) = happyGoto action_63
action_89 x = happyTcHack x happyReduce_59

action_90 x = happyTcHack x happyReduce_63

action_91 x = happyTcHack x happyReduce_49

action_92 x = happyTcHack x happyReduce_6

action_93 (44#) = happyShift action_108
action_93 x = happyTcHack x happyFail (happyExpListPerState 93)

action_94 (36#) = happyShift action_45
action_94 (53#) = happyShift action_23
action_94 (57#) = happyShift action_26
action_94 (61#) = happyShift action_30
action_94 (63#) = happyShift action_32
action_94 (9#) = happyGoto action_48
action_94 (10#) = happyGoto action_107
action_94 (17#) = happyGoto action_50
action_94 x = happyTcHack x happyReduce_8

action_95 (37#) = happyShift action_106
action_95 x = happyTcHack x happyFail (happyExpListPerState 95)

action_96 (36#) = happyShift action_45
action_96 (53#) = happyShift action_23
action_96 (57#) = happyShift action_26
action_96 (61#) = happyShift action_30
action_96 (63#) = happyShift action_32
action_96 (8#) = happyGoto action_103
action_96 (9#) = happyGoto action_104
action_96 (12#) = happyGoto action_105
action_96 (17#) = happyGoto action_50
action_96 x = happyTcHack x happyReduce_25

action_97 (37#) = happyShift action_102
action_97 x = happyTcHack x happyFail (happyExpListPerState 97)

action_98 x = happyTcHack x happyReduce_18

action_99 (37#) = happyShift action_101
action_99 x = happyTcHack x happyFail (happyExpListPerState 99)

action_100 x = happyTcHack x happyReduce_28

action_101 (31#) = happyShift action_19
action_101 (36#) = happyShift action_20
action_101 (42#) = happyShift action_21
action_101 (46#) = happyShift action_22
action_101 (53#) = happyShift action_23
action_101 (55#) = happyShift action_24
action_101 (56#) = happyShift action_25
action_101 (57#) = happyShift action_26
action_101 (58#) = happyShift action_27
action_101 (59#) = happyShift action_28
action_101 (60#) = happyShift action_29
action_101 (61#) = happyShift action_30
action_101 (62#) = happyShift action_31
action_101 (63#) = happyShift action_32
action_101 (64#) = happyShift action_33
action_101 (65#) = happyShift action_34
action_101 (68#) = happyShift action_2
action_101 (69#) = happyShift action_35
action_101 (70#) = happyShift action_36
action_101 (4#) = happyGoto action_5
action_101 (5#) = happyGoto action_6
action_101 (6#) = happyGoto action_7
action_101 (11#) = happyGoto action_123
action_101 (13#) = happyGoto action_9
action_101 (17#) = happyGoto action_10
action_101 (19#) = happyGoto action_11
action_101 (20#) = happyGoto action_12
action_101 (21#) = happyGoto action_13
action_101 (22#) = happyGoto action_14
action_101 (23#) = happyGoto action_15
action_101 (24#) = happyGoto action_16
action_101 (25#) = happyGoto action_17
action_101 (26#) = happyGoto action_18
action_101 x = happyTcHack x happyFail (happyExpListPerState 101)

action_102 x = happyTcHack x happyReduce_24

action_103 (41#) = happyShift action_122
action_103 x = happyTcHack x happyReduce_26

action_104 (68#) = happyShift action_2
action_104 (4#) = happyGoto action_121
action_104 x = happyTcHack x happyFail (happyExpListPerState 104)

action_105 (37#) = happyShift action_120
action_105 x = happyTcHack x happyFail (happyExpListPerState 105)

action_106 (31#) = happyShift action_19
action_106 (36#) = happyShift action_20
action_106 (42#) = happyShift action_21
action_106 (46#) = happyShift action_22
action_106 (53#) = happyShift action_23
action_106 (55#) = happyShift action_24
action_106 (56#) = happyShift action_25
action_106 (57#) = happyShift action_26
action_106 (58#) = happyShift action_27
action_106 (59#) = happyShift action_28
action_106 (60#) = happyShift action_29
action_106 (61#) = happyShift action_30
action_106 (62#) = happyShift action_31
action_106 (63#) = happyShift action_32
action_106 (64#) = happyShift action_33
action_106 (65#) = happyShift action_34
action_106 (68#) = happyShift action_2
action_106 (69#) = happyShift action_35
action_106 (70#) = happyShift action_36
action_106 (4#) = happyGoto action_5
action_106 (5#) = happyGoto action_6
action_106 (6#) = happyGoto action_7
action_106 (11#) = happyGoto action_119
action_106 (13#) = happyGoto action_9
action_106 (17#) = happyGoto action_10
action_106 (19#) = happyGoto action_11
action_106 (20#) = happyGoto action_12
action_106 (21#) = happyGoto action_13
action_106 (22#) = happyGoto action_14
action_106 (23#) = happyGoto action_15
action_106 (24#) = happyGoto action_16
action_106 (25#) = happyGoto action_17
action_106 (26#) = happyGoto action_18
action_106 x = happyTcHack x happyFail (happyExpListPerState 106)

action_107 x = happyTcHack x happyReduce_10

action_108 (36#) = happyShift action_45
action_108 (53#) = happyShift action_23
action_108 (57#) = happyShift action_26
action_108 (61#) = happyShift action_30
action_108 (63#) = happyShift action_32
action_108 (17#) = happyGoto action_118
action_108 x = happyTcHack x happyFail (happyExpListPerState 108)

action_109 x = happyTcHack x happyReduce_32

action_110 (37#) = happyShift action_117
action_110 x = happyTcHack x happyFail (happyExpListPerState 110)

action_111 (49#) = happyShift action_85
action_111 x = happyTcHack x happyReduce_31

action_112 x = happyTcHack x happyReduce_34

action_113 x = happyTcHack x happyReduce_47

action_114 (31#) = happyShift action_19
action_114 (36#) = happyShift action_41
action_114 (42#) = happyShift action_21
action_114 (55#) = happyShift action_24
action_114 (58#) = happyShift action_27
action_114 (62#) = happyShift action_31
action_114 (68#) = happyShift action_2
action_114 (69#) = happyShift action_35
action_114 (70#) = happyShift action_36
action_114 (4#) = happyGoto action_39
action_114 (5#) = happyGoto action_6
action_114 (6#) = happyGoto action_7
action_114 (19#) = happyGoto action_11
action_114 (20#) = happyGoto action_12
action_114 (21#) = happyGoto action_13
action_114 (22#) = happyGoto action_14
action_114 (23#) = happyGoto action_15
action_114 (24#) = happyGoto action_16
action_114 (25#) = happyGoto action_17
action_114 (26#) = happyGoto action_80
action_114 (27#) = happyGoto action_116
action_114 x = happyTcHack x happyReduce_65

action_115 x = happyTcHack x happyReduce_15

action_116 x = happyTcHack x happyReduce_67

action_117 (65#) = happyShift action_34
action_117 (13#) = happyGoto action_127
action_117 x = happyTcHack x happyFail (happyExpListPerState 117)

action_118 x = happyTcHack x happyReduce_39

action_119 (54#) = happyShift action_126
action_119 x = happyTcHack x happyReduce_20

action_120 (65#) = happyShift action_34
action_120 (13#) = happyGoto action_125
action_120 x = happyTcHack x happyFail (happyExpListPerState 120)

action_121 x = happyTcHack x happyReduce_5

action_122 (36#) = happyShift action_45
action_122 (53#) = happyShift action_23
action_122 (57#) = happyShift action_26
action_122 (61#) = happyShift action_30
action_122 (63#) = happyShift action_32
action_122 (8#) = happyGoto action_103
action_122 (9#) = happyGoto action_104
action_122 (12#) = happyGoto action_124
action_122 (17#) = happyGoto action_50
action_122 x = happyTcHack x happyReduce_25

action_123 x = happyTcHack x happyReduce_22

action_124 x = happyTcHack x happyReduce_27

action_125 x = happyTcHack x happyReduce_50

action_126 (31#) = happyShift action_19
action_126 (36#) = happyShift action_20
action_126 (42#) = happyShift action_21
action_126 (46#) = happyShift action_22
action_126 (53#) = happyShift action_23
action_126 (55#) = happyShift action_24
action_126 (56#) = happyShift action_25
action_126 (57#) = happyShift action_26
action_126 (58#) = happyShift action_27
action_126 (59#) = happyShift action_28
action_126 (60#) = happyShift action_29
action_126 (61#) = happyShift action_30
action_126 (62#) = happyShift action_31
action_126 (63#) = happyShift action_32
action_126 (64#) = happyShift action_33
action_126 (65#) = happyShift action_34
action_126 (68#) = happyShift action_2
action_126 (69#) = happyShift action_35
action_126 (70#) = happyShift action_36
action_126 (4#) = happyGoto action_5
action_126 (5#) = happyGoto action_6
action_126 (6#) = happyGoto action_7
action_126 (11#) = happyGoto action_128
action_126 (13#) = happyGoto action_9
action_126 (17#) = happyGoto action_10
action_126 (19#) = happyGoto action_11
action_126 (20#) = happyGoto action_12
action_126 (21#) = happyGoto action_13
action_126 (22#) = happyGoto action_14
action_126 (23#) = happyGoto action_15
action_126 (24#) = happyGoto action_16
action_126 (25#) = happyGoto action_17
action_126 (26#) = happyGoto action_18
action_126 x = happyTcHack x happyFail (happyExpListPerState 126)

action_127 x = happyTcHack x happyReduce_11

action_128 x = happyTcHack x happyReduce_21

happyReduce_1 = happySpecReduce_1  4# happyReduction_1
happyReduction_1 (HappyTerminal (PT _ (TV happy_var_1)))
	 =  HappyAbsSyn4
		 (Ident happy_var_1
	)
happyReduction_1 _  = notHappyAtAll 

happyReduce_2 = happySpecReduce_1  5# happyReduction_2
happyReduction_2 (HappyTerminal (PT _ (TI happy_var_1)))
	 =  HappyAbsSyn5
		 ((read ( happy_var_1)) :: Integer
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_1  6# happyReduction_3
happyReduction_3 (HappyTerminal (PT _ (TL happy_var_1)))
	 =  HappyAbsSyn6
		 (happy_var_1
	)
happyReduction_3 _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_1  7# happyReduction_4
happyReduction_4 (HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn7
		 (AbsLatte.Program () (reverse happy_var_1)
	)
happyReduction_4 _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  8# happyReduction_5
happyReduction_5 (HappyAbsSyn4  happy_var_2)
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn8
		 (AbsLatte.Arg () happy_var_1 happy_var_2
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_2  9# happyReduction_6
happyReduction_6 _
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn9
		 (AbsLatte.RefArgType () happy_var_1
	)
happyReduction_6 _ _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_1  9# happyReduction_7
happyReduction_7 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn9
		 (AbsLatte.ValueArgType () happy_var_1
	)
happyReduction_7 _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_0  10# happyReduction_8
happyReduction_8  =  HappyAbsSyn10
		 ([]
	)

happyReduce_9 = happySpecReduce_1  10# happyReduction_9
happyReduction_9 (HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ((:[]) happy_var_1
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_3  10# happyReduction_10
happyReduction_10 (HappyAbsSyn10  happy_var_3)
	_
	(HappyAbsSyn9  happy_var_1)
	 =  HappyAbsSyn10
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_10 _ _ _  = notHappyAtAll 

happyReduce_11 = happyReduce 6# 11# happyReduction_11
happyReduction_11 ((HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_2) `HappyStk`
	(HappyAbsSyn17  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AbsLatte.FnDef () happy_var_1 happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_12 = happySpecReduce_1  11# happyReduction_12
happyReduction_12 _
	 =  HappyAbsSyn11
		 (AbsLatte.Empty ()
	)

happyReduce_13 = happySpecReduce_1  11# happyReduction_13
happyReduction_13 (HappyAbsSyn13  happy_var_1)
	 =  HappyAbsSyn11
		 (AbsLatte.BStmt () happy_var_1
	)
happyReduction_13 _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  11# happyReduction_14
happyReduction_14 _
	(HappyAbsSyn16  happy_var_2)
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn11
		 (AbsLatte.Decl () happy_var_1 happy_var_2
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happyReduce 4# 11# happyReduction_15
happyReduction_15 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AbsLatte.Ass () happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_16 = happySpecReduce_3  11# happyReduction_16
happyReduction_16 _
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn11
		 (AbsLatte.Incr () happy_var_1
	)
happyReduction_16 _ _ _  = notHappyAtAll 

happyReduce_17 = happySpecReduce_3  11# happyReduction_17
happyReduction_17 _
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn11
		 (AbsLatte.Decr () happy_var_1
	)
happyReduction_17 _ _ _  = notHappyAtAll 

happyReduce_18 = happySpecReduce_3  11# happyReduction_18
happyReduction_18 _
	(HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn11
		 (AbsLatte.Ret () happy_var_2
	)
happyReduction_18 _ _ _  = notHappyAtAll 

happyReduce_19 = happySpecReduce_2  11# happyReduction_19
happyReduction_19 _
	_
	 =  HappyAbsSyn11
		 (AbsLatte.VRet ()
	)

happyReduce_20 = happyReduce 5# 11# happyReduction_20
happyReduction_20 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AbsLatte.Cond () happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_21 = happyReduce 7# 11# happyReduction_21
happyReduction_21 ((HappyAbsSyn11  happy_var_7) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AbsLatte.CondElse () happy_var_3 happy_var_5 happy_var_7
	) `HappyStk` happyRest

happyReduce_22 = happyReduce 5# 11# happyReduction_22
happyReduction_22 ((HappyAbsSyn11  happy_var_5) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AbsLatte.While () happy_var_3 happy_var_5
	) `HappyStk` happyRest

happyReduce_23 = happySpecReduce_2  11# happyReduction_23
happyReduction_23 _
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn11
		 (AbsLatte.SExp () happy_var_1
	)
happyReduction_23 _ _  = notHappyAtAll 

happyReduce_24 = happyReduce 4# 11# happyReduction_24
happyReduction_24 (_ `HappyStk`
	(HappyAbsSyn26  happy_var_3) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn11
		 (AbsLatte.Print () happy_var_3
	) `HappyStk` happyRest

happyReduce_25 = happySpecReduce_0  12# happyReduction_25
happyReduction_25  =  HappyAbsSyn12
		 ([]
	)

happyReduce_26 = happySpecReduce_1  12# happyReduction_26
happyReduction_26 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn12
		 ((:[]) happy_var_1
	)
happyReduction_26 _  = notHappyAtAll 

happyReduce_27 = happySpecReduce_3  12# happyReduction_27
happyReduction_27 (HappyAbsSyn12  happy_var_3)
	_
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn12
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_27 _ _ _  = notHappyAtAll 

happyReduce_28 = happySpecReduce_3  13# happyReduction_28
happyReduction_28 _
	(HappyAbsSyn14  happy_var_2)
	_
	 =  HappyAbsSyn13
		 (AbsLatte.Block () (reverse happy_var_2)
	)
happyReduction_28 _ _ _  = notHappyAtAll 

happyReduce_29 = happySpecReduce_0  14# happyReduction_29
happyReduction_29  =  HappyAbsSyn14
		 ([]
	)

happyReduce_30 = happySpecReduce_2  14# happyReduction_30
happyReduction_30 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn14  happy_var_1)
	 =  HappyAbsSyn14
		 (flip (:) happy_var_1 happy_var_2
	)
happyReduction_30 _ _  = notHappyAtAll 

happyReduce_31 = happySpecReduce_1  15# happyReduction_31
happyReduction_31 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsLatte.NoInit () happy_var_1
	)
happyReduction_31 _  = notHappyAtAll 

happyReduce_32 = happySpecReduce_3  15# happyReduction_32
happyReduction_32 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn15
		 (AbsLatte.Init () happy_var_1 happy_var_3
	)
happyReduction_32 _ _ _  = notHappyAtAll 

happyReduce_33 = happySpecReduce_1  16# happyReduction_33
happyReduction_33 (HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 ((:[]) happy_var_1
	)
happyReduction_33 _  = notHappyAtAll 

happyReduce_34 = happySpecReduce_3  16# happyReduction_34
happyReduction_34 (HappyAbsSyn16  happy_var_3)
	_
	(HappyAbsSyn15  happy_var_1)
	 =  HappyAbsSyn16
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_34 _ _ _  = notHappyAtAll 

happyReduce_35 = happySpecReduce_1  17# happyReduction_35
happyReduction_35 _
	 =  HappyAbsSyn17
		 (AbsLatte.Int ()
	)

happyReduce_36 = happySpecReduce_1  17# happyReduction_36
happyReduction_36 _
	 =  HappyAbsSyn17
		 (AbsLatte.Str ()
	)

happyReduce_37 = happySpecReduce_1  17# happyReduction_37
happyReduction_37 _
	 =  HappyAbsSyn17
		 (AbsLatte.Bool ()
	)

happyReduce_38 = happySpecReduce_1  17# happyReduction_38
happyReduction_38 _
	 =  HappyAbsSyn17
		 (AbsLatte.Void ()
	)

happyReduce_39 = happyReduce 5# 17# happyReduction_39
happyReduction_39 ((HappyAbsSyn17  happy_var_5) `HappyStk`
	_ `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn10  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn17
		 (AbsLatte.Fun () happy_var_2 happy_var_5
	) `HappyStk` happyRest

happyReduce_40 = happySpecReduce_0  18# happyReduction_40
happyReduction_40  =  HappyAbsSyn18
		 ([]
	)

happyReduce_41 = happySpecReduce_1  18# happyReduction_41
happyReduction_41 (HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 ((:[]) happy_var_1
	)
happyReduction_41 _  = notHappyAtAll 

happyReduce_42 = happySpecReduce_3  18# happyReduction_42
happyReduction_42 (HappyAbsSyn18  happy_var_3)
	_
	(HappyAbsSyn17  happy_var_1)
	 =  HappyAbsSyn18
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_42 _ _ _  = notHappyAtAll 

happyReduce_43 = happySpecReduce_1  19# happyReduction_43
happyReduction_43 (HappyAbsSyn4  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsLatte.EVar () happy_var_1
	)
happyReduction_43 _  = notHappyAtAll 

happyReduce_44 = happySpecReduce_1  19# happyReduction_44
happyReduction_44 (HappyAbsSyn5  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsLatte.ELitInt () happy_var_1
	)
happyReduction_44 _  = notHappyAtAll 

happyReduce_45 = happySpecReduce_1  19# happyReduction_45
happyReduction_45 _
	 =  HappyAbsSyn19
		 (AbsLatte.ELitTrue ()
	)

happyReduce_46 = happySpecReduce_1  19# happyReduction_46
happyReduction_46 _
	 =  HappyAbsSyn19
		 (AbsLatte.ELitFalse ()
	)

happyReduce_47 = happyReduce 4# 19# happyReduction_47
happyReduction_47 (_ `HappyStk`
	(HappyAbsSyn27  happy_var_3) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn4  happy_var_1) `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (AbsLatte.EApp () happy_var_1 happy_var_3
	) `HappyStk` happyRest

happyReduce_48 = happySpecReduce_1  19# happyReduction_48
happyReduction_48 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsLatte.EString () happy_var_1
	)
happyReduction_48 _  = notHappyAtAll 

happyReduce_49 = happySpecReduce_3  19# happyReduction_49
happyReduction_49 _
	(HappyAbsSyn26  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (happy_var_2
	)
happyReduction_49 _ _ _  = notHappyAtAll 

happyReduce_50 = happyReduce 6# 20# happyReduction_50
happyReduction_50 ((HappyAbsSyn13  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn12  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn17  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn19
		 (AbsLatte.Anonymoys () happy_var_2 happy_var_4 happy_var_6
	) `HappyStk` happyRest

happyReduce_51 = happySpecReduce_1  20# happyReduction_51
happyReduction_51 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_51 _  = notHappyAtAll 

happyReduce_52 = happySpecReduce_2  21# happyReduction_52
happyReduction_52 (HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (AbsLatte.Neg () happy_var_2
	)
happyReduction_52 _ _  = notHappyAtAll 

happyReduce_53 = happySpecReduce_2  21# happyReduction_53
happyReduction_53 (HappyAbsSyn19  happy_var_2)
	_
	 =  HappyAbsSyn19
		 (AbsLatte.Not () happy_var_2
	)
happyReduction_53 _ _  = notHappyAtAll 

happyReduce_54 = happySpecReduce_1  21# happyReduction_54
happyReduction_54 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_54 _  = notHappyAtAll 

happyReduce_55 = happySpecReduce_3  22# happyReduction_55
happyReduction_55 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn29  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsLatte.EMul () happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_55 _ _ _  = notHappyAtAll 

happyReduce_56 = happySpecReduce_1  22# happyReduction_56
happyReduction_56 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_56 _  = notHappyAtAll 

happyReduce_57 = happySpecReduce_3  23# happyReduction_57
happyReduction_57 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn28  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsLatte.EAdd () happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_57 _ _ _  = notHappyAtAll 

happyReduce_58 = happySpecReduce_1  23# happyReduction_58
happyReduction_58 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_58 _  = notHappyAtAll 

happyReduce_59 = happySpecReduce_3  24# happyReduction_59
happyReduction_59 (HappyAbsSyn19  happy_var_3)
	(HappyAbsSyn30  happy_var_2)
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsLatte.ERel () happy_var_1 happy_var_2 happy_var_3
	)
happyReduction_59 _ _ _  = notHappyAtAll 

happyReduce_60 = happySpecReduce_1  24# happyReduction_60
happyReduction_60 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_60 _  = notHappyAtAll 

happyReduce_61 = happySpecReduce_3  25# happyReduction_61
happyReduction_61 (HappyAbsSyn19  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (AbsLatte.EAnd () happy_var_1 happy_var_3
	)
happyReduction_61 _ _ _  = notHappyAtAll 

happyReduce_62 = happySpecReduce_1  25# happyReduction_62
happyReduction_62 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn19
		 (happy_var_1
	)
happyReduction_62 _  = notHappyAtAll 

happyReduce_63 = happySpecReduce_3  26# happyReduction_63
happyReduction_63 (HappyAbsSyn26  happy_var_3)
	_
	(HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn26
		 (AbsLatte.EOr () happy_var_1 happy_var_3
	)
happyReduction_63 _ _ _  = notHappyAtAll 

happyReduce_64 = happySpecReduce_1  26# happyReduction_64
happyReduction_64 (HappyAbsSyn19  happy_var_1)
	 =  HappyAbsSyn26
		 (happy_var_1
	)
happyReduction_64 _  = notHappyAtAll 

happyReduce_65 = happySpecReduce_0  27# happyReduction_65
happyReduction_65  =  HappyAbsSyn27
		 ([]
	)

happyReduce_66 = happySpecReduce_1  27# happyReduction_66
happyReduction_66 (HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn27
		 ((:[]) happy_var_1
	)
happyReduction_66 _  = notHappyAtAll 

happyReduce_67 = happySpecReduce_3  27# happyReduction_67
happyReduction_67 (HappyAbsSyn27  happy_var_3)
	_
	(HappyAbsSyn26  happy_var_1)
	 =  HappyAbsSyn27
		 ((:) happy_var_1 happy_var_3
	)
happyReduction_67 _ _ _  = notHappyAtAll 

happyReduce_68 = happySpecReduce_1  28# happyReduction_68
happyReduction_68 _
	 =  HappyAbsSyn28
		 (AbsLatte.Plus ()
	)

happyReduce_69 = happySpecReduce_1  28# happyReduction_69
happyReduction_69 _
	 =  HappyAbsSyn28
		 (AbsLatte.Minus ()
	)

happyReduce_70 = happySpecReduce_1  29# happyReduction_70
happyReduction_70 _
	 =  HappyAbsSyn29
		 (AbsLatte.Times ()
	)

happyReduce_71 = happySpecReduce_1  29# happyReduction_71
happyReduction_71 _
	 =  HappyAbsSyn29
		 (AbsLatte.Div ()
	)

happyReduce_72 = happySpecReduce_1  29# happyReduction_72
happyReduction_72 _
	 =  HappyAbsSyn29
		 (AbsLatte.Mod ()
	)

happyReduce_73 = happySpecReduce_1  30# happyReduction_73
happyReduction_73 _
	 =  HappyAbsSyn30
		 (AbsLatte.LTH ()
	)

happyReduce_74 = happySpecReduce_1  30# happyReduction_74
happyReduction_74 _
	 =  HappyAbsSyn30
		 (AbsLatte.LE ()
	)

happyReduce_75 = happySpecReduce_1  30# happyReduction_75
happyReduction_75 _
	 =  HappyAbsSyn30
		 (AbsLatte.GTH ()
	)

happyReduce_76 = happySpecReduce_1  30# happyReduction_76
happyReduction_76 _
	 =  HappyAbsSyn30
		 (AbsLatte.GE ()
	)

happyReduce_77 = happySpecReduce_1  30# happyReduction_77
happyReduction_77 _
	 =  HappyAbsSyn30
		 (AbsLatte.EQU ()
	)

happyReduce_78 = happySpecReduce_1  30# happyReduction_78
happyReduction_78 _
	 =  HappyAbsSyn30
		 (AbsLatte.NE ()
	)

happyNewToken action sts stk [] =
	action 71# 71# notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	PT _ (TS _ 1) -> cont 31#;
	PT _ (TS _ 2) -> cont 32#;
	PT _ (TS _ 3) -> cont 33#;
	PT _ (TS _ 4) -> cont 34#;
	PT _ (TS _ 5) -> cont 35#;
	PT _ (TS _ 6) -> cont 36#;
	PT _ (TS _ 7) -> cont 37#;
	PT _ (TS _ 8) -> cont 38#;
	PT _ (TS _ 9) -> cont 39#;
	PT _ (TS _ 10) -> cont 40#;
	PT _ (TS _ 11) -> cont 41#;
	PT _ (TS _ 12) -> cont 42#;
	PT _ (TS _ 13) -> cont 43#;
	PT _ (TS _ 14) -> cont 44#;
	PT _ (TS _ 15) -> cont 45#;
	PT _ (TS _ 16) -> cont 46#;
	PT _ (TS _ 17) -> cont 47#;
	PT _ (TS _ 18) -> cont 48#;
	PT _ (TS _ 19) -> cont 49#;
	PT _ (TS _ 20) -> cont 50#;
	PT _ (TS _ 21) -> cont 51#;
	PT _ (TS _ 22) -> cont 52#;
	PT _ (TS _ 23) -> cont 53#;
	PT _ (TS _ 24) -> cont 54#;
	PT _ (TS _ 25) -> cont 55#;
	PT _ (TS _ 26) -> cont 56#;
	PT _ (TS _ 27) -> cont 57#;
	PT _ (TS _ 28) -> cont 58#;
	PT _ (TS _ 29) -> cont 59#;
	PT _ (TS _ 30) -> cont 60#;
	PT _ (TS _ 31) -> cont 61#;
	PT _ (TS _ 32) -> cont 62#;
	PT _ (TS _ 33) -> cont 63#;
	PT _ (TS _ 34) -> cont 64#;
	PT _ (TS _ 35) -> cont 65#;
	PT _ (TS _ 36) -> cont 66#;
	PT _ (TS _ 37) -> cont 67#;
	PT _ (TV happy_dollar_dollar) -> cont 68#;
	PT _ (TI happy_dollar_dollar) -> cont 69#;
	PT _ (TL happy_dollar_dollar) -> cont 70#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 71# tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Err a -> (a -> Err b) -> Err b
happyThen = (thenM)
happyReturn :: () => a -> Err a
happyReturn = (returnM)
happyThen1 m k tks = (thenM) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Err a
happyReturn1 = \a tks -> (returnM) a
happyError' :: () => ([(Token)], [String]) -> Err a
happyError' = (\(tokens, _) -> happyError tokens)
pProgram tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn7 z -> happyReturn z; _other -> notHappyAtAll })

happySeq = happyDontSeq


returnM :: a -> Err a
returnM = return

thenM :: Err a -> (a -> Err b) -> Err b
thenM = (>>=)

happyError :: [Token] -> Err a
happyError ts =
  Bad $ "syntax error at " ++ tokenPos ts ++ 
  case ts of
    [] -> []
    [Err _] -> " due to lexer error"
    _ -> " before " ++ unwords (map (id . prToken) (take 4 ts))

myLexer = tokens
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
{-# LINE 1 "<built-in>" #-}
{-# LINE 1 "<command-line>" #-}
{-# LINE 8 "<command-line>" #-}
# 1 "/usr/include/stdc-predef.h" 1 3 4

# 17 "/usr/include/stdc-predef.h" 3 4











































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/usr/lib/ghc/include/ghcversion.h" #-}















{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "/tmp/ghc8343_0/ghc_2.h" #-}
































































































































































































{-# LINE 8 "<command-line>" #-}
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp 













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif
{-# LINE 43 "templates/GenericTemplate.hs" #-}

data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList







{-# LINE 65 "templates/GenericTemplate.hs" #-}

{-# LINE 75 "templates/GenericTemplate.hs" #-}

{-# LINE 84 "templates/GenericTemplate.hs" #-}

infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is 1#, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept 1# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j ) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action

{-# LINE 137 "templates/GenericTemplate.hs" #-}


indexShortOffAddr (HappyA# arr) off =
        Happy_GHC_Exts.narrow16Int# i
  where
        i = Happy_GHC_Exts.word2Int# (Happy_GHC_Exts.or# (Happy_GHC_Exts.uncheckedShiftL# high 8#) low)
        high = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr (off' Happy_GHC_Exts.+# 1#)))
        low  = Happy_GHC_Exts.int2Word# (Happy_GHC_Exts.ord# (Happy_GHC_Exts.indexCharOffAddr# arr off'))
        off' = off Happy_GHC_Exts.*# 2#




{-# INLINE happyLt #-}
happyLt x y = LT(x,y)


readArrayBit arr bit =
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Happy_GHC_Exts.Int# ->                    -- token number
         Happy_GHC_Exts.Int# ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 1# tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 1# tk st sts stk
     = happyFail [] 1# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Happy_GHC_Exts.Int#
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n ((_):(t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction

{-# LINE 267 "templates/GenericTemplate.hs" #-}
happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (1# is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 1# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (Happy_GHC_Exts.I# (i)) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  1# tk old_st (((HappyState (action))):(sts)) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        action 1# 1# tk (HappyState (action)) sts ((saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action 1# 1# tk (HappyState (action)) sts ( (HappyErrorToken (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions


happyTcHack :: Happy_GHC_Exts.Int# -> a -> a
happyTcHack x y = y
{-# INLINE happyTcHack #-}


-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.

{-# LINE 333 "templates/GenericTemplate.hs" #-}
{-# NOINLINE happyShift #-}
{-# NOINLINE happySpecReduce_0 #-}
{-# NOINLINE happySpecReduce_1 #-}
{-# NOINLINE happySpecReduce_2 #-}
{-# NOINLINE happySpecReduce_3 #-}
{-# NOINLINE happyReduce #-}
{-# NOINLINE happyMonadReduce #-}
{-# NOINLINE happyGoto #-}
{-# NOINLINE happyFail #-}

-- end of Happy Template.
