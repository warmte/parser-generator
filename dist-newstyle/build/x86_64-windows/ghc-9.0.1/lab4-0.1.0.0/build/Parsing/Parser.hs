{-# OPTIONS_GHC -w #-}
{-# OPTIONS -XMagicHash -XBangPatterns -XTypeSynonymInstances -XFlexibleInstances -cpp #-}
#if __GLASGOW_HASKELL__ >= 710
{-# OPTIONS_GHC -XPartialTypeSignatures #-}
#endif
module Parsing.Parser where

import Parsing.Lexer
import Parsing.Grammar
import qualified Data.Array as Happy_Data_Array
import qualified Data.Bits as Bits
import qualified GHC.Exts as Happy_GHC_Exts
import Control.Applicative(Applicative(..))
import Control.Monad (ap)

-- parser produced by Happy Version 1.20.0

newtype HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13 = HappyAbsSyn HappyAny
#if __GLASGOW_HASKELL__ >= 607
type HappyAny = Happy_GHC_Exts.Any
#else
type HappyAny = forall a . a
#endif
happyIn4 :: t4 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn4 #-}
happyOut4 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t4
happyOut4 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut4 #-}
happyIn5 :: t5 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn5 #-}
happyOut5 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t5
happyOut5 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut5 #-}
happyIn6 :: t6 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn6 #-}
happyOut6 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t6
happyOut6 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut6 #-}
happyIn7 :: t7 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn7 #-}
happyOut7 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t7
happyOut7 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut7 #-}
happyIn8 :: t8 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn8 #-}
happyOut8 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t8
happyOut8 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut8 #-}
happyIn9 :: t9 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn9 #-}
happyOut9 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t9
happyOut9 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut9 #-}
happyIn10 :: t10 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn10 #-}
happyOut10 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t10
happyOut10 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut10 #-}
happyIn11 :: t11 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn11 #-}
happyOut11 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t11
happyOut11 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut11 #-}
happyIn12 :: t12 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn12 #-}
happyOut12 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t12
happyOut12 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut12 #-}
happyIn13 :: t13 -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyIn13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyIn13 #-}
happyOut13 :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> t13
happyOut13 x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOut13 #-}
happyInTok :: (Token) -> (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13)
happyInTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyInTok #-}
happyOutTok :: (HappyAbsSyn t4 t5 t6 t7 t8 t9 t10 t11 t12 t13) -> (Token)
happyOutTok x = Happy_GHC_Exts.unsafeCoerce# x
{-# INLINE happyOutTok #-}


happyExpList :: HappyAddr
happyExpList = HappyA# "\x00\x80\x00\x00\x00\x01\x00\x00\x30\x00\x00\x00\x00\x00\x10\x00\x00\x80\x01\x00\x00\x20\x00\x00\x40\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x80\x00\x00\x20\x00\x00\x00\x02\x00\x00\x08\x00\x00\x20\x00\x00\x00\x00\x80\x00\x00\x00\x00\x00\x00\x02\x00\x00\x00\x08\x00\x00\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x40\x00\x00\x00\x00\x02\x00\x00\x02\x00\x00\x08\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

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

happyActOffsets :: HappyAddr
happyActOffsets = HappyA# "\x09\x00\x09\x00\xfb\xff\x0c\x00\x03\x00\xfb\xff\x06\x00\x0e\x00\x00\x00\x00\x00\x00\x00\x0f\x00\x11\x00\x12\x00\x13\x00\x14\x00\x00\x00\x19\x00\x00\x00\x19\x00\x15\x00\x00\x00\x1c\x00\x00\x00\x00\x00\x1c\x00\x16\x00\x18\x00\x1a\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyGotoOffsets :: HappyAddr
happyGotoOffsets = HappyA# "\x1f\x00\x00\x00\x02\x00\x00\x00\x00\x00\x04\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x05\x00\x00\x00\x07\x00\x00\x00\x00\x00\x00\x00\x08\x00\x00\x00\x0a\x00\x00\x00\x00\x00\x0b\x00\x00\x00\x00\x00\x0d\x00\x1b\x00\x00\x00\x1d\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyAdjustOffset :: Happy_GHC_Exts.Int# -> Happy_GHC_Exts.Int#
happyAdjustOffset off = off

happyDefActions :: HappyAddr
happyDefActions = HappyA# "\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\xfd\xff\x00\x00\x00\x00\xfa\xff\xfb\xff\xfc\xff\x00\x00\x00\x00\xf9\xff\x00\x00\x00\x00\xf8\xff\x00\x00\xfe\xff\xf6\xff\x00\x00\xf7\xff\x00\x00\xf5\xff\xf4\xff\xf3\xff\x00\x00\x00\x00\xf0\xff\xf2\xff\xef\xff\xf1\xff"#

happyCheck :: HappyAddr
happyCheck = HappyA# "\xff\xff\x06\x00\x07\x00\x01\x00\x02\x00\x01\x00\x02\x00\x04\x00\x03\x00\x04\x00\x03\x00\x04\x00\x03\x00\x05\x00\x06\x00\x05\x00\x06\x00\x0b\x00\x07\x00\x08\x00\x07\x00\x08\x00\x05\x00\x08\x00\x0c\x00\x0b\x00\x08\x00\x02\x00\x09\x00\x01\x00\x0a\x00\x00\x00\x0b\x00\x0b\x00\x0a\x00\xff\xff\x09\x00\x0b\x00\x09\x00\xff\xff\xff\xff\xff\xff\xff\xff\xff\xff"#

happyTable :: HappyAddr
happyTable = HappyA# "\x00\x00\x07\x00\x08\x00\x04\x00\x05\x00\x0a\x00\x05\x00\x0c\x00\x0c\x00\x0d\x00\x10\x00\x0d\x00\x03\x00\x12\x00\x13\x00\x17\x00\x13\x00\x0a\x00\x18\x00\x19\x00\x1d\x00\x19\x00\x12\x00\x0f\x00\xff\xff\x09\x00\x0f\x00\x15\x00\x10\x00\x1b\x00\x16\x00\x03\x00\x17\x00\x1d\x00\x20\x00\x00\x00\x1b\x00\x1d\x00\x1e\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00"#

happyReduceArr = Happy_Data_Array.array (1, 16) [
	(1 , happyReduce_1),
	(2 , happyReduce_2),
	(3 , happyReduce_3),
	(4 , happyReduce_4),
	(5 , happyReduce_5),
	(6 , happyReduce_6),
	(7 , happyReduce_7),
	(8 , happyReduce_8),
	(9 , happyReduce_9),
	(10 , happyReduce_10),
	(11 , happyReduce_11),
	(12 , happyReduce_12),
	(13 , happyReduce_13),
	(14 , happyReduce_14),
	(15 , happyReduce_15),
	(16 , happyReduce_16)
	]

happy_n_terms = 13 :: Prelude.Int
happy_n_nonterms = 10 :: Prelude.Int

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_1 = happyReduce 6# 0# happyReduction_1
happyReduction_1 (happy_x_6 `HappyStk`
	happy_x_5 `HappyStk`
	happy_x_4 `HappyStk`
	happy_x_3 `HappyStk`
	happy_x_2 `HappyStk`
	happy_x_1 `HappyStk`
	happyRest)
	 = case happyOut5 happy_x_2 of { happy_var_2 -> 
	case happyOut7 happy_x_4 of { happy_var_4 -> 
	case happyOut9 happy_x_6 of { happy_var_6 -> 
	happyIn4
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ value = (buildSadParser (attrs happySubAttrs_4) ) ++ (buildParse (valtype happySubAttrs_4) ) ++ (concatMap (buildQTerminal (valtype happySubAttrs_4) (nonterminals (terminals happySubAttrs_2) ) (buildFirsts ( (terminals happySubAttrs_2) ++ (terminals happySubAttrs_6) )) (buildFollows ( (terminals happySubAttrs_2) ++ (terminals happySubAttrs_6) ))) ( (terminals happySubAttrs_2) ++ (terminals happySubAttrs_6) ))  }; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; (happyConditions_4,happySubAttrs_4) = happy_var_4 happyEmptyAttrs; (happyConditions_6,happySubAttrs_6) = happy_var_6 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_2 Prelude.++ happyConditions_4 Prelude.++ happyConditions_6 } in (happyConditions,happySelfAttrs)
	) `HappyStk` happyRest}}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_2 = happySpecReduce_1  1# happyReduction_2
happyReduction_2 happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	happyIn5
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = (terminals happySubAttrs_1)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 } in (happyConditions,happySelfAttrs)
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_3 = happySpecReduce_2  1# happyReduction_3
happyReduction_3 happy_x_2
	happy_x_1
	 =  case happyOut6 happy_x_1 of { happy_var_1 -> 
	case happyOut5 happy_x_2 of { happy_var_2 -> 
	happyIn5
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = (terminals happySubAttrs_1) ++ (terminals happySubAttrs_2)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_4 = happySpecReduce_2  2# happyReduction_4
happyReduction_4 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (Terminal happy_var_2) -> 
	happyIn6
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = [(MkT happy_var_2 False)]  }; happyConditions = [] } in (happyConditions,happySelfAttrs)
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_5 = happySpecReduce_2  2# happyReduction_5
happyReduction_5 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (Terminal happy_var_2) -> 
	happyIn6
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = [(MkT happy_var_2 True)]  }; happyConditions = [] } in (happyConditions,happySelfAttrs)
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_6 = happySpecReduce_1  3# happyReduction_6
happyReduction_6 happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	happyIn7
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ valtype = (valtype happySubAttrs_1) , attrs = (attrs happySubAttrs_1)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 } in (happyConditions,happySelfAttrs)
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_7 = happySpecReduce_2  3# happyReduction_7
happyReduction_7 happy_x_2
	happy_x_1
	 =  case happyOut8 happy_x_1 of { happy_var_1 -> 
	case happyOut7 happy_x_2 of { happy_var_2 -> 
	happyIn7
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ valtype = (if (valtype happySubAttrs_1) =="" then (valtype happySubAttrs_2) else (valtype happySubAttrs_1) ) , attrs = (attrs happySubAttrs_1) ++ (attrs happySubAttrs_2)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_8 = happySpecReduce_3  4# happyReduction_8
happyReduction_8 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (Attr happy_var_2) -> 
	case happyOutTok happy_x_3 of { (AttrEval happy_var_3) -> 
	happyIn8
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ valtype = (if happy_var_2 =="value" then happy_var_3 else "") , attrs = [( happy_var_2 , happy_var_3 )]  }; happyConditions = [] } in (happyConditions,happySelfAttrs)
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_9 = happySpecReduce_1  5# happyReduction_9
happyReduction_9 happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	happyIn9
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = (terminals happySubAttrs_1)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 } in (happyConditions,happySelfAttrs)
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_10 = happySpecReduce_2  5# happyReduction_10
happyReduction_10 happy_x_2
	happy_x_1
	 =  case happyOut10 happy_x_1 of { happy_var_1 -> 
	case happyOut9 happy_x_2 of { happy_var_2 -> 
	happyIn9
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = (terminals happySubAttrs_1) ++ (terminals happySubAttrs_2)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_11 = happySpecReduce_3  6# happyReduction_11
happyReduction_11 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_2 of { (Terminal happy_var_2) -> 
	case happyOut11 happy_x_3 of { happy_var_3 -> 
	happyIn10
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ terminals = [(MkNT happy_var_2 (variants happySubAttrs_3) )]  }; (happyConditions_3,happySubAttrs_3) = happy_var_3 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_3 } in (happyConditions,happySelfAttrs)
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_12 = happySpecReduce_1  7# happyReduction_12
happyReduction_12 happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	happyIn11
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ variants = (variants happySubAttrs_1)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 } in (happyConditions,happySelfAttrs)
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_13 = happySpecReduce_2  7# happyReduction_13
happyReduction_13 happy_x_2
	happy_x_1
	 =  case happyOut12 happy_x_1 of { happy_var_1 -> 
	case happyOut11 happy_x_2 of { happy_var_2 -> 
	happyIn11
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ variants = (variants happySubAttrs_1) ++ (variants happySubAttrs_2)  }; (happyConditions_1,happySubAttrs_1) = happy_var_1 happyEmptyAttrs; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_1 Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_14 = happySpecReduce_3  8# happyReduction_14
happyReduction_14 happy_x_3
	happy_x_2
	happy_x_1
	 =  case happyOut13 happy_x_2 of { happy_var_2 -> 
	case happyOutTok happy_x_3 of { (AttrEval happy_var_3) -> 
	happyIn12
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ variants = [ ( (children happySubAttrs_2) , happy_var_3 ) ]  }; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)}}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_15 = happySpecReduce_1  9# happyReduction_15
happyReduction_15 happy_x_1
	 =  case happyOutTok happy_x_1 of { (Terminal happy_var_1) -> 
	happyIn13
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ children = [ happy_var_1 ]  }; happyConditions = [] } in (happyConditions,happySelfAttrs)
	)}

#if __GLASGOW_HASKELL__ >= 710
#endif
happyReduce_16 = happySpecReduce_2  9# happyReduction_16
happyReduction_16 happy_x_2
	happy_x_1
	 =  case happyOutTok happy_x_1 of { (Terminal happy_var_1) -> 
	case happyOut13 happy_x_2 of { happy_var_2 -> 
	happyIn13
		 (\happyInhAttrs -> let { happySelfAttrs = happyInhAttrs{ children = ( happy_var_1 ) : (children happySubAttrs_2)  }; (happyConditions_2,happySubAttrs_2) = happy_var_2 happyEmptyAttrs; happyConditions = [] Prelude.++ happyConditions_2 } in (happyConditions,happySelfAttrs)
	)}}

happyNewToken action sts stk [] =
	happyDoAction 12# notHappyAtAll action sts stk []

happyNewToken action sts stk (tk:tks) =
	let cont i = happyDoAction i tk action sts stk tks in
	case tk of {
	Colon -> cont 1#;
	Percent -> cont 2#;
	TokenFlag -> cont 3#;
	AttrFlag -> cont 4#;
	ParserFlag -> cont 5#;
	TokenSymbol -> cont 6#;
	StrTokenSymbol -> cont 7#;
	AttrSymbol -> cont 8#;
	Attr happy_dollar_dollar -> cont 9#;
	AttrEval happy_dollar_dollar -> cont 10#;
	Terminal happy_dollar_dollar -> cont 11#;
	_ -> happyError' ((tk:tks), [])
	}

happyError_ explist 12# tk tks = happyError' (tks, explist)
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
 happySomeParser = happyThen (happyParse 0# tks) (\x -> happyReturn (let {x' = happyOut4 x} in x'))

parse toks = do { f <- do_parse toks; let { (conds,attrs) = f happyEmptyAttrs } in do { Prelude.sequence_ conds; Prelude.return (value attrs) }}

happySeq = happyDontSeq

data Attrs = HappyAttributes {value :: String, terminals :: [QTerminal], attrs :: [(String, String)], valtype :: String, children :: [String], variants :: [([String], String)]}
happyEmptyAttrs = HappyAttributes {value = Prelude.error "invalid reference to attribute 'value'", terminals = Prelude.error "invalid reference to attribute 'terminals'", attrs = Prelude.error "invalid reference to attribute 'attrs'", valtype = Prelude.error "invalid reference to attribute 'valtype'", children = Prelude.error "invalid reference to attribute 'children'", variants = Prelude.error "invalid reference to attribute 'variants'"}

parseError = error "Parser error"
{-# LINE 1 "templates/GenericTemplate.hs" #-}
-- $Id: GenericTemplate.hs,v 1.26 2005/01/14 14:47:22 simonmar Exp $













-- Do not remove this comment. Required to fix CPP parsing when using GCC and a clang-compiled alex.
#if __GLASGOW_HASKELL__ > 706
#define LT(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.<# m)) :: Prelude.Bool)
#define GTE(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.>=# m)) :: Prelude.Bool)
#define EQ(n,m) ((Happy_GHC_Exts.tagToEnum# (n Happy_GHC_Exts.==# m)) :: Prelude.Bool)
#else
#define LT(n,m) (n Happy_GHC_Exts.<# m)
#define GTE(n,m) (n Happy_GHC_Exts.>=# m)
#define EQ(n,m) (n Happy_GHC_Exts.==# m)
#endif



















data Happy_IntList = HappyCons Happy_GHC_Exts.Int# Happy_IntList








































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
happyAccept 0# tk st sts (_ `HappyStk` ans `HappyStk` _) =
        happyReturn1 ans
happyAccept j tk st sts (HappyStk ans _) = 
        (happyTcHack j (happyTcHack st)) (happyReturn1 ans)

-----------------------------------------------------------------------------
-- Arrays only: do the next action



happyDoAction i tk st
        = {- nothing -}
          case action of
                0#           -> {- nothing -}
                                     happyFail (happyExpListPerState ((Happy_GHC_Exts.I# (st)) :: Prelude.Int)) i tk st
                -1#          -> {- nothing -}
                                     happyAccept i tk st
                n | LT(n,(0# :: Happy_GHC_Exts.Int#)) -> {- nothing -}
                                                   (happyReduceArr Happy_Data_Array.! rule) i tk st
                                                   where rule = (Happy_GHC_Exts.I# ((Happy_GHC_Exts.negateInt# ((n Happy_GHC_Exts.+# (1# :: Happy_GHC_Exts.Int#))))))
                n                 -> {- nothing -}
                                     happyShift new_state i tk st
                                     where new_state = (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#))
   where off    = happyAdjustOffset (indexShortOffAddr happyActOffsets st)
         off_i  = (off Happy_GHC_Exts.+# i)
         check  = if GTE(off_i,(0# :: Happy_GHC_Exts.Int#))
                  then EQ(indexShortOffAddr happyCheck off_i, i)
                  else Prelude.False
         action
          | check     = indexShortOffAddr happyTable off_i
          | Prelude.otherwise = indexShortOffAddr happyDefActions st




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
    Bits.testBit (Happy_GHC_Exts.I# (indexShortOffAddr arr ((unbox_int bit) `Happy_GHC_Exts.iShiftRA#` 4#))) (bit `Prelude.mod` 16)
  where unbox_int (Happy_GHC_Exts.I# x) = x






data HappyAddr = HappyA# Happy_GHC_Exts.Addr#


-----------------------------------------------------------------------------
-- HappyState data type (not arrays)













-----------------------------------------------------------------------------
-- Shifting a token

happyShift new_state 0# tk st sts stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
--     trace "shifting the error token" $
     happyDoAction i tk new_state (HappyCons (st) (sts)) (stk)

happyShift new_state i tk st sts stk =
     happyNewToken new_state (HappyCons (st) (sts)) ((happyInTok (tk))`HappyStk`stk)

-- happyReduce is specialised for the common cases.

happySpecReduce_0 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_0 nt fn j tk st@((action)) sts stk
     = happyGoto nt j tk st (HappyCons (st) (sts)) (fn `HappyStk` stk)

happySpecReduce_1 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_1 nt fn j tk _ sts@((HappyCons (st@(action)) (_))) (v1`HappyStk`stk')
     = let r = fn v1 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_2 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_2 nt fn j tk _ (HappyCons (_) (sts@((HappyCons (st@(action)) (_))))) (v1`HappyStk`v2`HappyStk`stk')
     = let r = fn v1 v2 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happySpecReduce_3 i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happySpecReduce_3 nt fn j tk _ (HappyCons (_) ((HappyCons (_) (sts@((HappyCons (st@(action)) (_))))))) (v1`HappyStk`v2`HappyStk`v3`HappyStk`stk')
     = let r = fn v1 v2 v3 in
       happySeq r (happyGoto nt j tk st sts (r `HappyStk` stk'))

happyReduce k i fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyReduce k nt fn j tk st sts stk
     = case happyDrop (k Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) sts of
         sts1@((HappyCons (st1@(action)) (_))) ->
                let r = fn stk in  -- it doesn't hurt to always seq here...
                happyDoSeq r (happyGoto nt j tk st1 sts1 r)

happyMonadReduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonadReduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
          let drop_stk = happyDropStk k stk in
          happyThen1 (fn stk tk) (\r -> happyGoto nt j tk st1 sts1 (r `HappyStk` drop_stk))

happyMonad2Reduce k nt fn 0# tk st sts stk
     = happyFail [] 0# tk st sts stk
happyMonad2Reduce k nt fn j tk st sts stk =
      case happyDrop k (HappyCons (st) (sts)) of
        sts1@((HappyCons (st1@(action)) (_))) ->
         let drop_stk = happyDropStk k stk

             off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st1)
             off_i = (off Happy_GHC_Exts.+# nt)
             new_state = indexShortOffAddr happyTable off_i




          in
          happyThen1 (fn stk tk) (\r -> happyNewToken new_state sts1 (r `HappyStk` drop_stk))

happyDrop 0# l = l
happyDrop n (HappyCons (_) (t)) = happyDrop (n Happy_GHC_Exts.-# (1# :: Happy_GHC_Exts.Int#)) t

happyDropStk 0# l = l
happyDropStk n (x `HappyStk` xs) = happyDropStk (n Happy_GHC_Exts.-# (1#::Happy_GHC_Exts.Int#)) xs

-----------------------------------------------------------------------------
-- Moving to a new state after a reduction


happyGoto nt j tk st = 
   {- nothing -}
   happyDoAction j tk new_state
   where off = happyAdjustOffset (indexShortOffAddr happyGotoOffsets st)
         off_i = (off Happy_GHC_Exts.+# nt)
         new_state = indexShortOffAddr happyTable off_i




-----------------------------------------------------------------------------
-- Error recovery (ERROR_TOK is the error token)

-- parse error if we are in recovery and we fail again
happyFail explist 0# tk old_st _ stk@(x `HappyStk` _) =
     let i = (case Happy_GHC_Exts.unsafeCoerce# x of { (Happy_GHC_Exts.I# (i)) -> i }) in
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
happyFail explist i tk (action) sts stk =
--      trace "entering error recovery" $
        happyDoAction 0# tk action sts ((Happy_GHC_Exts.unsafeCoerce# (Happy_GHC_Exts.I# (i))) `HappyStk` stk)

-- Internal happy errors:

notHappyAtAll :: a
notHappyAtAll = Prelude.error "Internal Happy error\n"

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
happyDoSeq   a b = a `Prelude.seq` b
happyDontSeq a b = b

-----------------------------------------------------------------------------
-- Don't inline any functions from the template.  GHC has a nasty habit
-- of deciding to inline happyGoto everywhere, which increases the size of
-- the generated parser quite a bit.


{-# NOINLINE happyDoAction #-}
{-# NOINLINE happyTable #-}
{-# NOINLINE happyCheck #-}
{-# NOINLINE happyActOffsets #-}
{-# NOINLINE happyGotoOffsets #-}
{-# NOINLINE happyDefActions #-}

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
