(* 
An Ocamllex input file
    Specifies how to tokenize a stream of input characters
    
Things we added to micro C:
    - CHAR
    - ARR- is this a type?
    - INDEX
    - CLASS
    - PRINT
    - OPEN
    - CLOSE
    
Functions written? :
    int readlines ()
Array declr?
    char arr x = ['4', '5', '6']
 
Do we need to implement a reserved keyword for important classes like file, directory, etc?

*)
{ open Parser }

let digit = ['0' - '9']
let digits = digit+
let ch = ["'"] [ (['\'] ['t' 'r' 'n']) _ ] ["'"] (* took care of escaped characters *)
let arr = ['['] ([ _ ] [','] )* [ _ ] [']'] (* do we need to account for whitespaces? does the parse rule already know?*)
let idx = ['['] digits [']'] (* needs to be differentiated from arr? *)

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| '$'     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
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
| "cls"    { CLS }
| "print"  { PRINT }
| "open"   { OPEN }
| "close"  { CLOSE }
| digits as lxm { LITERAL(int_of_string lxm) }
| ch as lxm { CHAR(lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*    as lxm { ID(lxm) }
| arr as lxm { ARR(lxm) }
| idx as lxm { INDEX(lxm) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  '$' { token lexbuf }
| _    { comment lexbuf }
 
