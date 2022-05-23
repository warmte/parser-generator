{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
module GEN.Parser where

import Control.Monad.Trans.State ( State, StateT(StateT) )
import Data.Functor.Identity ()
import Control.Monad.Trans.State.Lazy ()
import Control.Monad.Trans.Except (ExceptT (ExceptT), runExceptT, Except, except, runExcept)
import Control.Applicative ()
import Control.Monad (mfilter, MonadPlus, unless)
import Data.Char (isSpace)
import GEN.Utils (Parser(..), ParseError(..), LToken (..), Token (..), runP)
import GEN.Lexer (pToken, nextToken, parseError, pEof)
import GEN.Grammar

data SadParser a = SadParser { label :: Int, value :: a }

parse' :: String -> Either ParseError (SadParser  Double)
parse' input = runP (parseMain (length input)) (input ++ "$")

parse :: String -> Either ParseError  Double
parse input = case parse' input of
  Left err -> Left err
  Right ex -> Right (value ex)

parseLB :: Int -> Parser (SadParser String)
parseLB _ = do
  token <- pToken
  case token of
    (LToken lab (LB)) -> return SadParser { label = lab }
    _ -> parseError ParsingError

parseRB :: Int -> Parser (SadParser String)
parseRB _ = do
  token <- pToken
  case token of
    (LToken lab (RB)) -> return SadParser { label = lab }
    _ -> parseError ParsingError

parsePlus :: Int -> Parser (SadParser String)
parsePlus _ = do
  token <- pToken
  case token of
    (LToken lab (Plus)) -> return SadParser { label = lab }
    _ -> parseError ParsingError

parseMinus :: Int -> Parser (SadParser String)
parseMinus _ = do
  token <- pToken
  case token of
    (LToken lab (Minus)) -> return SadParser { label = lab }
    _ -> parseError ParsingError

parseStar :: Int -> Parser (SadParser String)
parseStar _ = do
  token <- pToken
  case token of
    (LToken lab (Star)) -> return SadParser { label = lab }
    _ -> parseError ParsingError

parseSlash :: Int -> Parser (SadParser String)
parseSlash _ = do
  token <- pToken
  case token of
    (LToken lab (Slash)) -> return SadParser { label = lab }
    _ -> parseError ParsingError

parseDegree :: Int -> Parser (SadParser String)
parseDegree _ = do
  token <- pToken
  case token of
    (LToken lab (Degree)) -> return SadParser { label = lab }
    _ -> parseError ParsingError

parseDigit :: Int -> Parser (SadParser String)
parseDigit _ = do
  token <- pToken
  case token of
    (LToken lab (Digit s)) -> return SadParser { value = s,  label = lab }
    _ -> parseError ParsingError

parseMain :: Int -> Parser (SadParser  Double)
parseMain label' = do
  next <- nextToken
  case next of
    (LToken lab (Digit s)) -> do
      v1 <- parseT (label' + 2)
      v2 <- parseE1 (label' + 4)
      return SadParser { label = label',  value = (value v1) + (value v2) }

    (LToken lab (LB)) -> do
      v1 <- parseT (label' + 2)
      v2 <- parseE1 (label' + 4)
      return SadParser { label = label',  value = (value v1) + (value v2) }

    _ -> parseError ParsingError

parseE1 :: Int -> Parser (SadParser  Double)
parseE1 label' = do
  next <- nextToken
  case next of
    (LToken lab (Plus)) -> do
      v1 <- parsePlus (label' + 2)
      v2 <- parseT (label' + 4)
      v3 <- parseE1 (label' + 6)
      return SadParser { label = label',  value = (value v2) + (value v3) }

    (LToken lab (Minus)) -> do
      v1 <- parseMinus (label' + 2)
      v2 <- parseT (label' + 4)
      v3 <- parseE1 (label' + 6)
      return SadParser { label = label',  value = - (value v2) + (value v3) }

    (LToken lab (RB)) -> do
      return SadParser { label = label',  value = 0 }

    (LToken lab (Eof)) -> do
      return SadParser { label = label',  value = 0 }

    _ -> parseError ParsingError

parseT :: Int -> Parser (SadParser  Double)
parseT label' = do
  next <- nextToken
  case next of
    (LToken lab (Digit s)) -> do
      v1 <- parseF (label' + 2)
      v2 <- parseT1 (label' + 4)
      return SadParser { label = label',  value = (value v1) * (value v2) }

    (LToken lab (LB)) -> do
      v1 <- parseF (label' + 2)
      v2 <- parseT1 (label' + 4)
      return SadParser { label = label',  value = (value v1) * (value v2) }

    _ -> parseError ParsingError

parseT1 :: Int -> Parser (SadParser  Double)
parseT1 label' = do
  next <- nextToken
  case next of
    (LToken lab (Star)) -> do
      v1 <- parseStar (label' + 2)
      v2 <- parseF (label' + 4)
      v3 <- parseT1 (label' + 6)
      return SadParser { label = label',  value = (value v2) * (value v3) }

    (LToken lab (Slash)) -> do
      v1 <- parseSlash (label' + 2)
      v2 <- parseF (label' + 4)
      v3 <- parseT1 (label' + 6)
      return SadParser { label = label',  value = (1.0 / (value v2)) * (value v3) }

    (LToken lab (Plus)) -> do
      return SadParser { label = label',  value = 1 }

    (LToken lab (Minus)) -> do
      return SadParser { label = label',  value = 1 }

    (LToken lab (RB)) -> do
      return SadParser { label = label',  value = 1 }

    (LToken lab (Eof)) -> do
      return SadParser { label = label',  value = 1 }

    _ -> parseError ParsingError

parseF :: Int -> Parser (SadParser  Double)
parseF label' = do
  next <- nextToken
  case next of
    (LToken lab (Digit s)) -> do
      v1 <- parseQ (label' + 2)
      v2 <- parseF1 (label' + 4)
      return SadParser { label = label',  value = (value v1) ** (value v2) }

    (LToken lab (LB)) -> do
      v1 <- parseQ (label' + 2)
      v2 <- parseF1 (label' + 4)
      return SadParser { label = label',  value = (value v1) ** (value v2) }

    _ -> parseError ParsingError

parseF1 :: Int -> Parser (SadParser  Double)
parseF1 label' = do
  next <- nextToken
  case next of
    (LToken lab (Degree)) -> do
      v1 <- parseDegree (label' + 2)
      v2 <- parseQ (label' + 4)
      v3 <- parseF1 (label' + 6)
      return SadParser { label = label',  value = (value v2) ** (value v3) }

    (LToken lab (Star)) -> do
      return SadParser { label = label',  value = 1 }

    (LToken lab (Slash)) -> do
      return SadParser { label = label',  value = 1 }

    (LToken lab (Plus)) -> do
      return SadParser { label = label',  value = 1 }

    (LToken lab (Minus)) -> do
      return SadParser { label = label',  value = 1 }

    (LToken lab (RB)) -> do
      return SadParser { label = label',  value = 1 }

    (LToken lab (Eof)) -> do
      return SadParser { label = label',  value = 1 }

    _ -> parseError ParsingError

parseQ :: Int -> Parser (SadParser  Double)
parseQ label' = do
  next <- nextToken
  case next of
    (LToken lab (Digit s)) -> do
      v1 <- parseDigit (label' + 2)
      return SadParser { label = label',  value = atoi $ value v1 }

    (LToken lab (LB)) -> do
      v1 <- parseLB (label' + 2)
      v2 <- parseMain (label' + 4)
      v3 <- parseRB (label' + 6)
      return SadParser { label = label',  value = (value v2) }

    _ -> parseError ParsingError

