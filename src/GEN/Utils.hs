{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module GEN.Utils where

import Control.Monad.Trans.State ( StateT(StateT), evalStateT )
import Control.Applicative ()
import Control.Monad (mfilter, MonadPlus, void, when, unless)
import Control.Monad.Trans.Except (ExceptT (ExceptT), runExceptT, Except, except, runExcept)
import qualified Data.Map as Map
import Data.Char (isAlpha, isLower, isUpper, isDigit)

data LToken a = LToken a Token deriving Show
data ParseError = TokenizerError | ParsingError | DebugError deriving (Show, Eq)

type EState e s a = StateT s (Except e) a

newtype Parser a = P (EState ParseError (Int, String) a)
    deriving newtype (Functor, Applicative, Monad)
    
runP :: Parser a -> String -> Either ParseError a
runP (P curState) input = runExcept $ evalStateT curState (0, input)

data Token = LB | RB | Plus | Minus | Star | Slash | Digit String | Degree | Eof | Eps deriving (Show, Eq)

tokens :: Map.Map String Token
tokens =Map.fromList [("(", LB), (")", RB), ("+", Plus), ("-", Minus), ("*", Star), ("/", Slash), ("$", Eof), ("^", Degree)]

literals :: [(Char -> Bool, Char -> Bool, String -> Token)]
literals =[((\c -> isDigit c), (\c -> isDigit c), Digit)]