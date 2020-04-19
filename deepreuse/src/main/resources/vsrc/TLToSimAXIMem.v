module TLToSimAXIMem(
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31736.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31737.4]
  output        auto_buffer_in_a_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  input         auto_buffer_in_a_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  input  [2:0]  auto_buffer_in_a_bits_opcode, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  input  [2:0]  auto_buffer_in_a_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  input  [7:0]  auto_buffer_in_a_bits_source, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  input  [31:0] auto_buffer_in_a_bits_address, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  input  [7:0]  auto_buffer_in_a_bits_mask, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  input  [63:0] auto_buffer_in_a_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  input         auto_buffer_in_d_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  output        auto_buffer_in_d_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  output [2:0]  auto_buffer_in_d_bits_opcode, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  output [1:0]  auto_buffer_in_d_bits_param, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  output [2:0]  auto_buffer_in_d_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  output [7:0]  auto_buffer_in_d_bits_source, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  output        auto_buffer_in_d_bits_denied, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  output [63:0] auto_buffer_in_d_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]
  output        auto_buffer_in_d_bits_corrupt // @[:boom.system.TestHarness.MegaBoomConfig.fir@31738.4]	
);

  wire  mem_io_axi4_0_aw_ready; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_aw_valid; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [3:0] mem_io_axi4_0_aw_bits_id; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [27:0] mem_io_axi4_0_aw_bits_addr; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [7:0] mem_io_axi4_0_aw_bits_len; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [2:0] mem_io_axi4_0_aw_bits_size; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [1:0] mem_io_axi4_0_aw_bits_burst; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_w_ready; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_w_valid; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [63:0] mem_io_axi4_0_w_bits_data; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [7:0] mem_io_axi4_0_w_bits_strb; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_w_bits_last; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_b_ready; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_b_valid; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [3:0] mem_io_axi4_0_b_bits_id; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [1:0] mem_io_axi4_0_b_bits_resp; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_ar_ready; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_ar_valid; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [3:0] mem_io_axi4_0_ar_bits_id; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [27:0] mem_io_axi4_0_ar_bits_addr; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [7:0] mem_io_axi4_0_ar_bits_len; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [2:0] mem_io_axi4_0_ar_bits_size; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [1:0] mem_io_axi4_0_ar_bits_burst; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_r_ready; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_r_valid; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [3:0] mem_io_axi4_0_r_bits_id; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [63:0] mem_io_axi4_0_r_bits_data; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire [1:0] mem_io_axi4_0_r_bits_resp; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
  wire  mem_io_axi4_0_r_bits_last; // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]

  // unused
  wire  dut_mem_axi4_0_ar_bits_lock; // @[TestHarness.scala 17:19:boom.system.TestHarness.MegaBoomConfig.fir@331753.4]
  wire [3:0] dut_mem_axi4_0_ar_bits_cache; // @[TestHarness.scala 17:19:boom.system.TestHarness.MegaBoomConfig.fir@331753.4]
  wire [2:0] dut_mem_axi4_0_ar_bits_prot; // @[TestHarness.scala 17:19:boom.system.TestHarness.MegaBoomConfig.fir@331753.4]
  wire [3:0] dut_mem_axi4_0_ar_bits_qos; // @[TestHarness.scala 17:19:boom.system.TestHarness.MegaBoomConfig.fir@331753.4]

  wire  dut_mem_axi4_0_aw_bits_lock; // @[TestHarness.scala 17:19:boom.system.TestHarness.MegaBoomConfig.fir@331753.4]
  wire [3:0] dut_mem_axi4_0_aw_bits_cache; // @[TestHarness.scala 17:19:boom.system.TestHarness.MegaBoomConfig.fir@331753.4]
  wire [2:0] dut_mem_axi4_0_aw_bits_prot; // @[TestHarness.scala 17:19:boom.system.TestHarness.MegaBoomConfig.fir@331753.4]
  wire [3:0] dut_mem_axi4_0_aw_bits_qos; // @[TestHarness.scala 17:19:boom.system.TestHarness.MegaBoomConfig.fir@331753.4]


  SimMemoryBus mbus ( // @[LazyModule.scala 224:27:boom.system.TestHarness.MegaBoomConfig.fir@31793.4]
    .clock(clock),
    .reset(reset),
    .auto_buffer_in_a_ready(auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid(auto_buffer_in_a_valid),
    .auto_buffer_in_a_bits_opcode(auto_buffer_in_a_bits_opcode),
    .auto_buffer_in_a_bits_size(auto_buffer_in_a_bits_size),
    .auto_buffer_in_a_bits_source(auto_buffer_in_a_bits_source),
    .auto_buffer_in_a_bits_address(auto_buffer_in_a_bits_address),
    .auto_buffer_in_a_bits_mask(auto_buffer_in_a_bits_mask),
    .auto_buffer_in_a_bits_data(auto_buffer_in_a_bits_data),
    .auto_buffer_in_d_ready(auto_buffer_in_d_ready),
    .auto_buffer_in_d_valid(auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode(auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param(auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size(auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source(auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_denied(auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data(auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt(auto_buffer_in_d_bits_corrupt),
    .auto_axi4yank_out_aw_ready(mem_io_axi4_0_aw_ready),
    .auto_axi4yank_out_aw_valid(mem_io_axi4_0_aw_valid),
    .auto_axi4yank_out_aw_bits_id(mem_io_axi4_0_aw_bits_id),
    .auto_axi4yank_out_aw_bits_addr(mem_io_axi4_0_aw_bits_addr),
    .auto_axi4yank_out_aw_bits_len(mem_io_axi4_0_aw_bits_len),
    .auto_axi4yank_out_aw_bits_size(mem_io_axi4_0_aw_bits_size),
    .auto_axi4yank_out_aw_bits_burst(mem_io_axi4_0_aw_bits_burst),
    .auto_axi4yank_out_aw_bits_lock(dut_mem_axi4_0_aw_bits_lock),
    .auto_axi4yank_out_aw_bits_cache(dut_mem_axi4_0_aw_bits_cache),
    .auto_axi4yank_out_aw_bits_prot(dut_mem_axi4_0_aw_bits_prot),
    .auto_axi4yank_out_aw_bits_qos(dut_mem_axi4_0_aw_bits_qos),
    .auto_axi4yank_out_w_ready(mem_io_axi4_0_w_ready),
    .auto_axi4yank_out_w_valid(mem_io_axi4_0_w_valid),
    .auto_axi4yank_out_w_bits_data(mem_io_axi4_0_w_bits_data),
    .auto_axi4yank_out_w_bits_strb(mem_io_axi4_0_w_bits_strb),
    .auto_axi4yank_out_w_bits_last(mem_io_axi4_0_w_bits_last),
    .auto_axi4yank_out_b_ready(mem_io_axi4_0_b_ready),
    .auto_axi4yank_out_b_valid(mem_io_axi4_0_b_valid),
    .auto_axi4yank_out_b_bits_id(mem_io_axi4_0_b_bits_id),
    .auto_axi4yank_out_b_bits_resp(mem_io_axi4_0_b_bits_resp),
    .auto_axi4yank_out_ar_ready(mem_io_axi4_0_ar_ready),
    .auto_axi4yank_out_ar_valid(mem_io_axi4_0_ar_valid),
    .auto_axi4yank_out_ar_bits_id(mem_io_axi4_0_ar_bits_id),
    .auto_axi4yank_out_ar_bits_addr(mem_io_axi4_0_ar_bits_addr),
    .auto_axi4yank_out_ar_bits_len(mem_io_axi4_0_ar_bits_len),
    .auto_axi4yank_out_ar_bits_size(mem_io_axi4_0_ar_bits_size),
    .auto_axi4yank_out_ar_bits_burst(mem_io_axi4_0_ar_bits_burst),
    .auto_axi4yank_out_ar_bits_lock(dut_mem_axi4_0_ar_bits_lock),
    .auto_axi4yank_out_ar_bits_cache(dut_mem_axi4_0_ar_bits_cache),
    .auto_axi4yank_out_ar_bits_prot(dut_mem_axi4_0_ar_bits_prot),
    .auto_axi4yank_out_ar_bits_qos(dut_mem_axi4_0_ar_bits_qos),
    .auto_axi4yank_out_r_ready(mem_io_axi4_0_r_ready),
    .auto_axi4yank_out_r_valid(mem_io_axi4_0_r_valid),
    .auto_axi4yank_out_r_bits_id(mem_io_axi4_0_r_bits_id),
    .auto_axi4yank_out_r_bits_data(mem_io_axi4_0_r_bits_data),
    .auto_axi4yank_out_r_bits_resp(mem_io_axi4_0_r_bits_resp),
    .auto_axi4yank_out_r_bits_last(mem_io_axi4_0_r_bits_last)
  );

  SimAXIMem mem ( // @[BoomSubsystem.scala 114:13:boom.system.TestHarness.MegaBoomConfig.fir@331768.4]
    .clock(clock),
    .reset(reset),
    .io_axi4_0_aw_ready(mem_io_axi4_0_aw_ready),
    .io_axi4_0_aw_valid(mem_io_axi4_0_aw_valid),
    .io_axi4_0_aw_bits_id(mem_io_axi4_0_aw_bits_id),
    .io_axi4_0_aw_bits_addr(mem_io_axi4_0_aw_bits_addr),
    .io_axi4_0_aw_bits_len(mem_io_axi4_0_aw_bits_len),
    .io_axi4_0_aw_bits_size(mem_io_axi4_0_aw_bits_size),
    .io_axi4_0_aw_bits_burst(mem_io_axi4_0_aw_bits_burst),
    .io_axi4_0_w_ready(mem_io_axi4_0_w_ready),
    .io_axi4_0_w_valid(mem_io_axi4_0_w_valid),
    .io_axi4_0_w_bits_data(mem_io_axi4_0_w_bits_data),
    .io_axi4_0_w_bits_strb(mem_io_axi4_0_w_bits_strb),
    .io_axi4_0_w_bits_last(mem_io_axi4_0_w_bits_last),
    .io_axi4_0_b_ready(mem_io_axi4_0_b_ready),
    .io_axi4_0_b_valid(mem_io_axi4_0_b_valid),
    .io_axi4_0_b_bits_id(mem_io_axi4_0_b_bits_id),
    .io_axi4_0_b_bits_resp(mem_io_axi4_0_b_bits_resp),
    .io_axi4_0_ar_ready(mem_io_axi4_0_ar_ready),
    .io_axi4_0_ar_valid(mem_io_axi4_0_ar_valid),
    .io_axi4_0_ar_bits_id(mem_io_axi4_0_ar_bits_id),
    .io_axi4_0_ar_bits_addr(mem_io_axi4_0_ar_bits_addr),
    .io_axi4_0_ar_bits_len(mem_io_axi4_0_ar_bits_len),
    .io_axi4_0_ar_bits_size(mem_io_axi4_0_ar_bits_size),
    .io_axi4_0_ar_bits_burst(mem_io_axi4_0_ar_bits_burst),
    .io_axi4_0_r_ready(mem_io_axi4_0_r_ready),
    .io_axi4_0_r_valid(mem_io_axi4_0_r_valid),
    .io_axi4_0_r_bits_id(mem_io_axi4_0_r_bits_id),
    .io_axi4_0_r_bits_data(mem_io_axi4_0_r_bits_data),
    .io_axi4_0_r_bits_resp(mem_io_axi4_0_r_bits_resp),
    .io_axi4_0_r_bits_last(mem_io_axi4_0_r_bits_last)
  );



endmodule