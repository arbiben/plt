# best way to build is using ocamlbuild
.PHONY : all
all : toplevel.native custom_funcs.o

.PHONY : toplevel.native
toplevel.native :
	rm -f *.o
	ocamlbuild -use-ocamlfind -pkgs llvm,llvm.analysis -cflags -w,+a-4 \
	    toplevel.native


#this can only be used after constructing toplevel.native w/ ocamlbuild
#.PHONY : runprogram.py
#runprogram.py :
#	python runprogram.py

# "make clean" removes all generated files
.PHONY : clean
clean :
	ocamlbuild -clean
	rm -rf testall.log *.diff toplevel scanner.ml parser.ml parser.mli
	rm -rf custom_funcs.o
	rm -rf *.txt *.err *.cmx *.cmi *.cmo *.cmx *.o *.s *.ll *.out *.exe *~ *.un~
	rm -rf tests/*.o tests/*.s tests/*.ll tests/*.exe tests/*~ tests/*.un~
	rm -rf tests/compiled/*.o tests/compiled/*.s tests/compiled/*.ll 
	rm -rf tests/compiled/*.exe tests/compiled/*~ tests/compiled/*.un~ tests/compiled/*.out
	rm -rf demos/*.s demos/*.exe demos/*.out demos/*~

#build manually (not with ocamlbuild)
scanner.ml : scanner.mll
	ocamllex scanner.mll

parser.ml parser.mli : parser.mly
	ocamlyacc parser.mly

%.cmo : %.ml
	ocamlc -c $<

%.cmi : %.mli
	ocamlc -c $<

%.cmx : %.ml
	ocamlfind ocamlopt -c -package llvm $<

custom_funcs.o: custom_funcs.c
	cc -c -o custom_funcs.o custom_funcs.c
