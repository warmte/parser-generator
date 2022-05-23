module Main where
  import System.Directory (getCurrentDirectory, createDirectoryIfMissing)
  import qualified Grammar.Lexer (alexScanTokens)
  import qualified Grammar.Parser (parse)
  import qualified Parsing.Lexer (alexScanTokens)
  import qualified Parsing.Parser (parse)

  createAndWriteFile :: FilePath -> String -> String -> IO ()
  createAndWriteFile path dir content = do
    createDirectoryIfMissing True path
    writeFile (path ++ dir) content

  writeLexer :: IO ()
  writeLexer = do 
    dir <- getCurrentDirectory 
    contents <- readFile $ dir ++ "\\SOURCES\\Lexer.txt" 
    createAndWriteFile (dir ++ "\\src\\GEN\\") "Lexer.hs" contents

  writeUtils :: IO ()
  writeUtils = do
    dir <-getCurrentDirectory 
    contents <- readFile $ dir ++ "\\SOURCES\\Utils.txt" 
    input <- readFile $ dir ++ "\\grammar\\Lexer.txt" 
    case Grammar.Parser.parse (Grammar.Lexer.alexScanTokens input) of
      Left err   -> putStrLn err
      Right expr -> createAndWriteFile (dir ++ "\\src\\GEN\\") "Utils.hs" (contents ++ "\n\n" ++ expr)


  writeParser :: IO ()
  writeParser = do
    dir <-getCurrentDirectory 
    contents <- readFile $ dir ++ "\\SOURCES\\Parser.txt" 
    input <- readFile $ dir ++ "\\grammar\\Parser.txt" 
    case Parsing.Parser.parse (Parsing.Lexer.alexScanTokens input) of
      Left err   -> putStrLn err
      Right expr -> createAndWriteFile (dir ++ "\\src\\GEN\\") "Parser.hs" (contents ++ "\n\n" ++ expr)

  writeGrammar :: IO ()
  writeGrammar = do 
    dir <- getCurrentDirectory 
    contents <- readFile $ dir ++ "\\grammar\\Grammar.hs" 
    createAndWriteFile (dir ++ "\\src\\GEN\\") "Grammar.hs" contents
  
  main :: IO ()
  main = do
    writeLexer
    writeUtils
    writeParser
    writeGrammar
    
