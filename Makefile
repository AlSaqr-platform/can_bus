BENDER_SIM_BUILD_DIR ?= sim
VLOG_ARGS ?= -suppress 2583 -suppress 13314

Bender.lock:
	./bender checkout
	touch Bender.lock

scripts-bender-vsim: | Bender.lock
	echo 'set ROOT [file normalize [file dirname [info script]]/..]' > $(BENDER_SIM_BUILD_DIR)/compile.tcl
	./bender script vsim \
		--vlog-arg="$(VLOG_ARGS)" --vcom-arg="" \
		 -t test \
		| grep -v "set ROOT" >> $(BENDER_SIM_BUILD_DIR)/compile.tcl



$(BENDER_SIM_BUILD_DIR)/compile.tcl: Bender.lock
	echo 'set ROOT [file normalize [file dirname [info script]]/..]' > $(BENDER_SIM_BUILD_DIR)/compile.tcl
	./bender script vsim \
		--vlog-arg="$(VLOG_ARGS)" --vcom-arg="" \
		-t rtl -t test \
		| grep -v "set ROOT" >> $(BENDER_SIM_BUILD_DIR)/compile.tcl


.PHONY: build
## Build the RTL model for vsim
build: $(BENDER_SIM_BUILD_DIR)/compile.tcl
	@test -f Bender.lock || { echo "ERROR: Bender.lock file does not exist. Did you run make checkout in bender mode?"; exit 1; }
	@test -f $(BENDER_SIM_BUILD_DIR)/compile.tcl || { echo "ERROR: sim/compile.tcl file does not exist. Did you run make scripts in bender mode?"; exit 1; }
	cd sim && $(MAKE) all

