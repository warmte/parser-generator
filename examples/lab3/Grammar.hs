module GEN.Grammar where 

showArgs :: [String] -> [String] -> String
showArgs [x] (y:ys) = x ++ " " ++ y
showArgs (x:xs) [y] = x ++ " " ++ y
showArgs xs [] = ""
showArgs [] ys = ""
showArgs (x:xs) (y:ys) = x ++ " " ++ y ++ ", " ++ showArgs xs ys

showList' :: [String]  -> String
showList' [x] = x
showList' (x:xs)  = x ++ ", " ++ showList' xs
showList' _ = undefined

getFunctionType :: [String] -> Int -> String
getFunctionType [] _ = ""
getFunctionType (y:ys) x | x <= 0 = y
getFunctionType (x:xs) 1 = x
getFunctionType [x] _ = x
getFunctionType (x:xs) size = "Function<" ++ getFunctionType xs (size - 1) ++ ", " ++ x ++ ">"

getArgTypes :: [String] -> Int -> [String]
getArgTypes list cnt | cnt <= 0 = tail list
                         | otherwise = take cnt list