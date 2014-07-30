##
## Simple sample tester
##

default: testall

#.PHONY:

#
# Some tools
#
RM=rm -f
CD=cd
GHC=../../ghc/inplace/bin/ghc-stage2

#
# Test
#
TESTS = sample_1/Sample1.res \
	sample_2/Sample2.res \
	sample_3/ClientBefore.res \
	sample_3/ClientAfter.res \
	sample_4/Simple.res \
	sample_4/Advanced.res \
	sample_5/Foldable.res

EXECUTABLES = \
	sample_3/ClientBefore \
	sample_3/ClientAfter \
	sample_4/Simple \
	sample_4/Advanced \
	sample_5/Foldable

.PHONY: clean
clean:
	$(RM) sample*/*hi sample*/*o sample*/*.stdout \
		sample*/*.stderr sample*/*res \
		$(EXECUTABLES)

%.stdout: %.hs
	$(CD) $(@D); $(RM) *.o *.hi
	-$(CD) $(@D); $(GHC) $(<F) >$(@F) 2>$(*F).stderr

%.res: %.stdout
	diff $< $<.test
	diff $*.stderr $*.stderr.test
	@echo "    Test $* was OK" >$@
	cat $@


testall: clean $(TESTS)
	@echo 
	@echo Test results
	@echo 
	@cat sample*/*res
	@echo

runall: testall
	@echo 
	@echo Running executables
	@echo 
	for i in $(EXECUTABLES); do echo -n "Executable$$i: "; ./$$i; done

