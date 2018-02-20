(* This is an Ocaml file defining the 
    data types for an AST in our language

The MicroC ast for reference:
 Abstract Syntax Tree and functions for printing it
 
 TODO (refer to Feb 17 list for things already tampered with):
    - Go through this file and make our original adjustments to how the reserved words look and what we took out
    - Add what we added from scanner/parser:
        for example, you can see that line 28 Assign of string * expr has a function (on line 70) that allows an expr to be a string;
        so it can assign a string to an identifier.
        Remember that we also want to be able to assign arrays to identifiers (char arr x = ['4', '5', '6']) so you need to be able
        to recognize an array as an expr.
*)

(*Feb 17 -
deleted flits and voids 
added lines 38-40, 46-48, 85-87, 106-108, 110-111
Feb 18th: added structs, types, and fixed some errors
Still need to deal explicitly with strings/files as expr*)
type op = Add | Sub | Mult | Div | Equal | Neq | Less | Leq | Greater | Geq |
          And | Or

type uop = Neg | Not

type typ = Int | Bool | Char | Arr (* added types *)

type bind = typ * string

type expr =
    Literal of int

  | BoolLit of bool
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of string * expr
  | Call of string * expr list
  | Extract of string * string (*added- these string behave as ID's apparently*)
  | Index of string * int (*added *)
  | ArrBuild of expr list (*added *)
  | Noexpr

type stmt =
    Block of stmt list
  | Expr of expr
  | Return of expr
  | If of expr * stmt * stmt
  | For of expr * expr * expr * stmt
  | While of expr * stmt
  | Open of expr (*added *)
  | Close of expr(*added *)
  | Print of expr list (*added *)

type func_decl = {
    typ : typ;
    fname : string;
    formals : bind list;
    locals : bind list;
    body : stmt list;
  }

type struct_decl = { (* added this struct_decl like func_decl *)
    sname : string;
    elements : bind list;
  }

type program = bind list * func_decl list * struct_decl list
(* this may be tricky. in the parser it's a tuple of lists, then another list This will definitely need to change*)

(* Pretty-printing functions *)

let string_of_op = function
    Add -> "+"
  | Sub -> "-"
  | Mult -> "*"
  | Div -> "/"
  | Equal -> "=="
  | Neq -> "!="
  | Less -> "<"
  | Leq -> "<="
  | Greater -> ">"
  | Geq -> ">="
  | And -> "&&"
  | Or -> "||"

let string_of_uop = function
    Neg -> "-"
  | Not -> "!"

(*added stuff to this printing function *)
let rec string_of_expr = function
    Literal(l) -> string_of_int l
  | BoolLit(true) -> "true"
  | BoolLit(false) -> "false"
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ string_of_expr e
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")" 
(*why map?- calling string_of_expr on each element in e1*)
  | Extract(id, field) -> id ^ " . " ^ field (* added; do we need semicolons in any of these? *)
  | Index(id, idx) -> id ^ "[" ^ (string_of_int idx) ^ "]" (* do we need string_of int here?*)  
  (*| ArrBuild(elems) -> "[" ^ (List.map string_of_expr elems) ^ "]" *)(*added*)
  | Noexpr -> ""

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ ";\n";
  | Return(expr) -> "return " ^ string_of_expr expr ^ ";\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | For(e1, e2, e3, s) ->
      "for (" ^ string_of_expr e1  ^ " ; " ^ string_of_expr e2 ^ " ; " ^
      string_of_expr e3  ^ ") " ^ string_of_stmt s
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s
  | Open(fi) -> "open(" ^ string_of_expr fi ^ ");" (*added; keep in mind this is referring to file as an expr as in parser*)
  | Close(fi) -> "close(" ^ string_of_expr fi ^ ");"
  | Print(elems) -> "print(" ^ (List.map (String.concat string_of_expr) elems) ^ ");"

let string_of_typ = function
    Int -> "int"
  | Bool -> "bool"
  | Char -> "char" (*added *)
  | Arr-> "arr" (*added *)

let string_of_vdecl (t, id) = string_of_typ t ^ " " ^ id ^ ";\n"

let string_of_fdecl fdecl =
  string_of_typ fdecl.typ ^ " " ^
  fdecl.fname ^ "(" ^ String.concat ", " (List.map snd fdecl.formals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.locals) ^
  String.concat "" (List.map string_of_stmt fdecl.body) ^
  "}\n"

let string_of_sdecl sdecl = (* added this too for printing *)
  "struct " ^ sdecl.sname ^ " {\n" ^
  String.concat "" (List.map string_of_vdecl sdecl.elements) ^ "}\n"

let string_of_program (vars, funcs) =
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs)


