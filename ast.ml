(* This is an Ocaml file defining the 
   data types for an AST in our language

   Based heavily off of the MicroC example
*)
 
type op = Add | Sub | Mult | Div | Mod | Equal | Neq | Less | Leq | Greater | Geq | And | Or

type uop = Neg | Not

type typ = Int | Bool | Char | Arr (* added types *)

type bind = typ * string

type expr =
    Literal of int
  | BoolLit of bool
  | CharLit of string 
  | StrLit of string
  | Id of string
  | Binop of expr * op * expr
  | Unop of uop * expr
  | Assign of string * expr
  | Call of string * expr list
  | Extract of string * string (*added*)
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

type program = (bind list * func_decl list) * struct_decl list
(* this may be tricky. in the parser it's a tuple of lists, then another list This will definitely need to change*)

(* Pretty-printing functions *)

let string_of_op = function
    Add -> "+"
  | Sub -> "-"
  | Mult -> "*"
  | Div -> "/"
  | Mod -> "%"
  | Equal -> "is"
  | Neq -> "!="
  | Less -> "<"
  | Leq -> "<="
  | Greater -> ">"
  | Geq -> ">="
  | And -> "and"
  | Or -> "or"

let string_of_uop = function
    Neg -> "-"
  | Not -> "not"

let string_of_typ = function
    Int -> "int"
  | Bool -> "bool"
  | Char -> "char" (*added *)
  | Arr-> "arr" (*added *)

(*added stuff to this printing function *)
let rec string_of_expr = function
    Literal(l) -> string_of_int l
  | BoolLit(true) -> "T"
  | BoolLit(false) -> "F"
  | CharLit(c) -> c
  | StrLit(s) -> s
  | Id(s) -> s
  | Binop(e1, o, e2) ->
      string_of_expr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_expr e2
  | Unop(o, e) -> string_of_uop o ^ " " ^ string_of_expr e
  | Assign(v, e) -> v ^ " = " ^ string_of_expr e
  | Call(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_expr el) ^ ")" 
(*why map?- calling string_of_expr on each element in e1*)
  | Extract(id, field) -> id ^ "." ^ field (* added; do we need semicolons in any of these? *)
  | Index(id, idx) -> id ^ "[" ^ (string_of_int idx) ^ "]" (* do we need string_of int here?*)  
  | ArrBuild(elems) -> "[" ^ String.concat ", " (List.map string_of_expr elems) ^ "]" (*added*)
  | Noexpr -> ""

let rec string_of_stmt = function
    Block(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_stmt stmts) ^ "}\n"
  | Expr(expr) -> string_of_expr expr ^ "?\n";
  | Return(expr) -> "return " ^ string_of_expr expr ^ "?\n";
  | If(e, s, Block([])) -> "if (" ^ string_of_expr e ^ ")\n" ^ string_of_stmt s
  | If(e, s1, s2) ->  "if (" ^ string_of_expr e ^ ")\n" ^
      string_of_stmt s1 ^ "else\n" ^ string_of_stmt s2
  | For(e1, e2, e3, s) ->
      "for (" ^ string_of_expr e1  ^ "? " ^ string_of_expr e2 ^ "? " ^
      string_of_expr e3  ^ ") " ^ string_of_stmt s
  | While(e, s) -> "while (" ^ string_of_expr e ^ ") " ^ string_of_stmt s

let string_of_vdecl (t, id) = string_of_typ t ^ " " ^ id ^ "?\n"

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

let string_of_program ((vars, funcs), structs) =
  String.concat "\n" (List.map string_of_sdecl structs) ^ "\n" ^
  String.concat "" (List.map string_of_vdecl (List.rev vars)) ^ "\n" ^
  String.concat "\n" (List.map string_of_fdecl funcs) ^ "\n"


