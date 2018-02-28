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

open Parsing;;
let _ = parse_error;;
# 11 "parser.mly"

open Ast
# 55 "parser.ml"
let yytransl_const = [|
  257 (* SEMI *);
  258 (* LPAREN *);
  259 (* RPAREN *);
  260 (* LBRACE *);
  261 (* RBRACE *);
  262 (* LBRACKET *);
  263 (* RBRACKET *);
  264 (* COMMA *);
  265 (* PLUS *);
  266 (* MINUS *);
  267 (* TIMES *);
  268 (* DIVIDE *);
  269 (* MODULO *);
  270 (* ASSIGN *);
  271 (* DOT *);
  272 (* NOT *);
  273 (* EQ *);
  274 (* LT *);
  275 (* LEQ *);
  276 (* GT *);
  277 (* GEQ *);
  278 (* AND *);
  279 (* OR *);
  280 (* RETURN *);
  281 (* IF *);
  282 (* ELSE *);
  283 (* FOR *);
  284 (* WHILE *);
  285 (* INT *);
  286 (* BOOL *);
  287 (* CHAR *);
  292 (* ARR *);
  293 (* STRING *);
  294 (* DIRECTORY *);
  295 (* FILE *);
  296 (* STRUCT *);
  297 (* PRINT *);
  298 (* OPEN *);
  299 (* CLOSE *);
  300 (* MAIN *);
    0 (* EOF *);
    0|]

let yytransl_block = [|
  288 (* LITERAL *);
  289 (* BLIT *);
  290 (* CHARLIT *);
  291 (* STRLIT *);
  301 (* ID *);
    0|]

let yylhs = "\255\255\
\001\000\002\000\002\000\002\000\002\000\005\000\004\000\008\000\
\008\000\010\000\010\000\007\000\007\000\007\000\007\000\006\000\
\006\000\003\000\009\000\009\000\011\000\011\000\011\000\011\000\
\011\000\011\000\011\000\011\000\011\000\011\000\013\000\013\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\012\000\012\000\012\000\012\000\012\000\012\000\012\000\
\012\000\014\000\014\000\014\000\015\000\015\000\016\000\016\000\
\000\000"

let yylen = "\002\000\
\002\000\000\000\002\000\002\000\002\000\005\000\009\000\000\000\
\001\000\002\000\004\000\001\000\001\000\001\000\001\000\000\000\
\002\000\003\000\000\000\002\000\002\000\003\000\003\000\005\000\
\007\000\009\000\005\000\005\000\005\000\005\000\000\000\001\000\
\001\000\001\000\001\000\001\000\001\000\003\000\003\000\003\000\
\003\000\003\000\003\000\003\000\003\000\003\000\003\000\003\000\
\003\000\002\000\002\000\003\000\003\000\004\000\003\000\004\000\
\003\000\000\000\001\000\003\000\000\000\001\000\001\000\003\000\
\002\000"

let yydefred = "\000\000\
\002\000\000\000\065\000\000\000\012\000\013\000\014\000\015\000\
\000\000\001\000\003\000\004\000\005\000\000\000\000\000\000\000\
\016\000\018\000\000\000\000\000\000\000\000\000\000\000\006\000\
\017\000\000\000\010\000\000\000\000\000\000\000\016\000\000\000\
\000\000\011\000\000\000\000\000\019\000\007\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\033\000\034\000\035\000\
\036\000\000\000\000\000\000\000\000\000\020\000\000\000\000\000\
\000\000\000\000\000\000\050\000\051\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\021\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\055\000\023\000\
\057\000\000\000\022\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\053\000\000\000\
\000\000\040\000\041\000\042\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\054\000\000\000\056\000\000\000\000\000\027\000\
\030\000\028\000\029\000\000\000\000\000\000\000\025\000\000\000\
\000\000\026\000"

let yydgoto = "\002\000\
\003\000\004\000\025\000\012\000\013\000\020\000\026\000\022\000\
\035\000\023\000\054\000\055\000\063\000\059\000\099\000\100\000"

let yysindex = "\007\000\
\000\000\000\000\000\000\001\000\000\000\000\000\000\000\000\000\
\227\254\000\000\000\000\000\000\000\000\231\254\054\255\050\255\
\000\000\000\000\238\254\033\255\021\255\056\255\062\255\000\000\
\000\000\028\255\000\000\070\255\238\254\076\255\000\000\063\255\
\238\254\000\000\051\255\207\255\000\000\000\000\207\255\207\255\
\207\255\207\255\112\255\120\255\135\255\000\000\000\000\000\000\
\000\000\143\255\148\255\154\255\066\255\000\000\005\000\182\000\
\085\255\025\001\141\255\000\000\000\000\025\001\166\255\207\255\
\207\255\207\255\207\255\207\255\207\255\207\255\136\255\207\255\
\125\255\000\000\207\255\207\255\207\255\207\255\207\255\207\255\
\207\255\207\255\207\255\207\255\207\255\207\255\000\000\000\000\
\000\000\207\255\000\000\203\000\170\255\224\000\011\255\245\000\
\010\001\025\001\169\255\165\255\167\255\025\001\000\000\121\255\
\121\255\000\000\000\000\000\000\225\255\129\255\129\255\129\255\
\129\255\054\001\040\001\025\001\187\255\207\255\187\255\174\255\
\175\255\178\255\000\000\207\255\000\000\156\255\033\000\000\000\
\000\000\000\000\000\000\025\001\187\255\207\255\000\000\180\255\
\187\255\000\000"

let yyrindex = "\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\181\255\000\000\000\000\000\000\189\255\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\119\255\000\000\000\000\000\000\000\000\000\000\158\255\000\000\
\000\000\198\255\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\246\255\000\000\000\000\000\000\
\000\000\099\255\000\000\000\000\000\000\023\255\000\000\000\000\
\198\255\000\000\057\255\000\000\000\000\197\255\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\000\
\000\000\097\255\000\000\199\255\000\000\096\255\000\000\056\000\
\079\000\000\000\000\000\000\000\164\000\102\000\110\000\133\000\
\141\000\167\000\014\255\108\255\000\000\000\000\000\000\000\000\
\000\000\000\000\000\000\000\000\000\000\153\255\000\000\000\000\
\000\000\000\000\000\000\128\255\000\000\201\255\000\000\000\000\
\000\000\000\000"

let yygindex = "\000\000\
\000\000\000\000\186\000\000\000\000\000\170\000\006\000\000\000\
\168\000\000\000\146\255\220\255\193\255\139\000\000\000\000\000"

let yytablesize = 587
let yytable = "\056\000\
\010\000\093\000\058\000\060\000\061\000\062\000\126\000\001\000\
\128\000\014\000\005\000\006\000\007\000\120\000\049\000\015\000\
\049\000\008\000\090\000\016\000\049\000\049\000\135\000\032\000\
\021\000\032\000\138\000\092\000\062\000\094\000\058\000\096\000\
\097\000\098\000\032\000\102\000\049\000\024\000\104\000\105\000\
\106\000\107\000\108\000\109\000\110\000\111\000\112\000\113\000\
\114\000\115\000\018\000\019\000\036\000\116\000\037\000\038\000\
\039\000\017\000\028\000\058\000\040\000\005\000\006\000\007\000\
\058\000\027\000\041\000\070\000\008\000\029\000\136\000\071\000\
\030\000\031\000\042\000\043\000\018\000\044\000\045\000\072\000\
\073\000\127\000\046\000\047\000\048\000\049\000\036\000\132\000\
\037\000\088\000\039\000\050\000\051\000\052\000\040\000\053\000\
\052\000\062\000\052\000\063\000\041\000\059\000\052\000\052\000\
\063\000\059\000\059\000\034\000\042\000\043\000\060\000\044\000\
\045\000\064\000\060\000\060\000\046\000\047\000\048\000\049\000\
\019\000\065\000\019\000\019\000\019\000\050\000\051\000\052\000\
\019\000\053\000\064\000\077\000\078\000\079\000\019\000\064\000\
\066\000\075\000\076\000\077\000\078\000\079\000\019\000\019\000\
\067\000\019\000\019\000\089\000\090\000\068\000\019\000\019\000\
\019\000\019\000\024\000\069\000\024\000\024\000\024\000\019\000\
\019\000\019\000\024\000\019\000\058\000\058\000\091\000\101\000\
\024\000\103\000\118\000\123\000\124\000\125\000\129\000\130\000\
\024\000\024\000\131\000\024\000\024\000\133\000\137\000\008\000\
\024\000\024\000\024\000\024\000\036\000\011\000\037\000\009\000\
\039\000\024\000\024\000\024\000\040\000\024\000\031\000\061\000\
\033\000\062\000\041\000\031\000\057\000\095\000\000\000\000\000\
\036\000\000\000\042\000\043\000\039\000\044\000\045\000\000\000\
\040\000\000\000\046\000\047\000\048\000\049\000\041\000\000\000\
\000\000\000\000\000\000\050\000\051\000\052\000\000\000\053\000\
\000\000\075\000\076\000\077\000\078\000\079\000\046\000\047\000\
\048\000\049\000\081\000\082\000\083\000\084\000\037\000\000\000\
\037\000\000\000\000\000\053\000\037\000\037\000\037\000\037\000\
\037\000\037\000\037\000\000\000\000\000\074\000\037\000\037\000\
\037\000\037\000\037\000\037\000\037\000\075\000\076\000\077\000\
\078\000\079\000\000\000\000\000\000\000\080\000\081\000\082\000\
\083\000\084\000\085\000\086\000\000\000\005\000\006\000\007\000\
\000\000\134\000\000\000\000\000\008\000\000\000\000\000\000\000\
\009\000\075\000\076\000\077\000\078\000\079\000\000\000\000\000\
\000\000\080\000\081\000\082\000\083\000\084\000\085\000\086\000\
\038\000\000\000\038\000\000\000\000\000\000\000\038\000\038\000\
\038\000\038\000\000\000\000\000\000\000\000\000\000\000\000\000\
\038\000\038\000\038\000\038\000\038\000\038\000\038\000\039\000\
\000\000\039\000\000\000\000\000\000\000\039\000\039\000\039\000\
\039\000\000\000\000\000\000\000\000\000\000\000\000\000\039\000\
\039\000\039\000\039\000\039\000\039\000\039\000\044\000\000\000\
\044\000\000\000\000\000\000\000\044\000\044\000\045\000\000\000\
\045\000\000\000\000\000\000\000\045\000\045\000\044\000\044\000\
\044\000\044\000\044\000\044\000\044\000\000\000\045\000\045\000\
\045\000\045\000\045\000\045\000\045\000\046\000\000\000\046\000\
\000\000\000\000\000\000\046\000\046\000\047\000\000\000\047\000\
\000\000\000\000\000\000\047\000\047\000\046\000\046\000\046\000\
\046\000\046\000\046\000\046\000\000\000\047\000\047\000\047\000\
\047\000\047\000\047\000\047\000\043\000\000\000\043\000\048\000\
\000\000\048\000\043\000\043\000\000\000\048\000\048\000\000\000\
\000\000\000\000\000\000\000\000\043\000\000\000\000\000\000\000\
\087\000\043\000\043\000\000\000\048\000\048\000\075\000\076\000\
\077\000\078\000\079\000\000\000\000\000\000\000\080\000\081\000\
\082\000\083\000\084\000\085\000\086\000\117\000\000\000\000\000\
\000\000\000\000\000\000\075\000\076\000\077\000\078\000\079\000\
\000\000\000\000\000\000\080\000\081\000\082\000\083\000\084\000\
\085\000\086\000\119\000\000\000\000\000\000\000\000\000\000\000\
\075\000\076\000\077\000\078\000\079\000\000\000\000\000\000\000\
\080\000\081\000\082\000\083\000\084\000\085\000\086\000\121\000\
\000\000\000\000\000\000\000\000\000\000\075\000\076\000\077\000\
\078\000\079\000\000\000\000\000\000\000\080\000\081\000\082\000\
\083\000\084\000\085\000\086\000\122\000\000\000\000\000\000\000\
\000\000\000\000\075\000\076\000\077\000\078\000\079\000\000\000\
\000\000\000\000\080\000\081\000\082\000\083\000\084\000\085\000\
\086\000\075\000\076\000\077\000\078\000\079\000\000\000\000\000\
\000\000\080\000\081\000\082\000\083\000\084\000\085\000\086\000\
\075\000\076\000\077\000\078\000\079\000\000\000\000\000\000\000\
\080\000\081\000\082\000\083\000\084\000\085\000\075\000\076\000\
\077\000\078\000\079\000\000\000\000\000\000\000\080\000\081\000\
\082\000\083\000\084\000"

let yycheck = "\036\000\
\000\000\065\000\039\000\040\000\041\000\042\000\117\000\001\000\
\119\000\004\000\029\001\030\001\031\001\003\001\001\001\045\001\
\003\001\036\001\008\001\045\001\007\001\008\001\133\000\001\001\
\019\000\003\001\137\000\064\000\065\000\066\000\067\000\068\000\
\069\000\070\000\029\000\072\000\023\001\005\001\075\000\076\000\
\077\000\078\000\079\000\080\000\081\000\082\000\083\000\084\000\
\085\000\086\000\001\001\002\001\002\001\090\000\004\001\005\001\
\006\001\004\001\003\001\003\001\010\001\029\001\030\001\031\001\
\008\001\045\001\016\001\002\001\036\001\008\001\134\000\006\001\
\045\001\004\001\024\001\025\001\001\001\027\001\028\001\014\001\
\015\001\118\000\032\001\033\001\034\001\035\001\002\001\124\000\
\004\001\005\001\006\001\041\001\042\001\043\001\010\001\045\001\
\001\001\134\000\003\001\003\001\016\001\003\001\007\001\008\001\
\008\001\007\001\008\001\045\001\024\001\025\001\003\001\027\001\
\028\001\002\001\007\001\008\001\032\001\033\001\034\001\035\001\
\002\001\002\001\004\001\005\001\006\001\041\001\042\001\043\001\
\010\001\045\001\003\001\011\001\012\001\013\001\016\001\008\001\
\002\001\009\001\010\001\011\001\012\001\013\001\024\001\025\001\
\002\001\027\001\028\001\007\001\008\001\002\001\032\001\033\001\
\034\001\035\001\002\001\002\001\004\001\005\001\006\001\041\001\
\042\001\043\001\010\001\045\001\007\001\008\001\001\001\032\001\
\016\001\045\001\001\001\003\001\008\001\007\001\001\001\001\001\
\024\001\025\001\001\001\027\001\028\001\026\001\003\001\003\001\
\032\001\033\001\034\001\035\001\002\001\004\000\004\001\003\001\
\006\001\041\001\042\001\043\001\010\001\045\001\001\001\003\001\
\031\000\003\001\016\001\003\001\037\000\067\000\255\255\255\255\
\002\001\255\255\024\001\025\001\006\001\027\001\028\001\255\255\
\010\001\255\255\032\001\033\001\034\001\035\001\016\001\255\255\
\255\255\255\255\255\255\041\001\042\001\043\001\255\255\045\001\
\255\255\009\001\010\001\011\001\012\001\013\001\032\001\033\001\
\034\001\035\001\018\001\019\001\020\001\021\001\001\001\255\255\
\003\001\255\255\255\255\045\001\007\001\008\001\009\001\010\001\
\011\001\012\001\013\001\255\255\255\255\001\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\009\001\010\001\011\001\
\012\001\013\001\255\255\255\255\255\255\017\001\018\001\019\001\
\020\001\021\001\022\001\023\001\255\255\029\001\030\001\031\001\
\255\255\001\001\255\255\255\255\036\001\255\255\255\255\255\255\
\040\001\009\001\010\001\011\001\012\001\013\001\255\255\255\255\
\255\255\017\001\018\001\019\001\020\001\021\001\022\001\023\001\
\001\001\255\255\003\001\255\255\255\255\255\255\007\001\008\001\
\009\001\010\001\255\255\255\255\255\255\255\255\255\255\255\255\
\017\001\018\001\019\001\020\001\021\001\022\001\023\001\001\001\
\255\255\003\001\255\255\255\255\255\255\007\001\008\001\009\001\
\010\001\255\255\255\255\255\255\255\255\255\255\255\255\017\001\
\018\001\019\001\020\001\021\001\022\001\023\001\001\001\255\255\
\003\001\255\255\255\255\255\255\007\001\008\001\001\001\255\255\
\003\001\255\255\255\255\255\255\007\001\008\001\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\001\001\255\255\003\001\
\255\255\255\255\255\255\007\001\008\001\001\001\255\255\003\001\
\255\255\255\255\255\255\007\001\008\001\017\001\018\001\019\001\
\020\001\021\001\022\001\023\001\255\255\017\001\018\001\019\001\
\020\001\021\001\022\001\023\001\001\001\255\255\003\001\001\001\
\255\255\003\001\007\001\008\001\255\255\007\001\008\001\255\255\
\255\255\255\255\255\255\255\255\017\001\255\255\255\255\255\255\
\003\001\022\001\023\001\255\255\022\001\023\001\009\001\010\001\
\011\001\012\001\013\001\255\255\255\255\255\255\017\001\018\001\
\019\001\020\001\021\001\022\001\023\001\003\001\255\255\255\255\
\255\255\255\255\255\255\009\001\010\001\011\001\012\001\013\001\
\255\255\255\255\255\255\017\001\018\001\019\001\020\001\021\001\
\022\001\023\001\003\001\255\255\255\255\255\255\255\255\255\255\
\009\001\010\001\011\001\012\001\013\001\255\255\255\255\255\255\
\017\001\018\001\019\001\020\001\021\001\022\001\023\001\003\001\
\255\255\255\255\255\255\255\255\255\255\009\001\010\001\011\001\
\012\001\013\001\255\255\255\255\255\255\017\001\018\001\019\001\
\020\001\021\001\022\001\023\001\003\001\255\255\255\255\255\255\
\255\255\255\255\009\001\010\001\011\001\012\001\013\001\255\255\
\255\255\255\255\017\001\018\001\019\001\020\001\021\001\022\001\
\023\001\009\001\010\001\011\001\012\001\013\001\255\255\255\255\
\255\255\017\001\018\001\019\001\020\001\021\001\022\001\023\001\
\009\001\010\001\011\001\012\001\013\001\255\255\255\255\255\255\
\017\001\018\001\019\001\020\001\021\001\022\001\009\001\010\001\
\011\001\012\001\013\001\255\255\255\255\255\255\017\001\018\001\
\019\001\020\001\021\001"

let yynames_const = "\
  SEMI\000\
  LPAREN\000\
  RPAREN\000\
  LBRACE\000\
  RBRACE\000\
  LBRACKET\000\
  RBRACKET\000\
  COMMA\000\
  PLUS\000\
  MINUS\000\
  TIMES\000\
  DIVIDE\000\
  MODULO\000\
  ASSIGN\000\
  DOT\000\
  NOT\000\
  EQ\000\
  LT\000\
  LEQ\000\
  GT\000\
  GEQ\000\
  AND\000\
  OR\000\
  RETURN\000\
  IF\000\
  ELSE\000\
  FOR\000\
  WHILE\000\
  INT\000\
  BOOL\000\
  CHAR\000\
  ARR\000\
  STRING\000\
  DIRECTORY\000\
  FILE\000\
  STRUCT\000\
  PRINT\000\
  OPEN\000\
  CLOSE\000\
  MAIN\000\
  EOF\000\
  "

let yynames_block = "\
  LITERAL\000\
  BLIT\000\
  CHARLIT\000\
  STRLIT\000\
  ID\000\
  "

let yyact = [|
  (fun _ -> failwith "parser")
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    Obj.repr(
# 47 "parser.mly"
            ( _1 )
# 410 "parser.ml"
               : Ast.program))
; (fun __caml_parser_env ->
    Obj.repr(
# 50 "parser.mly"
                  ( (([], []), []) )
# 416 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 52 "parser.mly"
               ( (((_2 :: fst (fst _1)), snd (fst _1)), snd _1) )
# 424 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'fdecl) in
    Obj.repr(
# 53 "parser.mly"
               ( ((fst (fst _1), (_2 :: snd (fst _1))), snd _1))
# 432 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'decls) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'sdecl) in
    Obj.repr(
# 54 "parser.mly"
               ( (fst _1, (_2 :: snd _1)) )
# 440 "parser.ml"
               : 'decls))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    Obj.repr(
# 67 "parser.mly"
     ( {
        sname = _2;
        elements = List.rev _4;
     } )
# 451 "parser.ml"
               : 'sdecl))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 8 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 7 : string) in
    let _4 = (Parsing.peek_val __caml_parser_env 5 : 'formals_opt) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'vdecl_list) in
    let _8 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 74 "parser.mly"
     ( { typ = _1;
     fname = _2;
     formals = _4;
     locals = List.rev _7;
     body = List.rev _8 } )
# 466 "parser.ml"
               : 'fdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 81 "parser.mly"
                  ( [] )
# 472 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'formal_list) in
    Obj.repr(
# 82 "parser.mly"
                  ( List.rev _1 )
# 479 "parser.ml"
               : 'formals_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 85 "parser.mly"
                             ( [(_1,_2)]     )
# 487 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : 'formal_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'typ) in
    let _4 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 86 "parser.mly"
                             ( (_3,_4) :: _1 )
# 496 "parser.ml"
               : 'formal_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 89 "parser.mly"
          ( Int   )
# 502 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 90 "parser.mly"
          ( Bool  )
# 508 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 91 "parser.mly"
          ( Char )
# 514 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 92 "parser.mly"
          ( Arr )
# 520 "parser.ml"
               : 'typ))
; (fun __caml_parser_env ->
    Obj.repr(
# 95 "parser.mly"
                     ( [] )
# 526 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'vdecl_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'vdecl) in
    Obj.repr(
# 96 "parser.mly"
                     ( _2 :: _1 )
# 534 "parser.ml"
               : 'vdecl_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'typ) in
    let _2 = (Parsing.peek_val __caml_parser_env 1 : string) in
    Obj.repr(
# 99 "parser.mly"
               ( (_1, _2) )
# 542 "parser.ml"
               : 'vdecl))
; (fun __caml_parser_env ->
    Obj.repr(
# 103 "parser.mly"
                   ( [] )
# 548 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 104 "parser.mly"
                   ( _2 :: _1 )
# 556 "parser.ml"
               : 'stmt_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 107 "parser.mly"
                                            ( Expr _1               )
# 563 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr_opt) in
    Obj.repr(
# 108 "parser.mly"
                                            ( Return _2             )
# 570 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'stmt_list) in
    Obj.repr(
# 109 "parser.mly"
                                            ( Block(List.rev _2)    )
# 577 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 110 "parser.mly"
                                            ( If(_3, _5, Block([])) )
# 585 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 2 : 'stmt) in
    let _7 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 111 "parser.mly"
                                            ( If(_3, _5, _7)        )
# 594 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 6 : 'expr_opt) in
    let _5 = (Parsing.peek_val __caml_parser_env 4 : 'expr) in
    let _7 = (Parsing.peek_val __caml_parser_env 2 : 'expr_opt) in
    let _9 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 113 "parser.mly"
                                            ( For(_3, _5, _7, _9)   )
# 604 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _5 = (Parsing.peek_val __caml_parser_env 0 : 'stmt) in
    Obj.repr(
# 114 "parser.mly"
                                            ( While(_3, _5)         )
# 612 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 115 "parser.mly"
                                            ( Open(_3)              )
# 619 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    Obj.repr(
# 116 "parser.mly"
                                            ( Close(_3)             )
# 626 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    let _3 = (Parsing.peek_val __caml_parser_env 2 : 'elem_list) in
    Obj.repr(
# 117 "parser.mly"
                                            ( Print(List.rev _3)             )
# 633 "parser.ml"
               : 'stmt))
; (fun __caml_parser_env ->
    Obj.repr(
# 121 "parser.mly"
                  ( Noexpr )
# 639 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 122 "parser.mly"
                  ( _1 )
# 646 "parser.ml"
               : 'expr_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : int) in
    Obj.repr(
# 125 "parser.mly"
                     ( Literal(_1)            )
# 653 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : bool) in
    Obj.repr(
# 126 "parser.mly"
                     ( BoolLit(_1)            )
# 660 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 127 "parser.mly"
                     ( CharLit(_1)            )
# 667 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 128 "parser.mly"
                     ( StrLit(_1)             )
# 674 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 129 "parser.mly"
                     ( Id(_1)                 )
# 681 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 130 "parser.mly"
                     ( Binop(_1, Add,   _3)   )
# 689 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 131 "parser.mly"
                     ( Binop(_1, Sub,   _3)   )
# 697 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 132 "parser.mly"
                     ( Binop(_1, Mult,  _3)   )
# 705 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 133 "parser.mly"
                     ( Binop(_1, Div,   _3)   )
# 713 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 134 "parser.mly"
                     ( Binop(_1, Mod,   _3)   )
# 721 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 135 "parser.mly"
                     ( Binop(_1, Equal, _3)   )
# 729 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 136 "parser.mly"
                     ( Binop(_1, Less,  _3)   )
# 737 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 137 "parser.mly"
                     ( Binop(_1, Leq,   _3)   )
# 745 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 138 "parser.mly"
                     ( Binop(_1, Greater, _3) )
# 753 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 139 "parser.mly"
                     ( Binop(_1, Geq,   _3)   )
# 761 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 140 "parser.mly"
                     ( Binop(_1, And,   _3)   )
# 769 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'expr) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 141 "parser.mly"
                     ( Binop(_1, Or,    _3)   )
# 777 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 142 "parser.mly"
                         ( Unop(Neg, _2)      )
# 784 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 143 "parser.mly"
                     ( Unop(Not, _2)          )
# 791 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 144 "parser.mly"
                     ( Assign(_1, _3)         )
# 799 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : string) in
    Obj.repr(
# 145 "parser.mly"
                     ( Extract(_1, _3)        )
# 807 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : 'args_opt) in
    Obj.repr(
# 146 "parser.mly"
                              ( Call(_1, _3)  )
# 815 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'expr) in
    Obj.repr(
# 147 "parser.mly"
                       ( _2                   )
# 822 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 3 : string) in
    let _3 = (Parsing.peek_val __caml_parser_env 1 : int) in
    Obj.repr(
# 148 "parser.mly"
                                 ( Index(_1, _3)  )
# 830 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    let _2 = (Parsing.peek_val __caml_parser_env 1 : 'elem_list) in
    Obj.repr(
# 149 "parser.mly"
                                ( ArrBuild(List.rev _2)    )
# 837 "parser.ml"
               : 'expr))
; (fun __caml_parser_env ->
    Obj.repr(
# 152 "parser.mly"
                  ( [] )
# 843 "parser.ml"
               : 'elem_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 153 "parser.mly"
                  ( [_1] )
# 850 "parser.ml"
               : 'elem_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'elem_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 154 "parser.mly"
                         ( _3 :: _1 )
# 858 "parser.ml"
               : 'elem_list))
; (fun __caml_parser_env ->
    Obj.repr(
# 157 "parser.mly"
                  ( [] )
# 864 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'args_list) in
    Obj.repr(
# 158 "parser.mly"
               ( List.rev _1 )
# 871 "parser.ml"
               : 'args_opt))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 161 "parser.mly"
                            ( [_1] )
# 878 "parser.ml"
               : 'args_list))
; (fun __caml_parser_env ->
    let _1 = (Parsing.peek_val __caml_parser_env 2 : 'args_list) in
    let _3 = (Parsing.peek_val __caml_parser_env 0 : 'expr) in
    Obj.repr(
# 162 "parser.mly"
                         ( _3 :: _1 )
# 886 "parser.ml"
               : 'args_list))
(* Entry program *)
; (fun __caml_parser_env -> raise (Parsing.YYexit (Parsing.peek_val __caml_parser_env 0)))
|]
let yytables =
  { Parsing.actions=yyact;
    Parsing.transl_const=yytransl_const;
    Parsing.transl_block=yytransl_block;
    Parsing.lhs=yylhs;
    Parsing.len=yylen;
    Parsing.defred=yydefred;
    Parsing.dgoto=yydgoto;
    Parsing.sindex=yysindex;
    Parsing.rindex=yyrindex;
    Parsing.gindex=yygindex;
    Parsing.tablesize=yytablesize;
    Parsing.table=yytable;
    Parsing.check=yycheck;
    Parsing.error_function=parse_error;
    Parsing.names_const=yynames_const;
    Parsing.names_block=yynames_block }
let program (lexfun : Lexing.lexbuf -> token) (lexbuf : Lexing.lexbuf) =
   (Parsing.yyparse yytables 1 lexfun lexbuf : Ast.program)
