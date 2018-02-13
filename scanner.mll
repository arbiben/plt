(* 
An Ocamllex input file
    Specifies how to tokenize a stream of input characters
*)
{ open Parser }

let digit = ['0' - '9']
let digits = digit+
let ch = (* put code for all chars here*)
let chars = ch+ (*??? Do we want chars? or char arrays?*)

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
| "true"   { BLIT(true)  }
| "false"  { BLIT(false) }
| "cls" (**)
| "array" (**)
| "[]" (*/*)
| "print" (**)
| "fun" (**)
| "open" (*????*)
| "close" (*?????*)
| file (*??????*)
| digits as lxm { LITERAL(int_of_string lxm) }
| ch as  (* characters?*)
| eof { EOF }
| _ as char { raise (Failure("illegal character " ^ Char.escaped char)) }

and comment = parse
  '$' { token lexbuf }
| _    { comment lexbuf }
 
