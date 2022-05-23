module Main where

import qualified Data.Graph.Inductive.Graph as G
import qualified Data.GraphViz as G
import qualified Data.GraphViz.Attributes.Complete as G
import qualified Data.GraphViz.Types as G
import qualified Data.Text.Lazy as TL
import qualified Data.Text.Lazy.IO as TL

import GEN.Parser (parse)
-- import Graph (getGraph)

-- CALCULATOR

main :: IO ()
main = do
  str <- getLine
  case parse str of
    Left err   -> print err
    Right expr -> print expr

-- LAB 3

-- main :: IO ()
-- main = do
--   case parse "fun :: A -> B -> C\n      fun x y = hello 1 (ff x y) y" of
--     Left err   -> putStrLn $ show err
--     Right expr -> putStrLn expr

-- LAB 2

-- graphParams :: G.GraphvizParams G.Node String String () String
-- graphParams = G.quickParams

-- main :: IO ()
-- main = do
--     str <- getLine
--     case parse str of
--         Left err -> print err
--         Right tree -> do
--             let (vs, es) = getGraph tree
--                 params = graphParams
--                 dotGraph = G.graphElemsToDot params vs es
--                 dotText = G.printDotGraph dotGraph
--             print tree
--             TL.writeFile "sample.dot" dotText
    
-- dot -Tsvg sample.dot > output.svg