SHELL := /bin/bash

OUT_MODULE := $(shell command -v module 2> /dev/null)
OUT_VSIM := $(shell command -v vsim 2> /dev/null)

ifndef OUT_MODULE
	CMD := $(CMD) source /soft64/source_gaph ;
endif
ifndef OUT_VSIM
	CMD := $(CMD) module load modelsim ;
endif


CMD := $(CMD) vsim -do ./top/sim.do 

all:
	$(CMD)

clean: 
	rm -rf ./work
	rm -rf ./transcript
	rm -rf ./top/vsim.dbg
	rm -rf ./vsim.wlf
	rm -rf ./top/vsim_stacktrace.vstf