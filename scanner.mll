(* 
An Ocamllex input file
    Specifies how to tokenize a stream of input characters
    
Things we added to micro C:
    - CHAR
    - ARR
    - STRUCT
    - DOT
    - PRINT
    - OPEN
    - CLOSE
    - file/dir/str type keywords
    - r and l brackets
    
Functions written? :
    int readlines ()
Array declr?
    char arr x = ['4', '5', '6']
bring back void?
 
Do we need to implement a reserved keyword for important classes like file, directory, etc? Yes

*)
{ open Parser }

let digit = ['0' - '9']
let digits = digit+
let ch = ['a' - 'z' 'A' - 'Z']
(*let ch = ["'"] [ (['\'] ['t' 'r' 'n']) '_' ] ["'"]*) (* took care of escaped characters *)
(* arr ['['] ([ _ ] [','] )* [ _ ] [']'] (* do we need to account for whitespaces? does the parse rule already know?*)*)
(*['['] digits [']'] (* needs to be differentiated from arr? *)*)

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
| "sruct"  { STRUCT }
| '.'      { DOT }
| "print"  { PRINT }
| "open"   { OPEN }
| "close"  { CLOSE }
| "file"   { FILE }
| "dir"    { DIRECTORY }
| "str"    { STRING }
| digits as lxm { LITERAL(int_of_string lxm) }
| ch as lxm { CHAR(lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*    as lxm { ID(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  '$' { token lexbuf }
| _    { comment lexbuf }
 
