(* 
An Ocamllex input file
    Specifies how to tokenize a stream of input characters
    References and is based off of some MicroC features 
*)
{ open Parser }

let digit = ['0' - '9']
let digits = digit+
let legalchars = [ 'a' - 'z'  'A' - 'Z' '0' - '9'
    ' ' '\t' '\r' '\n' '\b' '\\' '\"'  '\'' '~'
    '!' '@' '#' '$' '%' '^' '&' '*' '`' '(' ')'
    '_' '-' '+' '=' '|' ']' '[' '}' '{' ':' '<'
    ';' '/' '>' ',' '.' '?' ]
let ch = ['\''] legalchars ['\''] 
(*Question: is there a better way to do this?  *)

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| '$'     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '['      { LBRACKET }
| ']'      { RBRACKET }
| '?'      { SEMI }
| ','      { COMMA }
| '+'      { PLUS }
| '-'      { MINUS }
| '*'      { TIMES }
| '/'      { DIVIDE }
| '%'      { MODULO }
| '='      { ASSIGN }
| "is"     { EQ }
| '<'      { LT }
| "<="     { LEQ }
| ">"      { GT }
| ">="     { GEQ }
| "and"    { AND }
| "or"     { OR }
| "not"    { NOT }
| "if"     { IF }
| "else"   { ELSE }
| "for"    { FOR }
| "while"  { WHILE }
| "return" { RETURN }
| "int"    { INT }
| "bool"   { BOOL }
| "char"   { CHAR }
| "arr"    { ARR }
| "T"      { BLIT(true)  }
| "F"      { BLIT(false) }
| "struct"  { STRUCT }
| '.'      { DOT }
| "print"  { PRINT }
| "open"   { OPEN }
| "close"  { CLOSE }
| "file"   { FILE }
| "dir"    { DIRECTORY }
| "str"    { STRING }
| digits as lxm { LITERAL(int_of_string lxm) }
| ch as lxm { CHARLIT(lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*    as lxm { ID(lxm) }
| ['\"'] [^'\"']* ['\"']  as lxm	{ STRLIT(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  '$' { token lexbuf }
| _    { comment lexbuf }

