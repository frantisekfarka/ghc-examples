Contents of this folder
=======================

This folder contains examples of source code that makes use of 
SuperclassDefaultInstances Haskell extension. Every sample contains beside the
source files also expected outputs of the compiler.

.stdout.test contains expected standard output 
.stderr.test contains expected standard error output

The attached makefile contains following targets:

	testall (default target)
	    - compiles and compares all samples

	runall
	    - run all executable binaries

	clean
	    - cleans intermediate files after last test

	
Description of the examples
---------------------------

./sample_1 
	- simple example showing syntax

./sample_2 
	- simple example shoving that default instance syntax
	is invalid without the language extension pragma

./sample_3
	- an example shoving change in the library (
	Functor - Applicative - Monad proposal) without the change
	of a client

./sample_4
	- demonstration of Numeric classes adaptation

./sample_5
	- more complex example with default instances of Functor and
	Foldable derived from Traversable
	
