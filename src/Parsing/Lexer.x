{
module Parsing.Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$small_alpha = [a-z]
$big_alpha = [A-Z]
$special = [\<\>\:\=\%\&\.\;\,\$\*\+\?\#\~\-\{\}\(\)\[\]\^\/\"\'\\]

tokens :-

  $white+                                        ;
  "#".*                                          ;
  \\n                                            ;            
  \:                                             { \_ -> Colon }
  "@tokens"                                      { \_ -> TokenFlag }
  "@attributes"                                  { \_ -> AttrFlag }
  "@parser"                                      { \_ -> ParserFlag }
  "%token"                                       { \_ -> TokenSymbol }
  "%stoken"                                      { \_ -> StrTokenSymbol }
  "%attr"                                        { \_ -> AttrSymbol }
  \%                                             { \_ -> Percent }
  $big_alpha [$alpha $digit]*                           { \s -> Terminal s }
  $small_alpha+                                  { \s -> Attr s }
  \| $white+ [$special $alpha $digit \ ]*    { \(c:s) -> AttrEval s }

{

data Token = Percent 
           | Colon 
           | TokenFlag
           | AttrFlag 
           | ParserFlag 
           | TokenSymbol 
           | StrTokenSymbol 
           | AttrSymbol 
           | Attr String
           | AttrEval String 
           | Terminal String 
           deriving (Eq, Show)
}


