{
module Grammar.Parser where

import Grammar.Lexer
import Grammar.Grammar 
}

%name      parse
%tokentype { Token }
%error     { parseError }
%monad     { Either String }{ >>= }{ return }

%token SIMPLET  { SimpleT }
%token STRINGT  { StringT }
%token SEP      { Sep }
%token CHECK    { Check $$  }
%token TSTR     { TokenStr $$ }
%token TNAME    { TokenName $$ }

%attributetype { Attrs }
%attribute value { String }
%attribute tokens { [(String, String)] }
%attribute literals { [(String, String, String)] }
%attribute checks { [String] }

%%
Expr 
  : Many  {$$ = (buildToken $1.tokens $1.literals) ++  "tokens :: Map.Map String Token\ntokens = Map.fromList " ++ showTokens $1.tokens ++ "\n\nliterals :: [(Char -> Bool, Char -> Bool, String -> Token)]\nliterals = " ++ showLiterals $1.literals}

Many
  : One                              { $$.tokens = $1.tokens
                                     ; $$.literals = $1.literals 
                                     }
  | One Many                         { $$.tokens = $1.tokens ++ $2.tokens
                                     ; $$.literals = $1.literals ++ $2.literals 
                                     } 

One
  : SIMPLET TSTR SEP TNAME                      { $$.tokens = [("\"" ++ $2 ++ "\"", $4)]
                                                ; $$.literals = [] 
                                                }
  | STRINGT Checks SEP Checks SEP TNAME          { $$.tokens = []
                                                 ; $$.literals = [(checksToFunction $2.checks, checksToFunction $4.checks, $6)] 
                                                 }

Checks 
  : CHECK                { $$.checks = [$1] }
  | CHECK Checks         { $$.checks = $1 : $2.checks }

{
  parseError = error "Lexer error"
}