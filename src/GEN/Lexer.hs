{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE DoAndIfThenElse #-}
module GEN.Lexer where

import Data.Char (isSpace, isLetter, isDigit, isAlpha, isAlphaNum)
import Data.Maybe (fromMaybe, isNothing, fromJust, isJust)
import Data.Either (fromRight)
import GEN.Utils (Parser(..), ParseError(..), LToken (..), Token (..), runP, tokens, literals)
import Control.Monad.Trans.Except (Except, except, runExcept)
import Control.Monad.Trans.State (StateT(StateT), evalStateT, execStateT, get, modify)
import Control.Monad (when)
import Data.Map as Map ( empty, fromList, insert, keys, lookup, member, null, Map ) 
import Debug.Trace (trace)

runPSym :: Parser a -> Int  -> String -> Except ParseError (a, (Int, String))
runPSym (P curState) x input = case runExcept $ evalStateT curState (x, input) of
  Left l -> except $ Left l
  Right res -> except $ Right (res, nstate)
    where nstate = fromRight (x, input) $ runExcept (execStateT curState (x, input))

pSym :: Parser (Char, Int)
pSym = P $ StateT $ \(x, s) ->
  case s of
    []     -> except $ Left TokenizerError
    (c:cs) -> if isSpace c then runPSym pSym x cs else except (Right ((c, x), (x + 1, cs)))

pValidChar :: (Char -> Bool) -> Parser (Maybe Char)
pValidChar check = P $ StateT $ \(x, s) ->
  case s of
    []     -> except (Right (Nothing, (x, "")))
    (c:cs) -> if check c
      then except (Right (Just c, (x, cs)))
      else except (Right (Just c, (x, c:cs)))

pString :: Trie -> Parser (Maybe String)
pString trie = P $ StateT $ \(x, str) ->
  case getFromTrie trie str of 
    Nothing -> except (Right (Nothing, (x, str)))
    Just token -> except (Right (Just token, (x, Prelude.drop (length token) str)))

getFromTrie :: Trie -> String -> Maybe String 
getFromTrie (Node dict) _ | Map.null dict = Just ""
getFromTrie (Node dict) [] = Nothing 
getFromTrie (Node dict) (x:xs) = 
  if Map.member x dict 
    then case getFromTrie (fromJust $ Map.lookup x dict) xs of 
      Just str -> Just (x:str)
      Nothing -> Nothing 
    else Nothing


pEof :: Parser ()
pEof = P $ StateT $ \(x, s) ->
  if Prelude.null s
    then except (Right ((), (x, "")))
    else except $ Left TokenizerError

pMany :: (Char -> Bool) -> Parser String
pMany valid = do
  c <- pValidChar valid
  if valid $ fromMaybe ' ' c
    then do
      tail <- pMany valid
      return (fromJust c : tail)
    else return ""

parseError :: ParseError -> Parser a
parseError err = P $ StateT $ \(x, s) -> except $ Left err

trie :: Trie 
trie = buildTrie $ Map.keys tokens

trieHasChild :: Trie -> Char -> Bool
trieHasChild (Node dict) c = Map.member c dict

trieGetChild :: Trie -> Char -> Trie 
trieGetChild (Node dict) c = fromJust $ Map.lookup c dict

newtype Trie = Node (Map.Map Char Trie) deriving Show 

buildTrie :: [String] -> Trie
buildTrie [] = Node Map.empty
buildTrie (x:xs) = addStringToTrie (buildTrie xs) x

addStringToTrie :: Trie -> String -> Trie 
addStringToTrie tr [] = tr 
addStringToTrie (Node dict) (x:xs) = 
  if Map.member x dict 
    then Node (Map.insert x (addStringToTrie (fromJust $ Map.lookup x dict) xs) dict) 
    else Node (Map.insert x (addStringToTrie (Node Map.empty) xs) dict) 

tryParse :: String -> Parser (Maybe String)
tryParse [] = return Nothing 
tryParse [x] = do 
  ch <- pValidChar (== x)
  case ch of 
    Just c -> return $ Just (c:"")
    Nothing -> return Nothing
tryParse (x:xs) = do 
  ch <- pValidChar (== x)
  case ch of 
    Just c -> do
      tl <- tryParse xs
      case tl of 
        Just tl' -> return $ Just (c:tl')
        Nothing -> return Nothing 
    Nothing -> return Nothing

tryLiterals :: [(Char -> Bool, Char -> Bool, String -> Token)] -> Char -> Int -> Parser (LToken Int)
tryLiterals [] _ _ = parseError TokenizerError
tryLiterals ((first, rest, token):xs) c label = 
  if first c 
    then pLiteral c label token rest 
    else tryLiterals xs c label

pLiteral :: Char -> Int -> (String -> Token) -> (Char -> Bool) -> Parser (LToken Int)
pLiteral c label token f = do 
  s <- pMany f
  return $ LToken label $ token (c:s)

pToken :: Parser (LToken Int)
pToken = do
  (c, label) <- pSym
  if trieHasChild trie c
    then do 
      token <- pString (trieGetChild trie c)
      case token of 
        Just str -> return $ LToken label (fromJust $ Map.lookup (c:str) tokens)
        Nothing -> tryLiterals literals c label 
    else tryLiterals literals c label 

nextToken :: Parser (LToken Int)
nextToken = do
  cur <- P get
  next <- pToken
  P (modify (const cur))
  return next

lexer :: Parser [LToken Int]
lexer = do 
  nt <- pToken
  case nt of 
    LToken _ Eof -> return []
    x -> do 
      other <- lexer 
      return $ x:other

lex :: String -> Either ParseError [LToken Int]
lex input = runP lexer (input ++ "$")