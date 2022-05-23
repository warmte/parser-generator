{-# OPTIONS_GHC -w #-}
module Parsing.Parser where

import Parsing.Lexer
import Parsing.Grammar
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

data HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13
	= HappyTerminal (Token)
	| HappyErrorToken Prelude.Int
	| HappyAbsSyn4 t4
	| HappyAbsSyn5 t5
	| HappyAbsSyn6 t6
	| HappyAbsSyn7 t7
	| HappyAbsSyn8 t8
	| HappyAbsSyn9 t9
	| HappyAbsSyn10 t10
	| HappyAbsSyn11 t11
	| HappyAbsSyn12 t12
	| HappyAbsSyn13 t13

happyExpList :: Happy_Data_Array.Array Prelude.Int Prelude.Int
happyExpList = Happy_Data_Array.listArray (0,43) ([32768,0,256,0,48,0,0,16,32768,1,8192,0,64,0,0,0,0,0,128,8192,0,512,0,8,8192,0,0,128,0,0,512,0,2048,0,0,8,0,0,0,16384,0,0,2,512,0,8,0,0,0,0,0
	])

{-# NOINLINE happyExpListPerState #-}
happyExpListPerState st =
    token_strs_expected
  where token_strs = ["error","%dummy","%start_parse","Expr","Tokens","Token","Attributes","OneAttr","Nonterminals","Nonterminal","Variants","Variant","Args","COLON","PERCENT","TOKENFLAG","ATTRFLAG","PARSERFLAG","TOKEN","STRTOKEN","ATTRSYM","ATTR","ATTREVAL","TERMINAL","%eof"]
        bit_start = st Prelude.* 25
        bit_end = (st Prelude.+ 1) Prelude.* 25
        read_bit = readArrayBit happyExpList
        bits = Prelude.map read_bit [bit_start..bit_end Prelude.- 1]
        bits_indexed = Prelude.zip bits [0..24]
        token_strs_expected = Prelude.concatMap f bits_indexed
        f (Prelude.False, _) = []
        f (Prelude.True, nr) = [token_strs Prelude.!! nr]

action_0 (16) = happyShift action_2
action_0 (4) = happyGoto action_3
action_0 _ = happyFail (happyExpListPerState 0)

action_1 (16) = happyShift action_2
action_1 _ = happyFail (happyExpListPerState 1)

action_2 (19) = happyShift action_6
action_2 (20) = happyShift action_7
action_2 (5) = happyGoto action_4
action_2 (6) = happyGoto action_5
action_2 _ = happyFail (happyExpListPerState 2)

action_3 (25) = happyAccept
action_3 _ = happyFail (happyExpListPerState 3)

action_4 (17) = happyShift action_11
action_4 _ = happyFail (happyExpListPerState 4)

action_5 (19) = happyShift action_6
action_5 (20) = happyShift action_7
action_5 (5) = happyGoto action_10
action_5 (6) = happyGoto action_5
action_5 _ = happyReduce_2

action_6 (24) = happyShift action_9
action_6 _ = happyFail (happyExpListPerState 6)

action_7 (24) = happyShift action_8
action_7 _ = happyFail (happyExpListPerState 7)

action_8 _ = happyReduce_5

action_9 _ = happyReduce_4

action_10 _ = happyReduce_3

action_11 (21) = happyShift action_14
action_11 (7) = happyGoto action_12
action_11 (8) = happyGoto action_13
action_11 _ = happyFail (happyExpListPerState 11)

action_12 (18) = happyShift action_17
action_12 _ = happyFail (happyExpListPerState 12)

action_13 (21) = happyShift action_14
action_13 (7) = happyGoto action_16
action_13 (8) = happyGoto action_13
action_13 _ = happyReduce_6

action_14 (22) = happyShift action_15
action_14 _ = happyFail (happyExpListPerState 14)

action_15 (23) = happyShift action_21
action_15 _ = happyFail (happyExpListPerState 15)

action_16 _ = happyReduce_7

action_17 (15) = happyShift action_20
action_17 (9) = happyGoto action_18
action_17 (10) = happyGoto action_19
action_17 _ = happyFail (happyExpListPerState 17)

action_18 _ = happyReduce_1

action_19 (15) = happyShift action_20
action_19 (9) = happyGoto action_23
action_19 (10) = happyGoto action_19
action_19 _ = happyReduce_9

action_20 (24) = happyShift action_22
action_20 _ = happyFail (happyExpListPerState 20)

action_21 _ = happyReduce_8

action_22 (14) = happyShift action_26
action_22 (11) = happyGoto action_24
action_22 (12) = happyGoto action_25
action_22 _ = happyFail (happyExpListPerState 22)

action_23 _ = happyReduce_10

action_24 _ = happyReduce_11

action_25 (14) = happyShift action_26
action_25 (11) = happyGoto action_29
action_25 (12) = happyGoto action_25
action_25 _ = happyReduce_12

action_26 (24) = happyShift action_28
action_26 (13) = happyGoto action_27
action_26 _ = happyFail (happyExpListPerState 26)

action_27 (23) = happyShift action_31
action_27 _ = happyFail (happyExpListPerState 27)

action_28 (24) = happyShift action_28
action_28 (13) = happyGoto action_30
action_28 _ = happyReduce_15

action_29 _ = happyReduce_13

action_30 _ = happyReduce_16

action_31 _ = happyReduce_14

happyReduce_1 = happyReduce 6 4 happyReduction_1
happyReduction_1 ((HappyAbsSyn9  happy_var_6) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn7  happy_var_4) `HappyStk`
	_ `HappyStk`
	(HappyAbsSyn5  happy_var_2) `HappyStk`
	_ `HappyStk`
	happyRest)
	 = HappyAbsSyn4
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ value = (buildSadParser (attrs happySubAttrs_4) ) ++ (buildParse (valtype happySubAttrs_4) ) ++ (concatMap (buildQTerminal (valtype happySubAttrs_4) (nonterminals (terminals happySubAttrs_2) )) ( (terminals happySubAttrs_2) ++ (terminals happySubAttrs_6) ))  }; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; (happyConditions_4,happySubAttrs_4) = happy_var_4 happyEmptyAttrs; (happyConditions_6,happySubAttrs_6) = happy_var_6 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_2 Prelude.++ happyConditions_4 Prelude.++ happyConditions_6 } in (happyConditions,happySelfAttrs)
	) `HappyStk` happyRest

happyReduce_2 = happySpecReduce_1  5 happyReduction_2
happyReduction_2 (HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = (terminals happySubAttrs_1)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 } in (happyConditions,happySelfAttrs)
	)
happyReduction_2 _  = notHappyAtAll 

happyReduce_3 = happySpecReduce_2  5 happyReduction_3
happyReduction_3 (HappyAbsSyn5  happy_var_2)
	(HappyAbsSyn6  happy_var_1)
	 =  HappyAbsSyn5
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = (terminals happySubAttrs_1) ++ (terminals happySubAttrs_2)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)
happyReduction_3 _ _  = notHappyAtAll 

happyReduce_4 = happySpecReduce_2  6 happyReduction_4
happyReduction_4 (HappyTerminal (Terminal happy_var_2))
	_
	 =  HappyAbsSyn6
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = [(MkT happy_var_2 False)]  }; happyConditions = [] } in (happyConditions,happySelfAttrs)
	)
happyReduction_4 _ _  = notHappyAtAll 

happyReduce_5 = happySpecReduce_2  6 happyReduction_5
happyReduction_5 (HappyTerminal (Terminal happy_var_2))
	_
	 =  HappyAbsSyn6
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = [(MkT happy_var_2 True)]  }; happyConditions = [] } in (happyConditions,happySelfAttrs)
	)
happyReduction_5 _ _  = notHappyAtAll 

happyReduce_6 = happySpecReduce_1  7 happyReduction_6
happyReduction_6 (HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ valtype = (valtype happySubAttrs_1) , attrs = (attrs happySubAttrs_1)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 } in (happyConditions,happySelfAttrs)
	)
happyReduction_6 _  = notHappyAtAll 

happyReduce_7 = happySpecReduce_2  7 happyReduction_7
happyReduction_7 (HappyAbsSyn7  happy_var_2)
	(HappyAbsSyn8  happy_var_1)
	 =  HappyAbsSyn7
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ valtype = (if (valtype happySubAttrs_1) =="" then (valtype happySubAttrs_2) else (valtype happySubAttrs_1) ) , attrs = (attrs happySubAttrs_1) ++ (attrs happySubAttrs_2)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)
happyReduction_7 _ _  = notHappyAtAll 

happyReduce_8 = happySpecReduce_3  8 happyReduction_8
happyReduction_8 (HappyTerminal (AttrEval happy_var_3))
	(HappyTerminal (Attr happy_var_2))
	_
	 =  HappyAbsSyn8
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ valtype = (if happy_var_2 =="value" then happy_var_3 else "") , attrs = [( happy_var_2 , happy_var_3 )]  }; happyConditions = [] } in (happyConditions,happySelfAttrs)
	)
happyReduction_8 _ _ _  = notHappyAtAll 

happyReduce_9 = happySpecReduce_1  9 happyReduction_9
happyReduction_9 (HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = (terminals happySubAttrs_1)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 } in (happyConditions,happySelfAttrs)
	)
happyReduction_9 _  = notHappyAtAll 

happyReduce_10 = happySpecReduce_2  9 happyReduction_10
happyReduction_10 (HappyAbsSyn9  happy_var_2)
	(HappyAbsSyn10  happy_var_1)
	 =  HappyAbsSyn9
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = (terminals happySubAttrs_1) ++ (terminals happySubAttrs_2)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)
happyReduction_10 _ _  = notHappyAtAll 

happyReduce_11 = happySpecReduce_3  10 happyReduction_11
happyReduction_11 (HappyAbsSyn11  happy_var_3)
	(HappyTerminal (Terminal happy_var_2))
	_
	 =  HappyAbsSyn10
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = [(MkNT happy_var_2 (variants happySubAttrs_3) )]  }; (happyConditions_3,happySubAttrs_3) = happy_var_3 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_3 } in (happyConditions,happySelfAttrs)
	)
happyReduction_11 _ _ _  = notHappyAtAll 

happyReduce_12 = happySpecReduce_1  11 happyReduction_12
happyReduction_12 (HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ variants = (variants happySubAttrs_1)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 } in (happyConditions,happySelfAttrs)
	)
happyReduction_12 _  = notHappyAtAll 

happyReduce_13 = happySpecReduce_2  11 happyReduction_13
happyReduction_13 (HappyAbsSyn11  happy_var_2)
	(HappyAbsSyn12  happy_var_1)
	 =  HappyAbsSyn11
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ variants = (variants happySubAttrs_1) ++ (variants happySubAttrs_2)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)
happyReduction_13 _ _  = notHappyAtAll 

happyReduce_14 = happySpecReduce_3  12 happyReduction_14
happyReduction_14 (HappyTerminal (AttrEval happy_var_3))
	(HappyAbsSyn13  happy_var_2)
	_
	 =  HappyAbsSyn12
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ variants = [ ( (children happySubAttrs_2) , happy_var_3 ) ]  }; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)
happyReduction_14 _ _ _  = notHappyAtAll 

happyReduce_15 = happySpecReduce_1  13 happyReduction_15
happyReduction_15 (HappyTerminal (Terminal happy_var_1))
	 =  HappyAbsSyn13
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ children = [ happy_var_1 ]  }; happyConditions = [] } in (happyConditions,happySelfAttrs)
	)
happyReduction_15 _  = notHappyAtAll 

happyReduce_16 = happySpecReduce_2  13 happyReduction_16
happyReduction_16 (HappyAbsSyn13  happy_var_2)
	(HappyTerminal (Terminal happy_var_1))
	 =  HappyAbsSyn13
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ children = ( happy_var_1 ) : (children happySubAttrs_2)  }; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)
happyReduction_16 _ _  = notHappyAtAll 

happyNewToken action sts stk [] =
	action 25 25 notHappyAtAll (HappyState action) sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = action i i tk (HappyState action) sts stk tks in
	case tk of {
	Colon -> cont 14;
	Percent -> cont 15;
	TokenFlag -> cont 16;
	AttrFlag -> cont 17;
	ParserFlag -> cont 18;
	TokenSymbol -> cont 19;
	StrTokenSymbol -> cont 20;
	AttrSymbol -> cont 21;
	Attr happy_dollar_dollar -> cont 22;
	AttrEval happy_dollar_dollar -> cont 23;
	Terminal happy_dollar_dollar -> cont 24;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 25 tk tks = happyError' (tks, explist)
happyError_ explist _ tk tks = happyError' ((tk:tks), explist)

happyThen :: () => Either String a -> (a -> Either String b) -> Either String b
happyThen = (>>=)
happyReturn :: () => a -> Either String a
happyReturn = (return)
happyThen1 m k tks = (>>=) m (\a -> k a tks)
happyReturn1 :: () => a -> b -> Either String a
happyReturn1 = \a tks -> (return) a
happyError' :: () => ([(Token)], [Prelude.String]) -> Either String a
happyError' = (\(tokens, _) -> parseError tokens)
do_parse tks = happySomeParser where
 happySomeParser = happyThen (happyParse action_0 tks) (\x -> case x of {HappyAbsSyn4 z -> happyReturn z; _other -> notHappyAtAll })

parse toks = do { f <- do_parse toks; let { (conds,attrs) = f happyEmptyAttrs } in do { Prelude.sequence_ conds; Prelude.return (value attrs) }}

happySeq = happyDontSeq

data Attrs = HappyAttributes {value :: String, terminals :: [QTerminal], attrs :: [(String, String)], valtype :: String, children :: [String], variants :: [([String], String)]}
happyEmptyAttrs = HappyAttributes {value = Prelude.error "invalid reference to attribute 'value'", terminals = Prelude.error "invalid reference to attribute 'terminals'", attrs = Prelude.error "invalid reference to attribute 'attrs'", valtype = Prelude.error "invalid reference to attribute 'valtype'", children = Prelude.error "invalid reference to attribute 'children'", variants = Prelude.error "invalid reference to attribute 'variants'"}

parseError = error "Parser error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $










































data Happy_IntList = HappyCons Prelude.Int Happy_IntList








































infixr 9 `HappyStk`
data HappyStk a = HappyStk a (HappyStk a)

-----------------------------------------------------------------------------
-- starting the parse

happyParse start_state = happyNewToken start_state notHappyAtAll notHappyAtAll

-----------------------------------------------------------------------------
-- Accepting the parse

-- If the current token is ERROR_TOK, it means we've just accepted a partial
-- parse (a %partial parser).  We must ignore the saved token on the top of
-- the stack in this case.
happyAccept (1) tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
         (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action









































indexShortOffAddr arr off = arr Happy_Data_Array.! off


{-# INLINE happyLt #-}
happyLt x y = (x Prelude.< y)






readArrayBit arr bit =
    Bits.testBit (indexShortOffAddr arr (bit `Prelude.div` 16)) (bit `Prelude.mod` 16)






-----------------------------------------------------------------------------
-- HappyState data type (not arrays)



newtype HappyState b c = HappyState
        (Prelude.Int ->                    -- token number
         Prelude.Int ->                    -- token number (yes, again)
         b ->                           -- token semantic value
         HappyState b c ->              -- current state
         [HappyState b c] ->            -- state stack
         c)



-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state (1) tk st sts stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--     trace "shifting the error token" $
     new_state i i tk (HappyState (new_state)) ((st):(sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state ((st):(sts)) ((HappyTerminal (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_0 nt fn j tk st@((HappyState (action))) sts stk
     = action nt j tk st ((st):(sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@(((st@(HappyState (action))):(_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_2 nt fn j tk _ ((_):(sts@(((st@(HappyState (action))):(_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happySpecReduce_3 nt fn j tk _ ((_):(((_):(sts@(((st@(HappyState (action))):(_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (action nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Prelude.- ((1) :: Prelude.Int)) sts of
         sts1@(((st1@(HappyState (action))):(_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (action nt j tk st1 sts1 r)

happyMonadReduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> action nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn (1) tk st sts stk
     = happyFail [] (1) tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k ((st):(sts)) of
        sts1@(((st1@(HappyState (action))):(_))) ->
         let drop_stk = happyDropStk k stk





             _ = nt :: Prelude.Int
             new_state = action

          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop (0) l = l
happyDrop n ((_):(t)) = happyDrop (n Prelude.- ((1) :: Prelude.Int)) t

happyDropStk (0) l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Prelude.- ((1)::Prelude.Int)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction









happyGoto action j tk st = action j j tk (HappyState action)


-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist (1) tk old_st _ stk@(x `HappyStk` _) =
     let i = (case x of { HappyErrorToken (i) -> i }) in
--      trace "failing" $ 
        happyError_ explist i tk

{-  We don't need state discarding for our restricted implementation of
    "error".  In fact, it can cause some bogus parses, so I've disabled it
    for now --SDM

-- discard a state
happyFail  ERROR_TOK tk old_st CONS(HAPPYSTATE(action),sts) 
                                                (saved_tok `HappyStk` _ `HappyStk` stk) =
--      trace ("discarding state, depth " ++ show (length stk))  $
        DO_ACTION(action,ERROR_TOK,tk,sts,(saved_tok`HappyStk`stk))
-}

-- Enter error recovery: generate an error token,
--                       save the old token and carry on.
happyFail explist i tk (HappyState (action)) sts stk =
--      trace "entering error recovery" $
        action (1) (1) tk (HappyState (action)) sts ((HappyErrorToken (i)) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

-----------------------------------------------------------------------------
-- Hack to get the typechecker to accept our action functions







-----------------------------------------------------------------------------
-- Seq-ing.  If the --strict flag is given, then Happy emits 
--      happySeq = happyDoSeq
-- otherwise it emits
--      happySeq = happyDontSeq

happyDoSeq, happyDontSeq :: a -> b -> b
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.









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
