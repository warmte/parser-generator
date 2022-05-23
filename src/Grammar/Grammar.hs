module Grammar.Grammar where

checksToFunction :: [String] -> String
checksToFunction [] = "(\\c -> True)"
checksToFunction (x:xs) = "(\\c -> " ++ x ++ " c" ++ ptail xs ++ ")"

ptail :: [String] -> String
ptail [] = ""
ptail (x:xs) = " || " ++ x ++ " c"

buildToken :: [(String, String)] -> [(String, String, String)] -> String
buildToken tokens literals = "data Token = " ++ concatMap (\(x, y) -> y ++ " | ") tokens ++ concatMap (\(x, y, z) -> z ++ " String | ") literals ++ "Eof | Eps deriving (Show, Eq)\n\n"

showTokens :: [(String, String)] -> String
showTokens [] = "[(\"$\", Eof)]"
showTokens xs = "[" ++ showTokens' xs ++ "(\"$\", Eof)]"

showTokens' :: [(String, String)] -> String
showTokens' [] = ""
showTokens' ((x, y):xs) = "(" ++ x ++ ", " ++ y ++ ")" ++ ", " ++ showTokens' xs

showLiterals :: [(String, String, String)] -> String
showLiterals [] = "[]"
showLiterals (x:xs) = "[" ++ showLiteral x ++ showLiterals' xs ++ "]"

showLiteral :: (String, String, String) -> String
showLiteral (x, y, z) = "(" ++ x ++ ", " ++ y ++ ", " ++ z ++ ")"

showLiterals' :: [(String, String, String)] -> String
showLiterals' [] = ""
showLiterals' (x:xs) = ", " ++ showLiteral x ++ showLiterals' xs