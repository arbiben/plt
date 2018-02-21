# Team Fi's PLT Repo

Or Aboodi oda2102@columbia.edu

Geffen Huberman gh2434@columbia.edu

Tomer Aharoni ta2453@columbia.edu

Ben Arbib ba2490@columbia.edu

This is our GitHub repo for the PLT project, Spring 2019

### How to compile and execute our compiler
	- Go inside in the main directory (inside the Fi directory: /Fi/)
	- Make sure you have all the ocaml packages installed: ocamlbuild in particular
	- run the following command: ocamlbuild toplevel.native
	- That should have compiled our compiler and created the executable toplevel.native
	- To run the compiler on any program from that same directory, run: ./toplevel.native <yourfilehere>

### How to run our test script
	- Go inside the same directory as the compiler instructions explain
	- Make sure you have python installed on your system
	- run the following command: python runprogram.py
	- The output compares each test output against a corresponding file "test#.out" and says if the expected result was correct or not

### Specific syntax still left to add to our language
	- Aliasing file/direc/string to be recognized as ID's of a certain struct type
	- Casting from one type to another- we may need to create specific functions for that
	- Not have required ordering to variables- functions - structs - variables should run anywhere
	- Using structs as types: for example "bigint i?"	
	- Declaraing and initializing variables outside of functions
	- Including the empty character in possible characters
	- Calling a function on an array implicitly with dot: specifically adding functionality of dtnamic arrays
	- Calling the whole program with a main()
