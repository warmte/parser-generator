module GEN.Grammar where 

data Tree = Leaf String Int | Node String Int [Tree] deriving (Show, Eq)

prettyArgs :: [String] -> String 
prettyArgs [] = ""
prettyArgs [x] = x 
prettyArgs (x:xs) = x ++ ", " ++ prettyArgs xs