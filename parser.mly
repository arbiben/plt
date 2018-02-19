/*
    An OCamlyacc input file
    Defines:
    - the tokens in our language
    - Precedence and associativity
    - How to parse these tokens into nodes of an AST

The Microc parser, for reference:
/* Ocamlyacc parser for MicroC */
     Our additions so far:
       - STRUCT
       - DOT
       - ARR
       - CHAR
       - L and R brackets
       - string/file/directory
       - print/open/close
       
     partial changes shown:
     - dot operator (167)
     - indexing operation (170)
     - array construction (attempted lines 172-175)
     - print/open/close operations (140-143)
     - send string/file/directory to struct -> added to README for implementation next time

*/

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET COMMA PLUS MINUS TIMES DIVIDE ASSIGN DOT
%token NOT EQ LT LEQ GT GEQ AND OR
%token RETURN IF ELSE FOR WHILE INT BOOL
%token <int> LITERAL
%token <bool> BLIT
%token <char> CHAR 
%token <list> ARR
%token STRING DIRECTORY FILE
%token STRUCT
%token PRINT OPEN CLOSE
%token EOF

%start program
%type <Ast.program> program

%nonassoc NOELSE
%nonassoc ELSE
%right ASSIGN
%left OR
%left AND
%left EQ
%left LT GT LEQ GEQ
%left PLUS MINUS
%left TIMES DIVIDE
%right NOT NEG
%left DOT    

%%

program:
  decls EOF { $1 }

decls:
    /* nothing */ { (([], []), []) } (* check if this change needs to be 
reflected in ast *)
 | decls vdecl { ((($2 :: fst (fst $1)), snd (fst $1)), snd $1) }
 | decls fdecl { ((fst (fst $1), ($2 :: snd (fst $1))), snd $1)}
 | decls sdecl { (fst $1, ($2 :: snd $1)) }(* check correctness*)
 (*decls is a tuple
  *sdecls/vdecls/fdecls are one element 
  * inside the decls tuple:
      * first is the list of variable declartaion
      * second is the list of func declartions
  *
  * *)
sdecl:
  STRUCT ID LBRACE vdecl_list RBRACE
     { 
        sname = $2;
        elements = List.rev $4;
     }
(*need to add this rule and structure to ast*)

fdecl:
   typ ID LPAREN formals_opt RPAREN LBRACE vdecl_list stmt_list RBRACE
     { { typ = $1;
     fname = $2;
     formals = $4;
     locals = List.rev $7;
     body = List.rev $8 } }

formals_opt:
    /* nothing */ { [] }
  | formal_list   { List.rev $1 }

formal_list:
    typ ID                   { [($1,$2)]     }
  | formal_list COMMA typ ID { ($3,$4) :: $1 }

typ:
    INT   { Int   }
  | BOOL  { Bool  }
  | CHAR  { Char } (* added *)
  | ARR   { List } (* Is this Arr? or List? *)

vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

vdecl:
   typ ID SEMI { ($1, $2) }
    (* is it an array dec? file dec? *) 
    
stmt_list:
    /* nothing */  { [] }
  | stmt_list stmt { $2 :: $1 }

stmt:
    expr SEMI                               { Expr $1               }
  | RETURN expr_opt SEMI                    { Return $2             }
  | LBRACE stmt_list RBRACE                 { Block(List.rev $2)    }
  | IF LPAREN expr RPAREN stmt %prec NOELSE { If($3, $5, Block([])) }
  | IF LPAREN expr RPAREN stmt ELSE stmt    { If($3, $5, $7)        }
  | FOR LPAREN expr_opt SEMI expr SEMI expr_opt RPAREN stmt
                                            { For($3, $5, $7, $9)   }
  | WHILE LPAREN expr RPAREN stmt           { While($3, $5)         }
  | OPEN LPAREN expr RPAREN SEMI            { Open($3)              } 
  | CLOSE LPAREN expr RPAREN SEMI           { Close($3)             } 
  | PRINT LPAREN elem_list RPAREN SEMI      { Print($3)             }
  (* expr and expr_list need to be specific types but it should be fine for now *) 

expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }

expr:
    LITERAL          { Literal($1)            }
  | BLIT             { BoolLit($1)            }
  | CHAR             { CharLit($1)            } (* added this *)
  | expr PLUS   expr { Binop($1, Add,   $3)   }
  | expr MINUS  expr { Binop($1, Sub,   $3)   }
  | expr TIMES  expr { Binop($1, Mult,  $3)   }
  | expr DIVIDE expr { Binop($1, Div,   $3)   }
  | expr EQ     expr { Binop($1, Equal, $3)   }
  | expr LT     expr { Binop($1, Less,  $3)   }
  | expr LEQ    expr { Binop($1, Leq,   $3)   }
  | expr GT     expr { Binop($1, Greater, $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3)   }
  | expr AND    expr { Binop($1, And,   $3)   }
  | expr OR     expr { Binop($1, Or,    $3)   }
  | MINUS expr %prec NEG { Unop(Neg, $2)      }
  | NOT expr         { Unop(Not, $2)          }
  | ID ASSIGN expr   { Assign($1, $3)         }
  | ID DOT ID        { Extract($1, $3)        } (* we added this *)
  | ID LPAREN args_opt RPAREN { Call($1, $3)  } 
  | LPAREN expr RPAREN { $2                   }
  | ID LBRACK LITERAL RBRACK { Index($1, $3)  } (* we added this *)
  | LBRACK elem_list RBRACK { ArrBuild($2)    } (* Added array declaration *)
  
elem_list:
    /* nothing */ { [] } (* allows for an empty array decl *)
  | expr          { $1 }
  | elem_list COMMA expr { $3 :: $1 } (*similar structure to args_list --> ought this be typ instead? *)

args_opt:
    /* nothing */ { [] }
  | args_list  { List.rev $1 }

args_list:
    expr                    { [$1] }
  | args_list COMMA expr { $3 :: $1 }


