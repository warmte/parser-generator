{
module Grammar.Lexer where
}

%wrapper "basic"

$digit = 0-9
$alpha = [a-zA-Z]
$small_alpha = [a-z]
$big_alpha = [A-Z]
$special = [\<\>\:\=\%\&\.\;\,\$\*\+\?\#\~\-\{\}\(\)\[\]\^\/]

tokens :-

  $white+                          ;
  "#".*                            ;
  \\n                              ;            
  "@"                              { \_ -> SimpleT }
  "$"                              { \_ -> StringT }
  \|                               { \_ -> Sep }
  "!alpha"                         { \_ -> Check "isAlpha"}
  "!upper"                         { \_ -> Check "isUpper"}
  "!lower"                         { \_ -> Check "isLower"}
  "!digit"                         { \_ -> Check "isDigit"}
  $special [$special]*             { \s -> TokenStr s }
  $small_alpha [$small_alpha]*     { \s -> TokenStr s }
  $big_alpha [$alpha]*             { \s -> TokenName s }

{

data Token = SimpleT 
           | StringT 
           | Sep 
           | Check String
           | TokenStr String 
           | TokenName String
           deriving (Eq, Show)
}


