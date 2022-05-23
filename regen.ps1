alex src/Grammar/Lexer.x -o src/Grammar/Lexer.hs  
happy src/Grammar/Parser.y -o src/Grammar/Parser.hs

alex src/Parsing/Lexer.x -o src/Parsing/Lexer.hs  
happy src/Parsing/Parser.y -o src/Parsing/Parser.hs