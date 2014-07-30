##
## Simple sample tester
##

default: testall

#.PHONY:

#
# Some tools
#
RM=rm -f
GHC=../ghc/inplace/bin/ghc-stage2

#
# Test
#
TESTS = sample_1/Sample1.res \
	sample_2/Sample2.res \
	sample_5/Foldable.res

EXECUTABLES = sample_5/Foldable

.PHONY: clean
clean:
	$(RM) sample*/*hi sample*/*o sample*/*.stdout \
		sample*/*.stderr sample*/*res \
		$(EXECUTABLES)

%.stdout: %.hs
	-$(GHC) $< >$@ 2>$*.stderr

%.res: %.stdout
	diff $< $<.test
	diff $*.stderr $*.stderr.test
	@echo "    Test $* was OK" >$@
	cat $@


testall: $(TESTS)
	@echo 
	@echo Test results
	@echo 
	@cat sample*/*res
	@echo

runall: testall
	@echo 
	@echo Running executables
	@echo 
	for i in "$(EXECUTABLES)"; do echo -n "Executable $$i"; ./$$i; done

