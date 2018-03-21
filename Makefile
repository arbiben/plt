# best way to build is using ocamlbuild
.PHONY : all
all : toplevel.native #runprogram.py

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
	rm -rf *.cmx *.cmi *.cmo *.cmx *.o *.s *.ll *.out *.exe

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

# Testing the "printbig" example
#printbig : printbig.c
	#cc -o printbig -DBUILD_TEST printbig.c
