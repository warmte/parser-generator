module Parsing.Grammar where

import qualified Data.Map
import Debug.Trace (trace)
import Data.List (nub)

-- name, list of child terminals, list of attributes and functions to recount them
data QTerminal = MkNT String [([String], String)] | MkT String Bool deriving Show

buildSadParser :: [(String, String)] -> String
buildSadParser list = "data SadParser a = SadParser { label :: Int" ++ concatMap (\(x, y) -> if x /= "value" then ", " ++ x ++ " :: " ++ y else ", value :: a") list ++ " }\n\n"

buildFirsts :: [QTerminal] -> Data.Map.Map String [[String]]
buildFirsts t = buildFirsts'' t (Data.Map.keys $ nonterminals t) Data.Map.empty

buildFirsts'' :: [QTerminal] -> [String] -> Data.Map.Map String [[String]] -> Data.Map.Map String [[String]]
buildFirsts'' list terminals dict = if dict == ndict then ndict else buildFirsts'' list terminals ndict
  where ndict = buildFirsts' list list terminals dict

buildFirsts' :: [QTerminal] -> [QTerminal] -> [String] -> Data.Map.Map String [[String]]-> Data.Map.Map String [[String]]
buildFirsts' t [] terminals dict = dict
buildFirsts' t ((MkNT name children):xs) terminals dict = buildFirsts' t xs terminals (Data.Map.insert name nlist dict)
  where
    nlist = map (\(x:_, _) -> concat $ Data.Map.findWithDefault [[x | x `elem` terminals]] x dict) children
buildFirsts' t (x:list) terminals dict = buildFirsts' t list terminals dict

buildFollows :: [QTerminal] -> Data.Map.Map String [String]
buildFollows t = buildFollows'' t terminals (Data.Map.singleton "Main" ["Eof"]) (concatMap getPairs (concatMap getChildren t)) (buildFirsts t) (map (\(MkNT name _) -> name) (filter ifEps t))
  where terminals = Data.Map.keys $ nonterminals t

ifEps :: QTerminal -> Bool
ifEps (MkNT name ch) = any (\(list, ev) -> list == ["Eps"]) ch
ifEps _ = False

buildFollows'' :: [QTerminal] -> [String] -> Data.Map.Map String [String] -> [(String, String)] -> Data.Map.Map String [[String]] ->  [String] -> Data.Map.Map String [String]
buildFollows'' list terminals dict pairs firsts eps = if dict == ndict then ndict else buildFollows'' list terminals ndict pairs firsts eps
  where ndict = buildFollows' list (matchPairs pairs terminals dict firsts eps) terminals

buildFollows' :: [QTerminal] -> Data.Map.Map String [String] -> [String] -> Data.Map.Map String [String]
buildFollows' list dict terminals = matchEndings (concatMap getEndings list) terminals dict

getChildren :: QTerminal -> [[String]]
getChildren (MkNT name []) = []
getChildren (MkNT name ((ch, ev):xs)) = ch : getChildren (MkNT name xs)
getChildren (MkT _ _) = []

getPairs :: [String] -> [(String, String)]
getPairs [] = []
getPairs [x] = []
getPairs (x:y:xs) = (x, y) : getPairs (y:xs)

getEndings :: QTerminal -> [(String, String)]
getEndings (MkNT name list) = map (\(ch, ev) -> (name, last ch)) list
getEndings (MkT _ _) = []

matchPairs :: [(String, String)] -> [String] -> Data.Map.Map String [String]-> Data.Map.Map String [[String]] -> [String] -> Data.Map.Map String [String]
matchPairs [] _ dict firsts eps = dict
matchPairs ((x, y):xs) terminals dict firsts eps
  | x `elem` terminals = matchPairs xs terminals dict firsts eps
  | y `elem` terminals = matchPairs xs terminals (Data.Map.insert x (nub $ y:Data.Map.findWithDefault [] x dict) dict) firsts eps
  | y `elem` eps = matchPairs xs terminals (Data.Map.insert x (nub $ filter (/= "Eps") (concat (Data.Map.findWithDefault [] y firsts)) ++ Data.Map.findWithDefault [] x dict ++ Data.Map.findWithDefault [] y dict) dict) firsts eps
  | otherwise = matchPairs xs terminals (Data.Map.insert x (nub $ filter (/= "Eps") (concat (Data.Map.findWithDefault [] y firsts)) ++ Data.Map.findWithDefault [] x dict) dict) firsts eps

matchEndings :: [(String, String)] -> [String] -> Data.Map.Map String [String] -> Data.Map.Map String [String]
matchEndings [] _ dict = dict
matchEndings ((x, y):xs) terminals dict
  | x `elem` terminals || y `elem` terminals || x == y = matchEndings xs terminals dict
  | otherwise = matchEndings xs terminals (Data.Map.insert y (nub $ Data.Map.findWithDefault [] y dict ++ Data.Map.findWithDefault [] x dict) dict)


buildParse :: String -> String
buildParse valtype =
  "parse' :: String -> Either ParseError (SadParser " ++ valtype ++ ")\n" ++
  "parse' input = runP (parseMain (length input)) (input ++ \"$\")\n\n" ++
  "parse :: String -> Either ParseError " ++ valtype ++ "\n" ++
  "parse input = case parse' input of\n" ++
  "  Left err -> Left err\n" ++
  "  Right ex -> Right (value ex)\n\n"

buildQTerminal :: String -> Data.Map.Map String Bool -> Data.Map.Map String [[String]] -> Data.Map.Map String [String] -> QTerminal -> String
buildQTerminal valtype dict ff fl t = buildParseFunction t valtype dict ff fl

-- buildQTerminal :: String -> Data.Map.Map String Bool -> Data.Map.Map String [[String]] -> QTerminal -> String
-- buildQTerminal valtype dict ff t = trace (show ff) buildParseFunction t valtype dict ff follows

sp :: Int -> String
sp cnt = concat (replicate cnt "  ")

buildNonterminalParser :: String -> Bool -> String
buildNonterminalParser name fl =
  sp 1 ++ "token <- pToken\n" ++
  sp 1 ++ "case token of\n" ++
  sp 2 ++ "(LToken lab (" ++ name ++ (if fl then " s" else "")  ++ "))"++ " -> return SadParser {" ++ (if fl then " value = s, " else "") ++ " label = lab }\n" ++
  sp 2 ++ "_ -> parseError ParsingError\n\n"

-- TODO count
-- firsts :: Data.Map.Map String [[String]]
-- firsts = Data.Map.fromList [("Main", [["Digit", "LB"]]), ("E1", [["Plus"], ["Eps"]]), ("T", [["Digit", "LB"]]), ("T1", [["Star"], ["Eps"]]), ("F", [["Digit"], ["LB"]])]

-- follows :: Data.Map.Map String [String]
-- follows = Data.Map.fromList [("Main", ["Eof", "RB"]), ("E1", ["Eof", "RB"]), ("T", ["Eof", "RB", "Plus"]), ("T1", ["Eof", "RB", "Plus"]), ("F", ["Eof", "RB", "Plus", "Star"])]
-- TODO end

buildParseFunction :: QTerminal -> String -> Data.Map.Map String Bool -> Data.Map.Map String [[String]] -> Data.Map.Map String [String] -> String
buildParseFunction (MkNT name children) valtype dict firsts follows = 
  -- trace (show firsts ++ "\n" ++ show follows)
  "parse" ++ name ++ " :: Int -> Parser (SadParser " ++ valtype ++ ")\n" ++
  "parse" ++ name ++ " label' = do\n" ++
  sp 1 ++ "next <- nextToken\n" ++
  sp 1 ++ "case next of\n" ++ goVariants children 2 dict (Data.Map.findWithDefault [] name firsts) (Data.Map.findWithDefault [] name follows)
buildParseFunction (MkT name fl) _ _ _ _ =
  "parse" ++ name ++ " :: Int -> Parser (SadParser String)\n" ++
  "parse" ++ name ++ " _ = do\n" ++ buildNonterminalParser name fl

nonterminals :: [QTerminal] -> Data.Map.Map String Bool
nonterminals [] = Data.Map.fromList [("Eof", False), ("Eps", False)]
nonterminals (MkNT _ _ :xs) = nonterminals xs
nonterminals (MkT name fl:xs) = Data.Map.insert name fl (nonterminals xs)

goVariants :: [([String], String)] -> Int -> Data.Map.Map String Bool -> [[String]] -> [String] -> String
goVariants [] cnt _ _ _ = sp cnt ++ "_ -> parseError ParsingError\n\n"
goVariants ((children, ev):xs) cnt dict ([]:fs) follow = goVariants xs cnt dict fs follow
goVariants ((children, ev):xs) cnt dict ((name:ns):fs) follow =
  if name /= "Eps"
    then
      sp cnt ++ "(LToken lab (" ++ name ++ (if Data.Map.findWithDefault False name dict then " s" else "")  ++ "))"++ " -> do\n" ++
      buildTokensProcessing children 3 1 ev (Data.Map.findWithDefault False name dict) ++
      goVariants ((children, ev):xs) cnt dict (ns:fs) follow
    else
      buildEps cnt follow ev dict ++ goVariants ((children, ev):xs) cnt dict (ns:fs) follow
goVariants x1 _ _ x4 x5 = trace (show x1 ++ "\n" ++ show x4 ++ "\n" ++ show x5) undefined

buildEps :: Int -> [String] -> String -> Data.Map.Map String Bool -> String
buildEps cnt [] _ _ = ""
buildEps cnt (name:xs) ev dict =
  sp cnt ++ "(LToken lab (" ++ name ++ (if Data.Map.findWithDefault False name dict then " s" else "")  ++ "))"++ " -> do\n" ++
  sp (cnt + 1) ++ "return SadParser { label = label', " ++ fmap (\c -> if c == '#' then 'v' else c) ev ++ " }\n\n" ++
  buildEps cnt xs ev dict

buildTokensProcessing :: [String] -> Int -> Int -> String -> Bool -> String
buildTokensProcessing [] cnt num ev fl =
  sp cnt ++ "return SadParser { label = label', " ++ fmap (\c -> if c == '#' then 'v' else c) ev ++ " }\n\n"
buildTokensProcessing (x:xs) cnt num ev fl =
  sp cnt ++ "v" ++ show num ++ " <- parse" ++ x ++ " (label' + " ++ show (2 * num) ++ ")\n" ++ buildTokensProcessing xs cnt (num + 1) ev fl
