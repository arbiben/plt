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
let translate ((globals, functions), structures) =
  let context    = L.global_context () in
  (* Add types to the context so we can use them in our LLVM code *)
  let i32_t      = L.i32_type                context
  and i8_t       = L.i8_type                 context
  and i1_t       = L.i1_type                 context
  and ptr        = L.pointer_type (L.i8_type (context))  
  (* Create an LLVM module -- this is a container into which we'll 
     generate actual code *)
  and the_module = L.create_module context "Fi" in
  
  (* Beginning struct declarations buildup. need to do this before types because 
   * types will use the stringmap to find a user defined type
   * First, declare the struct names (like function decls)
   * *)
  let structure_decls map struct_decl = 
      let struct_name = L.named_struct_type context struct_decl.ssname in
      StringMap.add struct_decl.ssname struct_name map  in 
      let struct_map = List.fold_left structure_decls StringMap.empty structures in
  
  (* Convert Fi types to LLVM types *)
  let ltype_of_typ = function
      A.Int            -> i32_t
    | A.Str            -> ptr
    | A.Bool           -> i1_t 
    | A.Struct(ssname) -> StringMap.find ssname struct_map 
   (*| t -> raise (Failure (A.string_of_typ t ^ "not implemented yet"))*)
  in
  
  let structure_bods struct_decl = 
      let st_type tup = ltype_of_typ (fst tup) in
      let elements = Array.of_list (List.map st_type struct_decl.selements) in
      L.struct_set_body (StringMap.find struct_decl.ssname struct_map) elements true in
      ignore(List.map structure_bods structures);

  let store_struct_vars elems_map st =  
      let var tup = snd tup in 
      let vars = List.map var st.selements in
      let make_map pair v = ((StringMap.add v ((snd pair) + 1) (fst pair)), (snd pair) + 1) in  
      let vars_map = List.fold_left make_map (StringMap.empty, -1) vars in
      StringMap.add st.ssname (fst vars_map) elems_map in
      let struct_vars = List.fold_left store_struct_vars StringMap.empty structures in

  let global_vars = 
      let global_var m (t, n) =
          let init = L.const_int (ltype_of_typ t) 0
          in StringMap.add n (L.define_global n init the_module) m in
        List.fold_left global_var StringMap.empty globals in 
  (* Declare a printf function to implement print. *)
  let printf_t : L.lltype = 
      L.var_arg_function_type i32_t [| L.pointer_type i8_t |] in
  let printf_func : L.llvalue = 
     L.declare_function "printf" printf_t the_module in 

  let function_decls = 
        let function_decl m fdecl = 
            let name = fdecl.sfname
            and formal_types = 
                Array.of_list (List.map (fun (t, _) -> ltype_of_typ t) fdecl.sformals)
               in let ftype = L.function_type (ltype_of_typ fdecl.styp) formal_types in 
               StringMap.add name (L.define_function name ftype the_module, fdecl) m in
             List.fold_left function_decl StringMap.empty functions in

  (* Generate the instructions for a trivial main function *)
  let build_function_body fdecl =
    let (the_function, _) = StringMap.find fdecl.sfname function_decls in
    (* Create an Instruction Builder, which points into a basic block
      and determines where the next instruction should be placed *)
    let builder = L.builder_at_end context (L.entry_block the_function) in
    
    (* Create a pointer to a format string for printf *)
    let int_format_str = L.build_global_stringptr "%d" "fmt" builder in
    let str_format_str = L.build_global_stringptr "%s\n" "fmt" builder in 
    
    let local_vars = 
        let add_formal m (t, n) p =
            let () = L.set_value_name n p in
            let local = L.build_alloca (ltype_of_typ t) n builder in
            let _ = L.build_store p local builder in
            StringMap.add n local m
        in

        let add_local m (t, n) = 
            let local_var = L.build_alloca (ltype_of_typ t) n builder
            in StringMap.add n local_var m
        in 

        let formals = List.fold_left2 add_formal StringMap.empty fdecl.sformals
              (Array.to_list (L.params the_function)) in
        List.fold_left add_local formals fdecl.slocals
    in 
    let lookup n = try StringMap.find n local_vars with Not_found ->
                        StringMap.find n global_vars 
    in 

    (* Generate LLVM code for a call to print *)
    let rec expr builder ((_, e) : sexpr) = match e with
        SLiteral i -> L.const_int i32_t i (* Generate a constant integer *)
      | SBoolLit b -> L.const_int i1_t (if b then 1 else 0) 
      | SStrLit i -> L.build_global_stringptr i "tmp" builder (* generate a pointer *)
      | SStructLit s -> lookup s
      | SNoexpr -> L.const_int i32_t 0
      | SId s -> L.build_load (lookup s) s builder
      | SBinop (e1, op, e2) ->
              let  e1' = expr builder e1
              and e2' = expr builder e2 in
              (match op with
                A.Add     -> L.build_add
              | A.Sub     -> L.build_sub
              | A.Mult    -> L.build_mul
              | A.Div     -> L.build_sdiv
              | A.And     -> L.build_and
              | A.Or      -> L.build_or
              | A.Mod     -> L.build_srem
              | A.Equal   -> L.build_icmp L.Icmp.Eq
              | A.Neq     -> L.build_icmp L.Icmp.Ne
              | A.Less    -> L.build_icmp L.Icmp.Slt
              | A.Leq     -> L.build_icmp L.Icmp.Sle
              | A.Greater -> L.build_icmp L.Icmp.Sgt
              | A.Geq     -> L.build_icmp L.Icmp.Sge
              ) e1' e2' "tmp" builder
      | SUnop(op, e) -> 
              let e' = expr builder e in  
              (match op with
                A.Neg     -> L.build_neg
              | A.Not     -> L.build_not) e' "tmp" builder
      | SExtract (s, v)   -> let ptr_val = (
                             let s' = lookup s in
                             let typ_of_i = fst (List.find (fun a -> snd(a)=s) fdecl.slocals) in
                             match typ_of_i with A.Struct st -> 
                                 let positions = StringMap.find st struct_vars in
                                 let v_pos = StringMap.find v positions in
                                 let var_final = L.build_struct_gep s' v_pos "tmp" builder in var_final
                           | _ -> raise (Failure("couldn't find struct type"))) in
                     let struct_name = L.struct_name(L.type_of(lookup s)) in
                     let no_option = match struct_name with None -> "" | Some a -> a in
                     let final_pos = StringMap.find v (
                         try StringMap.find no_option struct_vars with Not_found -> 
                         raise(Failure("not able to locate this struct " ^ no_option))) in
                     let final_val = L.build_struct_gep ptr_val final_pos "tmp" builder in 
                     L.build_load final_val "tmp" builder
      | SAssign (s, e)    -> let sf = (
                                match snd s with SId s'-> lookup s'
                                | SStructLit s' -> lookup s'
                                | SExtract (s, v) -> let ptr_val = (let s' = lookup s in
                                    let typ_of_i = fst (List.find (fun a -> snd(a)=s) fdecl.slocals ) in
                                    match typ_of_i with A.Struct st -> 
                                        let positions = StringMap.find st struct_vars in
                                        let v_pos = StringMap.find v positions in
                                        let var_final = L.build_struct_gep s' v_pos "tmp" builder in var_final
                                | _ -> raise (Failure("couldn't find struct type"))) in ptr_val
                                | _ -> raise(Failure("assign failed" ^ string_of_sexpr s)))
                                 in
                             let e' = expr builder e in
                             let _  = L.build_store e' sf builder in e' 
      | SCall ("print", [e]) -> (* Generate a call instruction *)
                        L.build_call printf_func [| int_format_str ; (expr builder e) |]
                                "printf" builder 
      | SCall ("printstring", [e]) ->  
  L.build_call printf_func [| str_format_str ; (expr builder e) |] "printf" builder
      (* Throw an error for any other expressions *)
      | SCall (f, act) -> 
              let (fdef, _) = StringMap.find f function_decls in   (* (fdef, fdecl) --> (fdef, _) *)
              let actuals = List.rev (List.map (expr builder) (List.rev act)) in
              let result = f ^ "_result" in
              L.build_call fdef (Array.of_list actuals) result builder in

   (* Each basic block in a program ends with a "terminator" instruction i.e.
    *     one that ends the basic block. By definition, these instructions must
    *         indicate which basic block comes next -- they typically yield "void" value
    *             and produce control flow, not values *)
       (* Invoke "f builder" if the current block doesn't already
        *        have a terminator (e.g., a branch). *)
     let add_terminal builder f =
     (* The current block where we're inserting instr *)
         match L.block_terminator (L.insertion_block builder) with
         Some _ -> ()
       | None -> ignore (f builder) in
    (* Deal with a block of expression statements, terminated by a return *)
    let rec stmt builder = function
        SBlock sl -> List.fold_left stmt builder sl
      | SExpr e -> let _ = expr builder e in builder 
      | SReturn e -> let _ = L.build_ret (expr builder e) builder in builder
    (* Generate the instructions for the function's body, 
       which mutates the_module *)
     | SIf (predicate, then_stmt, else_stmt) ->
       let bool_val = expr builder predicate in
       (* Add "merge" basic block to our function's list of blocks *)
       let merge_bb = L.append_block context "merge" the_function in
       (* Partial function used to generate branch to merge block *) 
       let branch_instr = L.build_br merge_bb in
       (* Same for "then" basic block *)
       let then_bb = L.append_block context "then" the_function in
       (* Position builder in "then" block and build the statement *)
       let then_builder = stmt (L.builder_at_end context then_bb) then_stmt in
       (* Add a branch to the "then" block (to the merge block) 
      * if a terminator doesn't already exist for the "then" block *)
       let () = add_terminal then_builder branch_instr in
       (* Identical to stuff we did for "then" *)
       let else_bb = L.append_block context "else" the_function in
       let else_builder = stmt (L.builder_at_end context else_bb) else_stmt in
       let () = add_terminal else_builder branch_instr in
       (* Generate initial branch instruction perform the selection of "then"
        * or "else". Note we're using the builder we had access to at the start
        * of this alternative. *)
       let _ = L.build_cond_br bool_val then_bb else_bb builder in
       (* Move to the merge block for further instruction building *)
       L.builder_at_end context merge_bb
       | SWhile (predicate, body) ->
       (* First create basic block for condition instructions -- this will
        * serve as destination in the case of a loop *)
       let pred_bb = L.append_block context "while" the_function in
       (* In current block, branch to predicate to execute the condition *)
       let _ = L.build_br pred_bb builder in
      (* Create the body's block, generate the code for it, and add a branch
       * back to the predicate block (we always jump back at the end of a while
       * loop's body, unless we returned or something) *)
       let body_bb = L.append_block context "while_body" the_function in
              let while_builder = stmt (L.builder_at_end context body_bb) body in
       let () = add_terminal while_builder (L.build_br pred_bb) in
   
       (* Generate the predicate code in the predicate block *)
       let pred_builder = L.builder_at_end context pred_bb in
       let bool_val = expr pred_builder predicate in

       (* Hook everything up *)
       let merge_bb = L.append_block context "merge" the_function in
       let _ = L.build_cond_br bool_val body_bb merge_bb pred_builder in
       L.builder_at_end context merge_bb
       
       (* Implement for loops as while loops! *)
       | SFor (e1, e2, e3, body) -> stmt builder
       ( SBlock [SExpr e1 ; SWhile (e2, SBlock [body ; SExpr e3]) ] )
         in

       let builder = stmt builder (SBlock fdecl.sbody) in
       (* Add a return if the last block falls off the end *)
        add_terminal builder (match fdecl.styp with   
              t -> L.build_ret (L.const_int (ltype_of_typ t) 0))
  in
        
          
  


   (* in ignore(stmt builder (SBlock fdecl.sbody))*)
  (* Build each function (there should only be one for Hello World), 
     and return the final module *)
 List.iter build_function_body functions;
 the_module

