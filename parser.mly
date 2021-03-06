/*
    An OCamlyacc input file
    Defines:
    - the tokens in our language
    - Precedence and associativity
    - How to parse these tokens into nodes of an AST

    Based heavily off of the MicroC example
*/

%{
open Ast
%}

%token SEMI LPAREN RPAREN LBRACE RBRACE LBRACKET RBRACKET COMMA PLUS MINUS TIMES DIVIDE MODULO ASSIGN DOT AT
%token NOT EQ LT LEQ GT GEQ AND OR
%token RETURN IF ELSE FOR WHILE INT BOOL STRING 
%token <int> LITERAL
%token <bool> BLIT
%token <string> STRLIT
%token ARR
%token DIRECTORY FILE
%token STRUCT
%token EOF
%token <string> ID

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
%left TIMES DIVIDE MODULO
%right NOT NEG
%left LBRACKET RBRACKET
%left DOT AT 


%%

program:
  decls EOF { $1 }

decls:
    /* nothing */ { (([], []), []) } 
 | decls vdecl { ((($2 :: fst (fst $1)), snd (fst $1)), snd $1) }
 | decls fdecl { ((fst (fst $1), ($2 :: snd (fst $1))), snd $1)}
 | decls sdecl { (fst $1, ($2 :: snd $1)) }
 
 /*
  Explanation:
  decls is a tuple of (tuple, list)
  * sdecls/vdecls/fdecls in the decls expression is considered one  element 
  * inside the decls first element, the tuple:
      * first is the list of variable declartaion
      * second is the list of func declartions
  * the second element of the main tuple is the list of struct declarations
 */

sdecl:
  STRUCT ID LBRACE vdecl_list RBRACE
     { {
        sname = $2;
        elements = List.rev $4;
     } }

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

atyp:
    INT       { Int          }
  | BOOL      { Bool         }
  | STRING    { Str          }
  | STRUCT ID { Struct($2)   }
typ:
    atyp         { Atyp($1)      }
  | ARR atyp expr  { Arr($2, $3)    }

vdecl_list:
    /* nothing */    { [] }
  | vdecl_list vdecl { $2 :: $1 }

vdecl:
   typ ID SEMI { ($1, $2) }
    /* is it an array dec? file dec? */ 
    
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

expr_opt:
    /* nothing */ { Noexpr }
  | expr          { $1 }

expr:
    LITERAL          { Literal($1)            }
  | BLIT             { BoolLit($1)            }
  | STRLIT           { StrLit($1)             }
  | ID               { Id($1)                 } 
  | expr PLUS   expr { Binop($1, Add,   $3)   }
  | expr MINUS  expr { Binop($1, Sub,   $3)   }
  | expr TIMES  expr { Binop($1, Mult,  $3)   }
  | expr DIVIDE expr { Binop($1, Div,   $3)   }
  | expr MODULO expr { Binop($1, Mod,   $3)   }
  | expr EQ     expr { Binop($1, Equal, $3)   }
  | expr LT     expr { Binop($1, Less,  $3)   }
  | expr LEQ    expr { Binop($1, Leq,   $3)   }
  | expr GT     expr { Binop($1, Greater, $3) }
  | expr GEQ    expr { Binop($1, Geq,   $3)   }
  | expr AND    expr { Binop($1, And,   $3)   }
  | expr OR     expr { Binop($1, Or,    $3)   }
  | MINUS expr %prec NEG { Unop(Neg, $2)      }
  | NOT expr         { Unop(Not, $2)          }
  | expr ASSIGN expr   { Assign($1, $3)         }
  | expr LBRACKET expr RBRACKET ASSIGN expr { AssignAtIndex($1, $3, $6) }
  | expr DOT ID        { Extract($1, $3)        }
  | ID LPAREN args_opt RPAREN { Call($1, $3)  } 
  | LPAREN expr RPAREN { $2                   }
  | expr AT expr { Index($1, $3)  }
  | expr ASSIGN LBRACKET elem_list RBRACKET { ArrBuild($1, List.rev $4)    }
  
elem_list:
    /* nothing */ { [] } /* allows for an empty array decl */
  | expr          { [$1] }
  | elem_list COMMA expr { $3 :: $1 } /*similar structure to args_list*/

args_opt:
    /* nothing */ { [] }
  | args_list  { List.rev $1 }

args_list:
    expr                    { [$1] }
  | args_list COMMA expr { $3 :: $1 }


