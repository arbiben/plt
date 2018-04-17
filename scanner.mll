(* 
An Ocamllex input file
    Specifies how to tokenize a stream of input characters
    References and is based off of some MicroC features 
Built off of the MicroC Scanner
    *)
{ open Parser }

let digit = ['0' - '9']
let digits = digit+

rule token = parse
  [' ' '\t' '\r' '\n'] { token lexbuf } (* Whitespace *)
| '$'     { comment lexbuf }           (* Comments *)
| '('      { LPAREN }
| ')'      { RPAREN }
| '{'      { LBRACE }
| '}'      { RBRACE }
| '@'      { AT }
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
| "str"    { STRING }
| "arr"    { ARR }
| "T"      { BLIT(true)  }
| "F"      { BLIT(false) }
| "struct"  { STRUCT }
| '.'      { DOT }
| "file"   { FILE }
| "dir"    { DIRECTORY }
| digits as lxm { LITERAL(int_of_string lxm) }
| ['a'-'z' 'A'-'Z']['a'-'z' 'A'-'Z' '0'-'9' '_']*    as lxm { ID(lxm) }
| ['\"'] [^'\"']* ['\"']  as lxm { STRLIT(String.sub (lxm) 1 (String.length (lxm) -2)) }
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  '$' { token lexbuf }
| _    { comment lexbuf }

