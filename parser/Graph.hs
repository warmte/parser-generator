{-# LANGUAGE DerivingStrategies #-}
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Graph where
    -- import qualified Data.Graph.Inductive.Graph as G
    -- import qualified Data.GraphViz as G
    -- import qualified Data.GraphViz.Attributes.Complete as G
    -- import qualified Data.GraphViz.Types as G
    -- import qualified Data.Text.Lazy as TL
    -- import qualified Data.Text.Lazy.IO as TL
    -- import Control.Monad.Trans.State.Lazy ( StateT(StateT), State, state, evalStateT, evalState )
    -- import GEN.Parser (parse)
    -- import GEN.Grammar (Tree(..))
    
    -- newtype TreeWalker a = TW (State Tree a)
    --     deriving newtype (Functor, Applicative, Monad)

    -- runDfs :: TreeWalker ([G.LNode String], [G.LEdge String]) -> Tree -> ([G.LNode String], [G.LEdge String])
    -- runDfs (TW curState) = evalState curState

    -- dfs :: TreeWalker ([G.LNode String], [G.LEdge String])
    -- dfs = TW $ state $ \x ->
    --     case x of
    --         (Leaf label v)     -> (([(v, label)], []), x)
    --         (Node label v children) -> (((v, label) : vs, getEdges v children ++ es), x)
    --             where
    --                 (vs, es) = dfsMultiple children

    -- dfsMultiple :: [Tree]-> ([G.LNode String], [G.LEdge String])
    -- dfsMultiple [] = ([], [])
    -- dfsMultiple (x:xs) = (nvs ++ vs, nes ++ es)
    --     where
    --         (nvs, nes) = runDfs dfs x
    --         (vs, es) = dfsMultiple xs

    -- getEdges :: G.Node -> [Tree] -> [G.LEdge String]
    -- getEdges v [] = []
    -- getEdges v ((Leaf _ u):xs) = (v, u, "") : getEdges v xs
    -- getEdges v ((Node _ u _):xs) = (v, u, "") : getEdges v xs

    -- getGraph :: Tree -> ([G.LNode String], [G.LEdge String])
    -- getGraph = runDfs dfs

    -- test :: String -> ([G.LNode String], [G.LEdge String])
    -- test s = case parse s of
    --     (Left _) -> ([],[])
    --     (Right t) -> runDfs dfs t