This folder contains examples of source code that makes use of 
SuperclassDefaultInstances Haskell extension. Every sample contains beside the
source files also expected outputs of the compiler.

.stdout.test contains expected standard output 
.stderr.test contains expected standard error output

The attached makefile contains following targets:

	testall (default targer)
	    - compiles and compares all samples

	clean
	    - cleans intermediate files after last test
