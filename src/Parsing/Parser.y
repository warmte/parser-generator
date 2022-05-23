{
module Parsing.Parser where

import Parsing.Lexer
import Parsing.Grammar 
}

%name      parse
%tokentype { Token }
%error     { parseError }
%monad     { Either String }{ >>= }{ return }

%token COLON          { Colon }
%token PERCENT        { Percent }
%token TOKENFLAG      { TokenFlag }
%token ATTRFLAG       { AttrFlag }
%token PARSERFLAG     { ParserFlag }
%token TOKEN          { TokenSymbol }
%token STRTOKEN       { StrTokenSymbol }
%token ATTRSYM        { AttrSymbol }
%token ATTR           { Attr $$ }
%token ATTREVAL       { AttrEval $$ }
%token TERMINAL       { Terminal $$ }

%attributetype { Attrs }
%attribute value { String }
%attribute terminals { [QTerminal] }
%attribute attrs { [(String, String)] }
%attribute valtype { String }
%attribute children { [String] }
%attribute variants { [([String], String)] }

%%
Expr 
  : TOKENFLAG Tokens ATTRFLAG Attributes PARSERFLAG Nonterminals { $$ = (buildSadParser $4.attrs) ++ (buildParse $4.valtype) ++ (concatMap (buildQTerminal $4.valtype (nonterminals $2.terminals) (buildFirsts ($2.terminals ++ $6.terminals)) (buildFollows ($2.terminals ++ $6.terminals))) ($2.terminals ++ $6.terminals)) }

Tokens
  : Token                              { $$.terminals = $1.terminals }
  | Token Tokens                       { $$.terminals = $1.terminals ++ $2.terminals }

Token 
  : TOKEN TERMINAL    { $$.terminals = [(MkT $2 False)] }
  | STRTOKEN TERMINAL { $$.terminals = [(MkT $2 True)] }

Attributes 
  : OneAttr { $$.attrs = $1.attrs
            ; $$.valtype = $1.valtype
            }
  | OneAttr Attributes { $$.attrs = $1.attrs ++ $2.attrs
                       ; $$.valtype = (if $1.valtype == "" then $2.valtype else $1.valtype )
                       }

OneAttr 
  :  ATTRSYM ATTR ATTREVAL { $$.attrs = [($2, $3)]
                               ; $$.valtype = (if $2 == "value" then $3 else "")
                               }

Nonterminals 
  : Nonterminal { $$.terminals = $1.terminals }
  | Nonterminal Nonterminals { $$.terminals = $1.terminals ++ $2.terminals  }

Nonterminal 
  : PERCENT TERMINAL Variants { $$.terminals = [(MkNT $2 $3.variants)] }

Variants 
  : Variant { $$.variants = $1.variants }
  | Variant Variants { $$.variants = $1.variants ++ $2.variants }

Variant 
  : COLON Args ATTREVAL { $$.variants = [ ($2.children, $3) ] }

Args 
  : TERMINAL { $$.children = [$1] }
  | TERMINAL Args { $$.children = ($1) : $2.children }

{
  parseError = error "Parser error"
}