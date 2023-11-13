SHELL := /bin/bash

OUT_MODULE := $(shell command -v module 2> /dev/null)
OUT_VSIM := $(shell command -v vsim 2> /dev/null)

ifndef OUT_MODULE
	CMD := $(CMD) source /soft64/source_gaph ;
endif
ifndef OUT_VSIM
	CMD := $(CMD) module load modelsim ;
endif

#CMD := $(CMD) terminator -m -e 'multitail ../logs/output*.txt -s 2' &
#CMD := $(CMD) gnome-terminal -- bash -c "multitail ../logs/output*.txt -s 2; exec bash" &
CMD := $(CMD) vsim -do sim.do 

all:
	$(CMD)

clean: 
	rm -rf ./work
	rm -rf ./transcript
	rm -rf ./vsim.dbg
	rm -rf ./vsim.wlf
	rm -rf ./vsim_stacktrace.vstf