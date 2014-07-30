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
	sample_2/Sample2.res

.PHONY: clean
clean:
	$(RM) sample*/*hi sample*/*o sample*/*.stdout sample*/*.stderr sample*/*res

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
