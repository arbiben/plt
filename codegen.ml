(*
Code generation: translate takes a semantically checked AST and
produces LLVM IR

Heavily based off of the MicroC's helloworld codegen example
*)

module L = Llvm
module A = Ast
open Sast 

module StringMap = Map.Make(String)

(* Code Generation from the SAST. Returns an LLVM module if successful,
   throws an exception if something is wrong. *)
let translate ((_, functions), _) =
  let context    = L.global_context () in
  (* Add types to the context so we can use them in our LLVM code *)
  let i32_t      = L.i32_type                context
  and i8_t       = L.i8_type                 context
  and ptr        = L.pointer_type (L.i8_type (context))  
  (* Create an LLVM module -- this is a container into which we'll 
     generate actual code *)
  and the_module = L.create_module context "Fi" in
  (* Convert Fi types to LLVM types *)
  let ltype_of_typ = function
      A.Int   -> i32_t
    | A.Str   -> ptr
    | t -> raise (Failure (A.string_of_typ t ^ "not implemented yet"))
  in

  (* Declare a printf function to implement print. *)
  let printf_t : L.lltype = 
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue = 
     L.declare_function "printf" printf_t the_module in 

  let to_imp str = raise (Failure ("Not yet implemented: " ^ str)) in

  (* Generate the instructions for a trivial main function *)
  let build_function fdecl =
    (* Make the LLVM module aware of the main function *)
    let main_ty = L.function_type (ltype_of_typ fdecl.styp) [||] in
    let the_function = L.define_function "main" main_ty the_module in
    (* Create an Instruction Builder, which points into a basic block
      and determines where the next instruction should be placed *)
    let builder = L.builder_at_end context (L.entry_block the_function) in
    (* Create a pointer to a format string for printf *)
    let int_format_str = L.build_global_stringptr "%d" "fmt" builder in
    let str_format_str = L.build_global_stringptr "%s\n" "fmt" builder in 
    (* Generate LLVM code for a call to print *)
    let rec expr builder ((_, e) : sexpr) = match e with
      SLiteral i -> L.const_int i32_t i (* Generate a constant integer *)
      | SStrLit i -> L.build_global_stringptr i "tmp" builder (* generate a pointer *)
      | SCall ("print", [e]) -> (* Generate a call instruction *)
  L.build_call printf_func [| int_format_str ; (expr builder e) |]
    "printf" builder 
      | SCall ("printstring", [e]) ->  
  L.build_call printf_func [| str_format_str ; (expr builder e) |] "printf" builder
      (* Throw an error for any other expressions *)
      | _ -> to_imp (string_of_sexpr (A.Int,e))  
    in
    (* Deal with a block of expression statements, terminated by a return *)
    let rec stmt builder = function
SBlock sl -> List.fold_left stmt builder sl
      | SExpr e -> let _ = expr builder e in builder 
      | SReturn e -> let _ = match fdecl.styp with
                              A.Int -> L.build_ret (expr builder e) builder 
                            | _ -> to_imp (A.string_of_typ fdecl.styp)
                     in builder
      | s -> to_imp (string_of_sstmt s)
    (* Generate the instructions for the function's body, 
       which mutates the_module *)
    in ignore(stmt builder (SBlock fdecl.sbody))
  (* Build each function (there should only be one for Hello World), 
     and return the final module *)
  in List.iter build_function functions;
the_module

