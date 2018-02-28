type token =
  | SEMI
  | LPAREN
  | RPAREN
  | LBRACE
  | RBRACE
  | LBRACKET
  | RBRACKET
  | COMMA
  | PLUS
  | MINUS
  | TIMES
  | DIVIDE
  | MODULO
  | ASSIGN
  | DOT
  | NOT
  | EQ
  | LT
  | LEQ
  | GT
  | GEQ
  | AND
  | OR
  | RETURN
  | IF
  | ELSE
  | FOR
  | WHILE
  | INT
  | BOOL
  | CHAR
  | LITERAL of (int)
  | BLIT of (bool)
  | CHARLIT of (string)
  | STRLIT of (string)
  | ARR
  | STRING
  | DIRECTORY
  | FILE
  | STRUCT
  | PRINT
  | OPEN
  | CLOSE
  | MAIN
  | EOF
  | ID of (string)

val program :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.program
