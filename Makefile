base_dir := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
BUILD_DIR := $(base_dir)/builds/lsh-accelerator
FPGA_DIR := $(base_dir)/fpga-shells/xilinx
MODEL := FPGAChip
PROJECT := FPGA
CONFIG_PROJECT := FPGA
CONFIG := CIFAR10UARTAdvancedFPGAConfig

export fpga_common_script_dir=$(FPGA_DIR)/common/tcl
export BOARD := kc705

# out file name
long_name = $(CONFIG_PROJECT).$(CONFIG)

# for verisim
include $(base_dir)/Makefrag-variables
include $(base_dir)/verisim/Makefrag-verilator

# Set SBT
SBT ?= java -Xmx2G -Xss8M -XX:MaxPermSize=256M -jar $(base_dir)/sbt-launch.jar ++2.12.4 

# function looking for scala sources
lookup_scala_srcs = $(shell find $(1)/ -iname "*.scala" 2> /dev/null)

# Build firrtl.jar and put it where chisel3 can find it.
ROCKET_CLASSES ?= "$(base_dir)/rocket-chip/target/scala-2.12/classes:$(base_dir)/target/chisel3/target/scala-2.12/*"
FIRRTL_JAR ?= $(base_dir)/rocket-chip/firrtl/utils/bin/firrtl.jar
FIRRTL ?= java -Xmx2G -Xss8M -XX:MaxPermSize=256M -cp "$(FIRRTL_JAR)":"$(ROCKET_CLASSES)" firrtl.stage.FirrtlMain
EXTRA_FIRRTL_ARGS = --infer-rw $(MODEL) --repl-seq-mem -c:$(MODEL):-o:$(BUILD_DIR)/$(notdir $(basename $@)).conf

# to convert conf file to srams
VLSI_MEM_GEN ?= $(base_dir)/rocket-chip/scripts/vlsi_mem_gen

$(FIRRTL_JAR): $(call lookup_scala_srcs, $(base_dir)/rocket-chip/firrtl/src/main/scala)
	$(MAKE) -C $(base_dir)/rocket-chip/firrtl SBT="$(SBT)" root_dir=$(base_dir)/rocket-chip/firrtl build-scala
	touch $(FIRRTL_JAR)
	mkdir -p $(base_dir)/lib
	cp -p $(FIRRTL_JAR) $(base_dir)/lib
	

# Build .fir
firrtl := $(BUILD_DIR)/$(long_name).fir
$(firrtl): $(call lookup_scala_srcs, $(base_dir)/src/main/scala)
	mkdir -p $(dir $@)
	$(SBT) "runMain freechips.rocketchip.system.Generator $(BUILD_DIR) $(PROJECT) $(MODEL) $(CONFIG_PROJECT) $(CONFIG)"

.PHONY: firrtl
firrtl: $(firrtl)


# Build .v
verilog := $(BUILD_DIR)/$(long_name).v $(BUILD_DIR)/$(long_name).conf
$(verilog): $(firrtl) $(FIRRTL_JAR)
	$(FIRRTL) -i $< -o $@ -X verilog -faf $(BUILD_DIR)/$(notdir $(basename $@)).anno.json $(EXTRA_FIRRTL_ARGS)


.PHONY: verilog
verilog: $(verilog)


# Build sram models
sram := $(BUILD_DIR)/$(long_name).behav_srams.v
$(sram) : $(verilog)
	cd $(generated_dir) && \
	$(VLSI_MEM_GEN) $(BUILD_DIR)/$(long_name).conf > $@.tmp && \
	mv -f $@.tmp $@

.PHONY: sram
sram: $(sram)


f := $(BUILD_DIR)/$(long_name).vsrcs.F
$(f):
	echo $(VSRCS) > $@

bit := $(BUILD_DIR)/obj/$(MODEL).bit
$(bit): $(sram) $(f)
	cd $(BUILD_DIR); vivado \
		-nojournal -mode batch \
		-source $(fpga_common_script_dir)/vivado.tcl \
		-tclargs \
		-top-module "$(MODEL)" \
		-F "$(f)" \
		-ip-vivado-tcls "$(shell find '$(BUILD_DIR)' -name '*.vivado.tcl')" \
		-board "$(BOARD)"


# Build .mcs
mcs := $(BUILD_DIR)/obj/$(MODEL).mcs
$(mcs): $(bit)
	cd $(BUILD_DIR); vivado -nojournal -mode batch -source $(fpga_common_script_dir)/write_cfgmem.tcl -tclargs $(BOARD) $@ $<

.PHONY: mcs
mcs: $(mcs)



# Build simulator
sim = $(BUILD_DIR)/simulator-$(PROJECT)-$(MODEL)
model_dir = $(BUILD_DIR)/$(long_name)
model_mk = $(model_dir)/V$(MODEL).mk
model_header = $(model_dir)/V$(MODEL).h

sim_csrcs += $(base_dir)/deepreuse/src/main/resources/csrc/LSHUInt8Emulator.cc

$(model_mk): $(sim_vsrcs) $(INSTALLED_VERILATOR)
	rm -rf $(BUILD_DIR)/$(long_name)
	mkdir -p $(BUILD_DIR)/$(long_name)
	$(VERILATOR) $(VERILATOR_FLAGS) -Mdir $(BUILD_DIR)/$(long_name) \
	-o $(sim) $< $(sim_csrcs) -LDFLAGS "$(LDFLAGS)" \
	-CFLAGS "-I$(BUILD_DIR) -include $(model_header)"
	touch $@


# Building simulator also builds makefile .d fragment that is configuration-specific.
$(BUILD_DIR)/$(long_name).d : $(sim) ;
$(sim): $(model_mk) $(sim_csrcs)
	$(MAKE) VM_PARALLEL_BUILDS=1 -C $(BUILD_DIR)/$(long_name) -f V$(MODEL).mk

.PHONY: sim
sim: $(sim)


# Clean
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
