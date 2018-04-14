(* 
Semantically-checked Abstract Syntax Tree and functions for printing it 
Built Heavily off of the Micro-C Sast
*)

open Ast

type sexpr = typ * sx
and sx =
    SLiteral of int 
  | SBoolLit of bool
  | SStrLit of string
  | SStructLit of string
  | SId of string
  | SBinop of sexpr * op * sexpr
  | SUnop of uop * sexpr
  | SAssign of sexpr * sexpr
  | SCall of string * sexpr list
  | SExtract of sexpr * string
  | SIndex of string * int  
  | SArrBuild of sexpr list
  | SArrAssign of string * sexpr * sexpr
  | SNoexpr

type sstmt =
    SBlock of sstmt list
  | SExpr of sexpr
  | SReturn of sexpr
  | SIf of sexpr * sstmt * sstmt
  | SFor of sexpr * sexpr * sexpr * sstmt
  | SWhile of sexpr * sstmt

type sfunc_decl = {
    styp : typ;
    sfname : string;
    sformals : bind list;
    slocals : bind list;
    sbody : sstmt list;
  }

type sstruct_decl = { 
    ssname: string;
    selements: bind list;
  }

type sprogram = (bind list * sfunc_decl list) * sstruct_decl list

(* Pretty-printing functions *)

let rec string_of_sexpr (t, e) =
  "(" ^ string_of_typ t ^ " : " ^ (match e with
    SLiteral(l) -> string_of_int l
  | SBoolLit(true) -> "T"
  | SBoolLit(false) -> "F"
  | SStrLit(s) -> s
  | SStructLit(s) -> "struct " ^ s
  | SId(s) -> s
  | SBinop(e1, o, e2) ->
      string_of_sexpr e1 ^ " " ^ string_of_op o ^ " " ^ string_of_sexpr e2
  | SUnop(o, e) -> string_of_uop o ^ string_of_sexpr e
  | SAssign(v, e) -> string_of_sexpr v ^ " = " ^ string_of_sexpr e
  | SCall(f, el) ->
      f ^ "(" ^ String.concat ", " (List.map string_of_sexpr el) ^ ")"
  | SExtract(id, field) -> string_of_sexpr id ^ "." ^ field 
  | SIndex(id, idx) -> id ^ "[" ^ (string_of_int idx) ^ "]"
  | SArrBuild(elems) -> "[" ^ String.concat ", " (List.map string_of_sexpr elems)
  | SArrAssign(name, idx, x) -> name ^ string_of_sexpr idx ^ "]" ^ " = " ^ string_of_sexpr x
  | SNoexpr -> ""
				  ) ^ ")"				     

let rec string_of_sstmt = function
    SBlock(stmts) ->
      "{\n" ^ String.concat "" (List.map string_of_sstmt stmts) ^ "}\n"
  | SExpr(expr) -> string_of_sexpr expr ^ ";\n";
  | SReturn(expr) -> "return " ^ string_of_sexpr expr ^ ";\n";
  | SIf(e, s, SBlock([])) ->
      "if (" ^ string_of_sexpr e ^ ")\n" ^ string_of_sstmt s
  | SIf(e, s1, s2) ->  "if (" ^ string_of_sexpr e ^ ")\n" ^
      string_of_sstmt s1 ^ "else\n" ^ string_of_sstmt s2
  | SFor(e1, e2, e3, s) ->
      "for (" ^ string_of_sexpr e1  ^ " ; " ^ string_of_sexpr e2 ^ " ; " ^
      string_of_sexpr e3  ^ ") " ^ string_of_sstmt s
  | SWhile(e, s) -> "while (" ^ string_of_sexpr e ^ ") " ^ string_of_sstmt s

let string_of_sfdecl fdecl =
  string_of_typ fdecl.styp ^ " " ^
  fdecl.sfname ^ "(" ^ String.concat ", " (List.map snd fdecl.sformals) ^
  ")\n{\n" ^
  String.concat "" (List.map string_of_vdecl fdecl.slocals) ^
  String.concat "" (List.map string_of_sstmt fdecl.sbody) ^
  "}\n"

let string_of_ssdecl sdecl = 
   "struct " ^ sdecl.ssname ^ " {\n" ^ 
   String.concat "" (List.map string_of_vdecl sdecl.selements) ^ "}\n"

let string_of_sprogram ((vars, funcs), structs)  =
  String.concat "\n" (List.map string_of_ssdecl structs) ^ "\n" ^ 
  String.concat "" (List.map string_of_vdecl vars) ^ "\n" ^
  String.concat "\n" (List.map string_of_sfdecl funcs)
