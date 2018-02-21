# Team Fi's PLT Repo

Or Aboodi oda2102@columbia.edu

Geffen Huberman gh2434@columbia.edu

Tomer Aharoni ta2453@columbia.edu

Ben Arbib ba2490@columbia.edu

This is our GitHub repo for the PLT project, Spring 2019

### How to compile and execute our compiler
	- Go inside in the main directory (inside the Fi directory: /Fi/)
	- Make sure you have all the ocaml packages installed: ocamlbuild in particular
        - and, for the testing script also Make sure you have python installed on your system
	- You can either run each part of our code manually or run eveything together using the 
          Makefile we have provided.
        - Makefile commands:
                - 'make' will build all of our language files and then run a python script
                   The python script will run few programs written in fi to check our compiler.
                - 'make toplevel.native' is equal to running 'ocamlbuild toplevel.native'. 
                   This will build all of our language files without running the python script.
                - 'make runprogram.py' can be used only AFTER running 'ocamlbuild toplevel.native' 
                   (or alternativly just 'make toplevel.native'). This command will only run the aforementioned python script.
                - you can also use make to build each of our language files sepeartly by typing the command 'make <FILENAME>'. It will use ocamllex for the scanner, ocamlyacc for the parser, and ocamlc -c for any file that is either an .ml or .mli file   
	- To run the compiler on any program from that same directory, run: ./toplevel.native <yourfilehere>

### How to run our test script (if not using the Makefile)
        - Make sure you have python 2.7 or 3.* installed. You can use both for our script
	- Go inside the same directory as the compiler instructions explain
	- run the following command: python runprogram.py (can also run python3 runprogram.py)
	- The output compares each test output against a corresponding file "test#.out" and says if the expected result was correct or not

### Specific syntax still left to add to our language
	- Aliasing file/direc/string to be recognized as ID's of a certain struct type
	- Casting from one type to another- we may need to create specific functions for that
	- Not have required ordering to variables- functions - structs - variables should run anywhere
	- Using structs as types: for example "bigint i?"	
	- Declaraing and initializing variables outside of functions
	- Including the empty character in possible characters
        - Modifying the char token so that it actually recognizes escaped characters
	- Calling a function on an array implicitly with dot: specifically adding functionality of dtnamic arrays
	- Calling the whole program with a main()
