(* 
 Semantic checking for the Fi compiler
 Built heavily off of the MicroC semant
*)

open Ast
open Sast

module A = Ast
module S = Sast
module StringMap = Map.Make(String)
module Set = Set.Make(String)


(* Semantic checking of the AST. Returns an SAST if successful,
   throws an exception if something is wrong.

   Check each global variable, then check each function *)


let check (g_f, structs) = 
    let globals = fst g_f in 
    let functions = snd g_f in 
  
  (* Check if a certain kind of binding has void type or is a duplicate
     of another, previously checked binding *)
  let check_binds (kind : string) (to_check : bind list) = 
    let check_it checked binding = 
        let dup_err = "duplicate " ^ kind ^ " " ^ snd binding
      in match binding with
        (* No void bindings *)
      (_, n1) -> match checked with
                    (* No duplicate bindings *)
                      ((_, n2) :: _) when n1 = n2 -> raise (Failure dup_err)
                    | _ -> binding :: checked
    in let _ = List.fold_left check_it [] (List.sort compare to_check) 
       in to_check
  in 

  (* Add struct name to symbol table *)
  let add_struct map sd = 
    let dup_err = "duplicate function " ^ sd.sname
    and make_err er = raise (Failure er)
    and n = sd.sname (* Name of the struct *)
    in match sd with (* No duplicate structs *)
       _ when StringMap.mem n map -> make_err dup_err  
       | _ ->  StringMap.add n sd map 
  in

  (* Collect all other struct names into one symbol table *)
  let _ = List.fold_left add_struct StringMap.empty structs
  in
  
  let check_struct structure =
    (* Make sure no formals or locals are void or duplicates *)
    let elements' = check_binds "elements" structure.elements in

    (* body of check_function *)
    { ssname = structure.sname;
      selements = elements'
    } in

  (**** Checking Global Variables ****)

  let globals' = check_binds "global" globals in

  (**** Checking Functions ****)


  (* Collect function declarations for built-in functions: no bodies *)
    let add_bind_ints map (name, ty) = StringMap.add name {
      typ = Atyp(Int); fname = name; 
      formals = [(ty, "x")];
      locals = []; body = [] } map in
    let add_bind_read map (name, ty) = StringMap.add name {
      typ = Atyp(Str); fname = name; 
      formals = [(ty, "file")];
      locals = []; body = [] } map in
    let add_bind_write map (name, ty1, ty2) = StringMap.add name {
      typ = Atyp(Str); fname = name; 
      formals = [(ty1, "file_name"); (ty2, "new_content")];
      locals = []; body = [] } map in
    let add_bind_concat map (name, ty1, ty2) = StringMap.add name {
      typ = Atyp(Str); fname = name;
      formals = [(ty1, "str1"); (ty2, "str2")];
      locals = []; body = [] } map in
    let add_bind_tolower map (name, ty) = StringMap.add name {
      typ = Atyp(Str); fname = name; 
      formals = [(ty, "str")];
      locals = []; body = [] } map in
    let add_bind_toupper map (name, ty) = StringMap.add name {
      typ = Atyp(Str); fname = name; 
      formals = [(ty, "str")];
      locals = []; body = [] } map in
    let add_bind_strlen map (name, ty) = StringMap.add name {
      typ = Atyp(Int); fname = name; 
      formals = [(ty, "str")];
      locals = []; body = [] } map in
    let add_bind_strcmp map (name, ty1, ty2) = StringMap.add name {
      typ = Atyp(Int); fname = name;
      formals = [(ty1, "str1"); (ty2, "str2")];
      locals = []; body = [] } map in



    let built_in_decls = 
    List.fold_left add_bind_ints StringMap.empty [ ("print", Atyp(Int));
                                                 ("printstring", Atyp(Str)) ] in
    let built_in_decls = List.fold_left add_bind_read built_in_decls 
        [("readFile", Atyp(Str))] in
    let built_in_decls = List.fold_left add_bind_write built_in_decls 
        [("writeFile", (Atyp(Str)), Atyp(Str))] in
    let built_in_decls = List.fold_left add_bind_concat built_in_decls
        [("concat", (Atyp(Str)), Atyp(Str))] in
    let built_in_decls = List.fold_left add_bind_tolower built_in_decls
        [("getLow", Atyp(Str))] in
    let built_in_decls = List.fold_left add_bind_toupper built_in_decls
        [("getUp", Atyp(Str))] in
    let built_in_decls = List.fold_left add_bind_strlen built_in_decls
        [("strlen", Atyp(Str))] in
    let built_in_decls = List.fold_left add_bind_strcmp built_in_decls
        [("strcmp", (Atyp(Str)), Atyp(Str))] in

  (* Add function name to symbol table *)
  let add_func map fd = 
    let built_in_err = "function " ^ fd.fname ^ " may not be defined"
    and dup_err = "duplicate function " ^ fd.fname
    and make_err er = raise (Failure er)
    and n = fd.fname (* Name of the function *)
    in match fd with (* No duplicate functions or redefinitions of built-ins *)
         _ when StringMap.mem n built_in_decls -> make_err built_in_err
       | _ when StringMap.mem n map -> make_err dup_err  
       | _ ->  StringMap.add n fd map 
  in

  (* Collect all other function names into one symbol table *)
  let function_decls = List.fold_left add_func built_in_decls functions
  in
  
  (* Return a function from our symbol table *)
  let find_func s = 
    try StringMap.find s function_decls
    with Not_found -> raise (Failure ("unrecognized function " ^ s))
  in

  let _ = find_func "main" in (* Ensure "main" is defined *)

  let check_function func =
    (* Make sure no formals or locals are void or duplicates *)
    let formals' = check_binds "formal" func.formals in
    let locals' = check_binds "local" func.locals in

    (* Raise an exception if the given rvalue type cannot be assigned to
       the given lvalue type *)
    let check_assign lvaluet rvaluet err =
       if lvaluet = rvaluet then lvaluet else raise (Failure err)
    in   


    (* Build local symbol table of variables for this function *)
    let symbols = List.fold_left (fun m (ty, name) -> StringMap.add name ty m)
	                StringMap.empty (globals' @ formals' @ locals' )
    in

    (* Return a variable from our local symbol table *)
    let type_of_identifier s =
      try StringMap.find s symbols
      with Not_found -> raise (Failure ("undeclared identifier " ^ s))
    in

    let check_extract struct_val member = 
        let struct_equals st = st.sname = 
            (string_of_typ(struct_val)) in
        let struct_found = try List.find struct_equals structs 
            with Not_found -> raise(Failure("No such struct " ^
  (string_of_typ(struct_val)) ^ " found")) in
        let member_equals st = snd st = member in
        try fst (List.find member_equals struct_found.elements)
        with Not_found -> raise (Failure("no such member in struct type")) in

    (* Return a semantically-checked expression, i.e., with a type *)
    let rec expr = function
        Literal  l -> (Atyp(Int), SLiteral l)
      | BoolLit l  -> (Atyp(Bool), SBoolLit l)
      | Id s       -> (type_of_identifier s, SId s)
      | StrLit s   -> (Atyp(Str), SStrLit s)
      | StructLit s -> (Atyp(Struct s), SStructLit s)
      | ArrBuild l -> if List.length l = 0 then raise (Failure("Array cannot be empty tembel!!")) else
              let arr_typ = expr (List.hd l) in 
                        let _ = List.iter (fun typ -> if string_of_typ (fst arr_typ) = string_of_typ (fst (expr typ)) then () 
       else raise (Failure( " ' " ^ string_of_typ (fst (expr typ))
           ^ " ' " ^ "Does not match the types in the array: " ^ string_of_typ (fst arr_typ)))) l in 
      (Arr(
       (match fst arr_typ with 
          Atyp(typ) -> typ
        | _ -> raise(Failure("arrays can contain ints, bools, strings, or structs")))
            ), SArrBuild (List.map expr l))
      | Extract(el, er) -> (check_extract (fst(expr el)) er, SExtract(expr el, er))
      | Assign(var, e) as ex -> 
          let lt = expr var
          and rr = expr e in let
          rt = fst rr in let  e' = snd rr in  
          let err = "illegal assignment " ^ string_of_typ (fst lt) ^ " = " ^ 
            string_of_typ rt ^ " in " ^ string_of_expr ex
          in (check_assign (fst lt) rt err, SAssign(lt, (rt, e')))
      | AssignAtIndex(arr_name, index, value) -> ( 
            let arr_type = fst (expr arr_name) in 
            let type_of_arr = (
                if string_of_typ (fst (expr index)) != string_of_typ (Atyp(Int))
                    then raise (Failure ("Array index (" ^ string_of_expr index ^ " ) should be an int" ))
                else match arr_type with
                       Arr(t) -> Atyp(t)
                       | _ -> raise (Failure ("should only be able to index arrays, not type" ^ string_of_typ arr_type))) in
            let value_type = fst(expr value) in
            let err = "illegal assignment of "  ^ (string_of_typ type_of_arr) ^ " = " ^ (string_of_typ value_type) in let _ =   
                check_assign type_of_arr value_type err in 
           (arr_type, SAssignAtIndex (expr arr_name, expr index, expr value)))                                        
      
       | Index(name, index) -> 
            let arr_type = (fst (expr name)) in 
            let type_of_arr = (
                if string_of_typ (fst (expr index)) != string_of_typ (Atyp(Int))
                    then raise (Failure ("Array index (" ^ string_of_expr index ^ " ) should be an int" ))
                else match arr_type with
                       Arr(t) -> Atyp(t)
                       | _ -> raise (Failure ("should only be able to index arrays, not type" ^ string_of_typ arr_type))) in
            (type_of_arr, SIndex(expr name, expr index))
       | Unop(op, e) as ex -> 
          let (t, e') = expr e in
          let ty = match op with
            Neg when t = Atyp(Int) -> t
          | Not when t = Atyp(Bool) -> Atyp(Bool)
          | _ -> raise (Failure ("illegal unary operator " ^ 
                                 string_of_uop op ^ string_of_typ t ^
                                 " in " ^ string_of_expr ex))
          in (ty, SUnop(op, (t, e')))
      | Binop(e1, op, e2) as e -> 
          let (t1, e1') = expr e1 
          and (t2, e2') = expr e2 in
          (* All binary operators require operands of the same type *)
          let same = t1 = t2 in
          (* Determine expression type based on operator and operand types *)
          let ty = match op with
            Add | Sub | Mult | Div when same && t1 = Atyp(Int)   -> Atyp(Int)
          | Equal | Neq            when same               -> Atyp(Bool)
          | Less | Leq | Greater | Geq
                     when same && (t1 = Atyp(Int)) -> Atyp(Bool)
          | And | Or when same && t1 = Atyp(Bool) -> Atyp(Bool)
          | _ -> raise (
	      Failure ("illegal binary operator " ^
                       string_of_typ t1 ^ " " ^ string_of_op op ^ " " ^
                       string_of_typ t2 ^ " in " ^ string_of_expr e))
          in (ty, SBinop((t1, e1'), op, (t2, e2')))
      | Call(fname, args) as call -> 
          let fd = find_func fname in
          let param_length = List.length fd.formals in
          if List.length args != param_length then
            raise (Failure ("expecting " ^ string_of_int param_length ^ 
                            " arguments in " ^ string_of_expr call))
          else let check_call (ft, _) e = 
            let (et, e') = expr e in 
            let err = "illegal argument found " ^ string_of_typ et ^
              " expected " ^ string_of_typ ft ^ " in " ^ string_of_expr e
            in (check_assign ft et err, e')
          in 
          let args' = List.map2 check_call fd.formals args
          in (fd.typ, SCall(fname, args'))
      | _ -> raise(Failure ("expression not yet semantically checked"))
    in

    let check_bool_expr e = 
      let (t', e') = expr e
      and err = "expected Boolean expression in " ^ string_of_expr e
      in if t' != Atyp(Bool) then raise (Failure err) else (t', e') 
    in

    (* Return a semantically-checked statement i.e. containing sexprs *)
    let rec check_stmt = function
        Expr e -> SExpr (expr e)
      | If(p, b1, b2) -> SIf(check_bool_expr p, check_stmt b1, check_stmt b2)
      | For(e1, e2, e3, st) ->
	  SFor(expr e1, check_bool_expr e2, expr e3, check_stmt st)
      | While(p, s) -> SWhile(check_bool_expr p, check_stmt s)
      | Return e -> let (t, e') = expr e in
        if t = func.typ then SReturn (t, e') 
        else raise (
	  Failure ("return gives " ^ string_of_typ t ^ " expected " ^
		   string_of_typ func.typ ^ " in " ^ string_of_expr e))
	    
	    (* A block is correct if each statement is correct and nothing
	       follows any Return statement.  Nested blocks are flattened. *)
      | Block sl -> 
          let rec check_stmt_list = function
              [Return _ as s] -> [check_stmt s]
            | Return _ :: _   -> raise (Failure "nothing may follow a return")
            | Block sl :: ss  -> check_stmt_list (sl @ ss) (* Flatten blocks *)
            | s :: ss         -> check_stmt s :: check_stmt_list ss
            | []              -> []
          in SBlock(check_stmt_list sl)

    in (* body of check_function *)
    { styp = func.typ;
      sfname = func.fname;
      sformals = formals';
      slocals  = locals';
      sbody = match check_stmt (Block func.body) with
	SBlock(sl) -> sl
      | _ -> let err = "internal error: block didn't become a block?"
      in raise (Failure err)
    }
  in ((globals', List.map check_function functions), List.map check_struct structs)

