base_dir := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))
BUILD_DIR := $(base_dir)/builds/lsh-accelerator
FPGA_DIR := $(base_dir)/fpga-shells/xilinx
dramsim_dir := $(base_dir)/tools/DRAMSim2
MODEL := FPGAChip
PROJECT := FPGA
CONFIG_PROJECT := FPGA
CONFIG := CIFAR10UARTAdvancedFPGAConfig

export fpga_common_script_dir=$(FPGA_DIR)/common/tcl
export BOARD := kc705

# out file name
long_name = $(CONFIG_PROJECT).$(CONFIG)

# Compile DRAMSim2
CXX ?= g++
CXXFLAGS := -O1

#--------------------------------------------------------------------
# DRAMSim2
#--------------------------------------------------------------------

DRAMSIM_OBJS := $(patsubst %.cpp,%.o,$(wildcard $(base_dir)/tools/DRAMSim2/*.cpp))
$(DRAMSIM_OBJS): %.o: %.cpp
	$(CXX) $(CXXFLAGS) -DNO_STORAGE -DNO_OUTPUT -Dmain=nomain -c -o $@ $<

dramsim_lib := $(dramsim_dir)/libdramsim.a
$(dramsim_lib): $(DRAMSIM_OBJS)
	ar rcs $@ $^

# for verisim
include $(base_dir)/Makefrag-variables
include $(base_dir)/verisim/Makefrag-verilator


$(BUILD_DIR)/dramsim2_ini: $(dramsim_dir)/system.ini.example
	mkdir -p $(BUILD_DIR)
	ln -sf $< $@

# Set SBT
SBT ?= java -jar $(base_dir)/rocket-chip/sbt-launch.jar ++2.12.10 
export rocketchip_dir := $(base_dir)/rocket-chip
export sw_dir := $(base_dir)/sw

# Build firrtl.jar and put it where chisel3 can find it.
FIRRTL_JAR ?= $(base_dir)/rocket-chip/firrtl/utils/bin/firrtl.jar
FIRRTL ?= java -Xmx2G -Xss8M -XX:MaxPermSize=256M -cp $(FIRRTL_JAR) firrtl.stage.FirrtlMain -td $(BUILD_DIR)
EXTRA_FIRRTL_ARGS = --infer-rw $(MODEL) --repl-seq-mem -c:$(MODEL):-o:$(BUILD_DIR)/$(notdir $(basename $@)).conf

# to convert conf file to srams
VLSI_MEM_GEN ?= $(base_dir)/rocket-chip/scripts/vlsi_mem_gen
VLSI_ROM_GEN ?= $(base_dir)/rocket-chip/scripts/vlsi_rom_gen
bin ?= $(base_dir)/sw/bin/cifarnet/int8/LSH_layer0_subvector0.bin
trace ?=

$(FIRRTL_JAR): $(shell find $(rocketchip_dir)/firrtl/src/main/scala -iname "*.scala") 
	$(MAKE) -C $(rocketchip_dir)/firrtl SBT="$(SBT)" root_dir=$(rocketchip_dir)/firrtl build-scala
	touch $(FIRRTL_JAR)
	mkdir -p $(rocketchip_dir)/lib
	cp -p $(FIRRTL_JAR) rocket-chip/lib
	mkdir -p $(rocketchip_dir)/chisel3/lib
	cp -p $(FIRRTL_JAR) $(rocketchip_dir)/chisel3/lib

# Build .fir
firrtl := $(BUILD_DIR)/$(long_name).fir
$(firrtl): $(shell find $(base_dir)/src/main/scala -name '*.scala') $(FIRRTL_JAR) 
	mkdir -p $(dir $@)
	$(SBT) "runMain freechips.rocketchip.system.Generator -td $(BUILD_DIR) -T $(PROJECT).$(MODEL) -C $(PROJECT).$(CONFIG)"

.PHONY: firrtl
firrtl: $(firrtl)


# Build .v
verilog := $(BUILD_DIR)/$(long_name).v $(BUILD_DIR)/$(long_name).conf
$(verilog): $(firrtl) $(FIRRTL_JAR)
	$(FIRRTL) -i $< -o $@ -X verilog $(EXTRA_FIRRTL_ARGS)

.PHONY: verilog
verilog: $(verilog)


romgen := $(BUILD_DIR)/$(long_name).rom.v
$(romgen): $(verilog)
	$(VLSI_ROM_GEN) $(BUILD_DIR)/$(long_name).rom.conf $(bin) > $@

.PHONY: romgen
verilog: $(romgen)


# Build sram models
sram := $(BUILD_DIR)/$(long_name).behav_srams.v
$(sram) : $(romgen)
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

$(model_mk): $(sim_vsrcs) $(dramsim_lib) $(INSTALLED_VERILATOR)
	rm -rf $(BUILD_DIR)/$(long_name)
	mkdir -p $(BUILD_DIR)/$(long_name)
	$(VERILATOR) $(trace) $(VERILATOR_FLAGS) -Mdir $(BUILD_DIR)/$(long_name) \
	-o $(sim) $< $(sim_csrcs) -LDFLAGS "$(LDFLAGS)" \
	-CFLAGS "-I$(BUILD_DIR) -include $(model_header)"
	touch $@


# Building simulator also builds makefile .d fragment that is configuration-specific.
$(BUILD_DIR)/$(long_name).d : $(sim) ;
$(sim): $(model_mk) $(sim_csrcs) $(BUILD_DIR)/dramsim2_ini
	$(MAKE) VM_PARALLEL_BUILDS=1 -C $(BUILD_DIR)/$(long_name) -f V$(MODEL).mk

.PHONY: sim
sim: $(sim)


# Clean
.PHONY: clean
clean:
	rm -rf $(BUILD_DIR)
