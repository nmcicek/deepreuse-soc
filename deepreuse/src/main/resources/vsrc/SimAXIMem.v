module TLBuffer_16( // @[:boom.system.TestHarness.MegaBoomConfig.fir@16842.2]
  output        auto_in_a_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input         auto_in_a_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [2:0]  auto_in_a_bits_opcode, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [2:0]  auto_in_a_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [7:0]  auto_in_a_bits_source, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [31:0] auto_in_a_bits_address, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [7:0]  auto_in_a_bits_mask, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [63:0] auto_in_a_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input         auto_in_d_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output        auto_in_d_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [2:0]  auto_in_d_bits_opcode, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [1:0]  auto_in_d_bits_param, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [2:0]  auto_in_d_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [7:0]  auto_in_d_bits_source, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output        auto_in_d_bits_denied, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [63:0] auto_in_d_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output        auto_in_d_bits_corrupt, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input         auto_out_a_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output        auto_out_a_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [2:0]  auto_out_a_bits_opcode, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [2:0]  auto_out_a_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [7:0]  auto_out_a_bits_source, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [31:0] auto_out_a_bits_address, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [7:0]  auto_out_a_bits_mask, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output [63:0] auto_out_a_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  output        auto_out_d_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input         auto_out_d_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [2:0]  auto_out_d_bits_opcode, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [1:0]  auto_out_d_bits_param, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [2:0]  auto_out_d_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [7:0]  auto_out_d_bits_source, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input         auto_out_d_bits_denied, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input  [63:0] auto_out_d_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
  input         auto_out_d_bits_corrupt // @[:boom.system.TestHarness.MegaBoomConfig.fir@16845.4]
);
  assign auto_in_a_ready = auto_out_a_ready; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@16855.4]
  assign auto_in_d_valid = auto_out_d_valid; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@16855.4]
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@16855.4]
  assign auto_in_d_bits_param = auto_out_d_bits_param; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@16855.4]
  assign auto_in_d_bits_size = auto_out_d_bits_size; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@16855.4]
  assign auto_in_d_bits_source = auto_out_d_bits_source; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@16855.4]
  assign auto_in_d_bits_denied = auto_out_d_bits_denied; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@16855.4]
  assign auto_in_d_bits_data = auto_out_d_bits_data; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@16855.4]
  assign auto_in_d_bits_corrupt = auto_out_d_bits_corrupt; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@16855.4]
  assign auto_out_a_valid = auto_in_a_valid; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@16854.4]
  assign auto_out_a_bits_opcode = auto_in_a_bits_opcode; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@16854.4]
  assign auto_out_a_bits_size = auto_in_a_bits_size; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@16854.4]
  assign auto_out_a_bits_source = auto_in_a_bits_source; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@16854.4]
  assign auto_out_a_bits_address = auto_in_a_bits_address; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@16854.4]
  assign auto_out_a_bits_mask = auto_in_a_bits_mask; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@16854.4]
  assign auto_out_a_bits_data = auto_in_a_bits_data; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@16854.4]
  assign auto_out_d_ready = auto_in_d_ready; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@16854.4]
endmodule

module Queue_3( // @[:boom.system.TestHarness.MegaBoomConfig.fir@6266.2]
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6267.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6268.4]
  output        io_enq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
  input         io_enq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
  input  [63:0] io_enq_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
  input  [7:0]  io_enq_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
  input         io_enq_bits_last, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
  input         io_deq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
  output        io_deq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
  output [63:0] io_deq_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
  output [7:0]  io_deq_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
  output        io_deq_bits_last // @[:boom.system.TestHarness.MegaBoomConfig.fir@6269.4]
);
  reg [63:0] _T_35_data [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  reg [63:0] _RAND_0;
  wire [63:0] _T_35_data__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_data__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire [63:0] _T_35_data__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_data__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_data__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_data__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  reg [7:0] _T_35_strb [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  reg [31:0] _RAND_1;
  wire [7:0] _T_35_strb__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_strb__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire [7:0] _T_35_strb__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_strb__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_strb__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_strb__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  reg  _T_35_last [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  reg [31:0] _RAND_2;
  wire  _T_35_last__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_last__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_last__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_last__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_last__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  wire  _T_35_last__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  reg  value; // @[Counter.scala 26:33:boom.system.TestHarness.MegaBoomConfig.fir@6272.4]
  reg [31:0] _RAND_3;
  reg  value_1; // @[Counter.scala 26:33:boom.system.TestHarness.MegaBoomConfig.fir@6273.4]
  reg [31:0] _RAND_4;
  reg  _T_39; // @[Decoupled.scala 217:35:boom.system.TestHarness.MegaBoomConfig.fir@6274.4]
  reg [31:0] _RAND_5;
  wire  _T_40; // @[Decoupled.scala 219:41:boom.system.TestHarness.MegaBoomConfig.fir@6275.4]
  wire  _T_41; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@6276.4]
  wire  _T_42; // @[Decoupled.scala 220:33:boom.system.TestHarness.MegaBoomConfig.fir@6277.4]
  wire  _T_43; // @[Decoupled.scala 221:32:boom.system.TestHarness.MegaBoomConfig.fir@6278.4]
  wire  _T_44; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@6279.4]
  wire  _T_47; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@6282.4]
  wire  _T_52; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@6292.6]
  wire  _T_54; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@6298.6]
  wire  _T_55; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@6301.4]
  assign _T_35_data__T_58_addr = value_1;
  assign _T_35_data__T_58_data = _T_35_data[_T_35_data__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  assign _T_35_data__T_50_data = io_enq_bits_data;
  assign _T_35_data__T_50_addr = value;
  assign _T_35_data__T_50_mask = 1'h1;
  assign _T_35_data__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_strb__T_58_addr = value_1;
  assign _T_35_strb__T_58_data = _T_35_strb[_T_35_strb__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  assign _T_35_strb__T_50_data = io_enq_bits_strb;
  assign _T_35_strb__T_50_addr = value;
  assign _T_35_strb__T_50_mask = 1'h1;
  assign _T_35_strb__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_last__T_58_addr = value_1;
  assign _T_35_last__T_58_data = _T_35_last[_T_35_last__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
  assign _T_35_last__T_50_data = io_enq_bits_last;
  assign _T_35_last__T_50_addr = value;
  assign _T_35_last__T_50_mask = 1'h1;
  assign _T_35_last__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_40 = value == value_1; // @[Decoupled.scala 219:41:boom.system.TestHarness.MegaBoomConfig.fir@6275.4]
  assign _T_41 = _T_39 == 1'h0; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@6276.4]
  assign _T_42 = _T_40 & _T_41; // @[Decoupled.scala 220:33:boom.system.TestHarness.MegaBoomConfig.fir@6277.4]
  assign _T_43 = _T_40 & _T_39; // @[Decoupled.scala 221:32:boom.system.TestHarness.MegaBoomConfig.fir@6278.4]
  assign _T_44 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@6279.4]
  assign _T_47 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@6282.4]
  assign _T_52 = value + 1'h1; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@6292.6]
  assign _T_54 = value_1 + 1'h1; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@6298.6]
  assign _T_55 = _T_44 != _T_47; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@6301.4]
  assign io_enq_ready = _T_43 == 1'h0; // @[Decoupled.scala 237:16:boom.system.TestHarness.MegaBoomConfig.fir@6308.4]
  assign io_deq_valid = _T_42 == 1'h0; // @[Decoupled.scala 236:16:boom.system.TestHarness.MegaBoomConfig.fir@6306.4]
  assign io_deq_bits_data = _T_35_data__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@6312.4]
  assign io_deq_bits_strb = _T_35_strb__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@6311.4]
  assign io_deq_bits_last = _T_35_last__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@6310.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_data[initvar] = _RAND_0[63:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_strb[initvar] = _RAND_1[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_last[initvar] = _RAND_2[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  value = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  value_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_39 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_data__T_50_en & _T_35_data__T_50_mask) begin
      _T_35_data[_T_35_data__T_50_addr] <= _T_35_data__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
    end
    if(_T_35_strb__T_50_en & _T_35_strb__T_50_mask) begin
      _T_35_strb[_T_35_strb__T_50_addr] <= _T_35_strb__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
    end
    if(_T_35_last__T_50_en & _T_35_last__T_50_mask) begin
      _T_35_last[_T_35_last__T_50_addr] <= _T_35_last__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@6271.4]
    end
    if (reset) begin
      value <= 1'h0;
    end else begin
      if (_T_44) begin
        value <= _T_52;
      end
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else begin
      if (_T_47) begin
        value_1 <= _T_54;
      end
    end
    if (reset) begin
      _T_39 <= 1'h0;
    end else begin
      if (_T_55) begin
        _T_39 <= _T_44;
      end
    end
  end
endmodule
module Queue_43( // @[:boom.system.TestHarness.MegaBoomConfig.fir@9771.2]
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9772.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9773.4]
  output        io_enq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
  input         io_enq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
  input  [63:0] io_enq_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
  input  [7:0]  io_enq_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
  input         io_enq_bits_last, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
  input         io_deq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
  output        io_deq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
  output [63:0] io_deq_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
  output [7:0]  io_deq_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
  output        io_deq_bits_last // @[:boom.system.TestHarness.MegaBoomConfig.fir@9774.4]
);
  reg [63:0] _T_35_data [0:0]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  reg [63:0] _RAND_0;
  wire [63:0] _T_35_data__T_52_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_data__T_52_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire [63:0] _T_35_data__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_data__T_48_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_data__T_48_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_data__T_48_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  reg [7:0] _T_35_strb [0:0]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  reg [31:0] _RAND_1;
  wire [7:0] _T_35_strb__T_52_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_strb__T_52_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire [7:0] _T_35_strb__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_strb__T_48_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_strb__T_48_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_strb__T_48_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  reg  _T_35_last [0:0]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  reg [31:0] _RAND_2;
  wire  _T_35_last__T_52_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_last__T_52_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_last__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_last__T_48_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_last__T_48_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  wire  _T_35_last__T_48_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  reg  _T_37; // @[Decoupled.scala 217:35:boom.system.TestHarness.MegaBoomConfig.fir@9777.4]
  reg [31:0] _RAND_3;
  wire  _T_39; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@9779.4]
  wire  _T_42; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@9782.4]
  wire  _T_45; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@9785.4]
  wire  _GEN_9; // @[Decoupled.scala 245:27:boom.system.TestHarness.MegaBoomConfig.fir@9816.6]
  wire  _GEN_14; // @[Decoupled.scala 242:18:boom.system.TestHarness.MegaBoomConfig.fir@9811.4]
  wire  _GEN_13; // @[Decoupled.scala 242:18:boom.system.TestHarness.MegaBoomConfig.fir@9811.4]
  wire  _T_49; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@9796.4]
  wire  _T_50; // @[Decoupled.scala 236:19:boom.system.TestHarness.MegaBoomConfig.fir@9800.4]
  assign _T_35_data__T_52_addr = 1'h0;
  assign _T_35_data__T_52_data = _T_35_data[_T_35_data__T_52_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  assign _T_35_data__T_48_data = io_enq_bits_data;
  assign _T_35_data__T_48_addr = 1'h0;
  assign _T_35_data__T_48_mask = 1'h1;
  assign _T_35_data__T_48_en = _T_39 ? _GEN_9 : _T_42;
  assign _T_35_strb__T_52_addr = 1'h0;
  assign _T_35_strb__T_52_data = _T_35_strb[_T_35_strb__T_52_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  assign _T_35_strb__T_48_data = io_enq_bits_strb;
  assign _T_35_strb__T_48_addr = 1'h0;
  assign _T_35_strb__T_48_mask = 1'h1;
  assign _T_35_strb__T_48_en = _T_39 ? _GEN_9 : _T_42;
  assign _T_35_last__T_52_addr = 1'h0;
  assign _T_35_last__T_52_data = _T_35_last[_T_35_last__T_52_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
  assign _T_35_last__T_48_data = io_enq_bits_last;
  assign _T_35_last__T_48_addr = 1'h0;
  assign _T_35_last__T_48_mask = 1'h1;
  assign _T_35_last__T_48_en = _T_39 ? _GEN_9 : _T_42;
  assign _T_39 = _T_37 == 1'h0; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@9779.4]
  assign _T_42 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@9782.4]
  assign _T_45 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@9785.4]
  assign _GEN_9 = io_deq_ready ? 1'h0 : _T_42; // @[Decoupled.scala 245:27:boom.system.TestHarness.MegaBoomConfig.fir@9816.6]
  assign _GEN_14 = _T_39 ? _GEN_9 : _T_42; // @[Decoupled.scala 242:18:boom.system.TestHarness.MegaBoomConfig.fir@9811.4]
  assign _GEN_13 = _T_39 ? 1'h0 : _T_45; // @[Decoupled.scala 242:18:boom.system.TestHarness.MegaBoomConfig.fir@9811.4]
  assign _T_49 = _GEN_14 != _GEN_13; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@9796.4]
  assign _T_50 = _T_39 == 1'h0; // @[Decoupled.scala 236:19:boom.system.TestHarness.MegaBoomConfig.fir@9800.4]
  assign io_enq_ready = _T_37 == 1'h0; // @[Decoupled.scala 237:16:boom.system.TestHarness.MegaBoomConfig.fir@9803.4]
  assign io_deq_valid = io_enq_valid ? 1'h1 : _T_50; // @[Decoupled.scala 236:16:boom.system.TestHarness.MegaBoomConfig.fir@9801.4 Decoupled.scala 241:40:boom.system.TestHarness.MegaBoomConfig.fir@9809.6]
  assign io_deq_bits_data = _T_39 ? io_enq_bits_data : _T_35_data__T_52_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@9807.4 Decoupled.scala 243:19:boom.system.TestHarness.MegaBoomConfig.fir@9814.6]
  assign io_deq_bits_strb = _T_39 ? io_enq_bits_strb : _T_35_strb__T_52_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@9806.4 Decoupled.scala 243:19:boom.system.TestHarness.MegaBoomConfig.fir@9813.6]
  assign io_deq_bits_last = _T_39 ? io_enq_bits_last : _T_35_last__T_52_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@9805.4 Decoupled.scala 243:19:boom.system.TestHarness.MegaBoomConfig.fir@9812.6]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_data[initvar] = _RAND_0[63:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_strb[initvar] = _RAND_1[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_last[initvar] = _RAND_2[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_37 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_data__T_48_en & _T_35_data__T_48_mask) begin
      _T_35_data[_T_35_data__T_48_addr] <= _T_35_data__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
    end
    if(_T_35_strb__T_48_en & _T_35_strb__T_48_mask) begin
      _T_35_strb[_T_35_strb__T_48_addr] <= _T_35_strb__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
    end
    if(_T_35_last__T_48_en & _T_35_last__T_48_mask) begin
      _T_35_last[_T_35_last__T_48_addr] <= _T_35_last__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@9776.4]
    end
    if (reset) begin
      _T_37 <= 1'h0;
    end else begin
      if (_T_49) begin
        if (_T_39) begin
          if (io_deq_ready) begin
            _T_37 <= 1'h0;
          end else begin
            _T_37 <= _T_42;
          end
        end else begin
          _T_37 <= _T_42;
        end
      end
    end
  end
endmodule
module AXI4RAM( // @[:boom.system.TestHarness.MegaBoomConfig.fir@328894.2]
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328895.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328896.4]
  output        auto_in_aw_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input         auto_in_aw_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input  [3:0]  auto_in_aw_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input  [27:0] auto_in_aw_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input         auto_in_aw_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output        auto_in_w_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input         auto_in_w_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input  [63:0] auto_in_w_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input  [7:0]  auto_in_w_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input         auto_in_b_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output        auto_in_b_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output [3:0]  auto_in_b_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output [1:0]  auto_in_b_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output        auto_in_b_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output        auto_in_ar_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input         auto_in_ar_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input  [3:0]  auto_in_ar_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input  [27:0] auto_in_ar_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input         auto_in_ar_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  input         auto_in_r_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output        auto_in_r_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output [3:0]  auto_in_r_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output [63:0] auto_in_r_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output [1:0]  auto_in_r_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
  output        auto_in_r_bits_user // @[:boom.system.TestHarness.MegaBoomConfig.fir@328897.4]
);
  reg [7:0] mem_0 [0:33554431]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [31:0] _RAND_0;
  wire [7:0] mem_0__T_328_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_0__T_328_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [7:0] mem_0__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_0__T_291_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_0__T_291_mask; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_0__T_291_en; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [7:0] mem_1 [0:33554431]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [31:0] _RAND_1;
  wire [7:0] mem_1__T_328_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_1__T_328_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [7:0] mem_1__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_1__T_291_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_1__T_291_mask; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_1__T_291_en; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [7:0] mem_2 [0:33554431]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [31:0] _RAND_2;
  wire [7:0] mem_2__T_328_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_2__T_328_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [7:0] mem_2__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_2__T_291_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_2__T_291_mask; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_2__T_291_en; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [7:0] mem_3 [0:33554431]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [31:0] _RAND_3;
  wire [7:0] mem_3__T_328_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_3__T_328_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [7:0] mem_3__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_3__T_291_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_3__T_291_mask; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_3__T_291_en; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [7:0] mem_4 [0:33554431]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [31:0] _RAND_4;
  wire [7:0] mem_4__T_328_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_4__T_328_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [7:0] mem_4__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_4__T_291_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_4__T_291_mask; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_4__T_291_en; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [7:0] mem_5 [0:33554431]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [31:0] _RAND_5;
  wire [7:0] mem_5__T_328_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_5__T_328_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [7:0] mem_5__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_5__T_291_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_5__T_291_mask; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_5__T_291_en; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [7:0] mem_6 [0:33554431]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [31:0] _RAND_6;
  wire [7:0] mem_6__T_328_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_6__T_328_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [7:0] mem_6__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_6__T_291_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_6__T_291_mask; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_6__T_291_en; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [7:0] mem_7 [0:33554431]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  reg [31:0] _RAND_7;
  wire [7:0] mem_7__T_328_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_7__T_328_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [7:0] mem_7__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] mem_7__T_291_addr; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_7__T_291_mask; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire  mem_7__T_291_en; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  wire [24:0] _T_148; // @[SRAM.scala 37:49:boom.system.TestHarness.MegaBoomConfig.fir@328906.4]
  wire  _T_149; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328907.4]
  wire  _T_150; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328908.4]
  wire  _T_151; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328909.4]
  wire  _T_152; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328910.4]
  wire  _T_153; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328911.4]
  wire  _T_154; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328912.4]
  wire  _T_155; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328913.4]
  wire  _T_156; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328914.4]
  wire  _T_157; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328915.4]
  wire  _T_158; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328916.4]
  wire  _T_159; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328917.4]
  wire  _T_160; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328918.4]
  wire  _T_161; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328919.4]
  wire  _T_162; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328920.4]
  wire  _T_163; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328921.4]
  wire  _T_164; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328922.4]
  wire  _T_165; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328923.4]
  wire  _T_166; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328924.4]
  wire  _T_167; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328925.4]
  wire  _T_168; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328926.4]
  wire  _T_169; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328927.4]
  wire  _T_170; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328928.4]
  wire  _T_171; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328929.4]
  wire  _T_172; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328930.4]
  wire  _T_173; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328931.4]
  wire [1:0] _T_174; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328932.4]
  wire [2:0] _T_175; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328933.4]
  wire [1:0] _T_176; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328934.4]
  wire [2:0] _T_177; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328935.4]
  wire [5:0] _T_178; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328936.4]
  wire [1:0] _T_179; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328937.4]
  wire [2:0] _T_180; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328938.4]
  wire [1:0] _T_181; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328939.4]
  wire [2:0] _T_182; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328940.4]
  wire [5:0] _T_183; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328941.4]
  wire [11:0] _T_184; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328942.4]
  wire [1:0] _T_185; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328943.4]
  wire [2:0] _T_186; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328944.4]
  wire [1:0] _T_187; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328945.4]
  wire [2:0] _T_188; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328946.4]
  wire [5:0] _T_189; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328947.4]
  wire [1:0] _T_190; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328948.4]
  wire [2:0] _T_191; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328949.4]
  wire [1:0] _T_192; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328950.4]
  wire [1:0] _T_193; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328951.4]
  wire [3:0] _T_194; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328952.4]
  wire [6:0] _T_195; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328953.4]
  wire [12:0] _T_196; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328954.4]
  wire [24:0] r_addr; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328955.4]
  wire [24:0] _T_197; // @[SRAM.scala 38:49:boom.system.TestHarness.MegaBoomConfig.fir@328956.4]
  wire  _T_198; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328957.4]
  wire  _T_199; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328958.4]
  wire  _T_200; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328959.4]
  wire  _T_201; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328960.4]
  wire  _T_202; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328961.4]
  wire  _T_203; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328962.4]
  wire  _T_204; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328963.4]
  wire  _T_205; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328964.4]
  wire  _T_206; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328965.4]
  wire  _T_207; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328966.4]
  wire  _T_208; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328967.4]
  wire  _T_209; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328968.4]
  wire  _T_210; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328969.4]
  wire  _T_211; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328970.4]
  wire  _T_212; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328971.4]
  wire  _T_213; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328972.4]
  wire  _T_214; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328973.4]
  wire  _T_215; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328974.4]
  wire  _T_216; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328975.4]
  wire  _T_217; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328976.4]
  wire  _T_218; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328977.4]
  wire  _T_219; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328978.4]
  wire  _T_220; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328979.4]
  wire  _T_221; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328980.4]
  wire  _T_222; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328981.4]
  wire [1:0] _T_223; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328982.4]
  wire [2:0] _T_224; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328983.4]
  wire [1:0] _T_225; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328984.4]
  wire [2:0] _T_226; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328985.4]
  wire [5:0] _T_227; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328986.4]
  wire [1:0] _T_228; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328987.4]
  wire [2:0] _T_229; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328988.4]
  wire [1:0] _T_230; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328989.4]
  wire [2:0] _T_231; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328990.4]
  wire [5:0] _T_232; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328991.4]
  wire [11:0] _T_233; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328992.4]
  wire [1:0] _T_234; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328993.4]
  wire [2:0] _T_235; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328994.4]
  wire [1:0] _T_236; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328995.4]
  wire [2:0] _T_237; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328996.4]
  wire [5:0] _T_238; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328997.4]
  wire [1:0] _T_239; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328998.4]
  wire [2:0] _T_240; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328999.4]
  wire [1:0] _T_241; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329000.4]
  wire [1:0] _T_242; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329001.4]
  wire [3:0] _T_243; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329002.4]
  wire [6:0] _T_244; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329003.4]
  wire [12:0] _T_245; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329004.4]
  wire [28:0] _T_247; // @[Parameters.scala 121:49:boom.system.TestHarness.MegaBoomConfig.fir@329007.4]
  wire [28:0] _T_248; // @[Parameters.scala 121:52:boom.system.TestHarness.MegaBoomConfig.fir@329008.4]
  wire [28:0] _T_249; // @[Parameters.scala 121:52:boom.system.TestHarness.MegaBoomConfig.fir@329009.4]
  wire  r_sel0; // @[Parameters.scala 121:67:boom.system.TestHarness.MegaBoomConfig.fir@329010.4]
  wire [28:0] _T_251; // @[Parameters.scala 121:49:boom.system.TestHarness.MegaBoomConfig.fir@329012.4]
  wire [28:0] _T_252; // @[Parameters.scala 121:52:boom.system.TestHarness.MegaBoomConfig.fir@329013.4]
  wire [28:0] _T_253; // @[Parameters.scala 121:52:boom.system.TestHarness.MegaBoomConfig.fir@329014.4]
  wire  w_sel0; // @[Parameters.scala 121:67:boom.system.TestHarness.MegaBoomConfig.fir@329015.4]
  reg  w_full; // @[SRAM.scala 42:25:boom.system.TestHarness.MegaBoomConfig.fir@329016.4]
  reg [31:0] _RAND_8;
  reg [3:0] w_id; // @[SRAM.scala 43:21:boom.system.TestHarness.MegaBoomConfig.fir@329017.4]
  reg [31:0] _RAND_9;
  reg  w_user; // @[SRAM.scala 44:21:boom.system.TestHarness.MegaBoomConfig.fir@329018.4]
  reg [31:0] _RAND_10;
  reg  r_sel1; // @[SRAM.scala 45:21:boom.system.TestHarness.MegaBoomConfig.fir@329019.4]
  reg [31:0] _RAND_11;
  reg  w_sel1; // @[SRAM.scala 46:21:boom.system.TestHarness.MegaBoomConfig.fir@329020.4]
  reg [31:0] _RAND_12;
  wire  _T_257; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329021.4]
  wire  _T_311; // @[SRAM.scala 64:50:boom.system.TestHarness.MegaBoomConfig.fir@329091.4]
  wire  _T_312; // @[SRAM.scala 64:47:boom.system.TestHarness.MegaBoomConfig.fir@329092.4]
  wire  in_aw_ready; // @[SRAM.scala 64:32:boom.system.TestHarness.MegaBoomConfig.fir@329093.4]
  wire  _T_258; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329025.4]
  reg  r_full; // @[SRAM.scala 71:25:boom.system.TestHarness.MegaBoomConfig.fir@329103.4]
  reg [31:0] _RAND_13;
  reg [3:0] r_id; // @[SRAM.scala 72:21:boom.system.TestHarness.MegaBoomConfig.fir@329104.4]
  reg [31:0] _RAND_14;
  reg  r_user; // @[SRAM.scala 73:21:boom.system.TestHarness.MegaBoomConfig.fir@329105.4]
  reg [31:0] _RAND_15;
  wire  _T_321; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329106.4]
  wire  _T_445; // @[SRAM.scala 89:34:boom.system.TestHarness.MegaBoomConfig.fir@329145.4]
  wire  in_ar_ready; // @[SRAM.scala 89:31:boom.system.TestHarness.MegaBoomConfig.fir@329146.4]
  wire  _T_322; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329110.4]
  wire  _GEN_46; // @[package.scala 74:58:boom.system.TestHarness.MegaBoomConfig.fir@329124.4]
  reg  _T_349; // @[package.scala 74:91:boom.system.TestHarness.MegaBoomConfig.fir@329130.4]
  reg [31:0] _RAND_16;
  reg [7:0] _T_379_0; // @[Reg.scala 11:16:boom.system.TestHarness.MegaBoomConfig.fir@329132.4]
  reg [31:0] _RAND_17;
  reg [7:0] _T_379_1; // @[Reg.scala 11:16:boom.system.TestHarness.MegaBoomConfig.fir@329132.4]
  reg [31:0] _RAND_18;
  reg [7:0] _T_379_2; // @[Reg.scala 11:16:boom.system.TestHarness.MegaBoomConfig.fir@329132.4]
  reg [31:0] _RAND_19;
  reg [7:0] _T_379_3; // @[Reg.scala 11:16:boom.system.TestHarness.MegaBoomConfig.fir@329132.4]
  reg [31:0] _RAND_20;
  reg [7:0] _T_379_4; // @[Reg.scala 11:16:boom.system.TestHarness.MegaBoomConfig.fir@329132.4]
  reg [31:0] _RAND_21;
  reg [7:0] _T_379_5; // @[Reg.scala 11:16:boom.system.TestHarness.MegaBoomConfig.fir@329132.4]
  reg [31:0] _RAND_22;
  reg [7:0] _T_379_6; // @[Reg.scala 11:16:boom.system.TestHarness.MegaBoomConfig.fir@329132.4]
  reg [31:0] _RAND_23;
  reg [7:0] _T_379_7; // @[Reg.scala 11:16:boom.system.TestHarness.MegaBoomConfig.fir@329132.4]
  reg [31:0] _RAND_24;
  wire [7:0] _GEN_49; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  wire [7:0] _GEN_50; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  wire [7:0] _GEN_51; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  wire [7:0] _GEN_52; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  wire [7:0] _GEN_53; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  wire [7:0] _GEN_54; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  wire [7:0] _GEN_55; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  wire [7:0] _GEN_56; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  wire [15:0] _T_449; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329152.4]
  wire [15:0] _T_450; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329153.4]
  wire [31:0] _T_451; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329154.4]
  wire [15:0] _T_452; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329155.4]
  wire [15:0] _T_453; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329156.4]
  wire [31:0] _T_454; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329157.4]
  reg [24:0] mem_0__T_328_addr_pipe_0;
  reg [31:0] _RAND_25;
  reg [24:0] mem_1__T_328_addr_pipe_0;
  reg [31:0] _RAND_26;
  reg [24:0] mem_2__T_328_addr_pipe_0;
  reg [31:0] _RAND_27;
  reg [24:0] mem_3__T_328_addr_pipe_0;
  reg [31:0] _RAND_28;
  reg [24:0] mem_4__T_328_addr_pipe_0;
  reg [31:0] _RAND_29;
  reg [24:0] mem_5__T_328_addr_pipe_0;
  reg [31:0] _RAND_30;
  reg [24:0] mem_6__T_328_addr_pipe_0;
  reg [31:0] _RAND_31;
  reg [24:0] mem_7__T_328_addr_pipe_0;
  reg [31:0] _RAND_32;
  assign mem_0__T_328_addr = mem_0__T_328_addr_pipe_0;
  assign mem_0__T_328_data = mem_0[mem_0__T_328_addr]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  assign mem_0__T_291_data = auto_in_w_bits_data[7:0];
  assign mem_0__T_291_addr = {_T_245,_T_233};
  assign mem_0__T_291_mask = auto_in_w_bits_strb[0];
  assign mem_0__T_291_en = _T_258 & w_sel0;
  assign mem_1__T_328_addr = mem_1__T_328_addr_pipe_0;
  assign mem_1__T_328_data = mem_1[mem_1__T_328_addr]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  assign mem_1__T_291_data = auto_in_w_bits_data[15:8];
  assign mem_1__T_291_addr = {_T_245,_T_233};
  assign mem_1__T_291_mask = auto_in_w_bits_strb[1];
  assign mem_1__T_291_en = _T_258 & w_sel0;
  assign mem_2__T_328_addr = mem_2__T_328_addr_pipe_0;
  assign mem_2__T_328_data = mem_2[mem_2__T_328_addr]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  assign mem_2__T_291_data = auto_in_w_bits_data[23:16];
  assign mem_2__T_291_addr = {_T_245,_T_233};
  assign mem_2__T_291_mask = auto_in_w_bits_strb[2];
  assign mem_2__T_291_en = _T_258 & w_sel0;
  assign mem_3__T_328_addr = mem_3__T_328_addr_pipe_0;
  assign mem_3__T_328_data = mem_3[mem_3__T_328_addr]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  assign mem_3__T_291_data = auto_in_w_bits_data[31:24];
  assign mem_3__T_291_addr = {_T_245,_T_233};
  assign mem_3__T_291_mask = auto_in_w_bits_strb[3];
  assign mem_3__T_291_en = _T_258 & w_sel0;
  assign mem_4__T_328_addr = mem_4__T_328_addr_pipe_0;
  assign mem_4__T_328_data = mem_4[mem_4__T_328_addr]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  assign mem_4__T_291_data = auto_in_w_bits_data[39:32];
  assign mem_4__T_291_addr = {_T_245,_T_233};
  assign mem_4__T_291_mask = auto_in_w_bits_strb[4];
  assign mem_4__T_291_en = _T_258 & w_sel0;
  assign mem_5__T_328_addr = mem_5__T_328_addr_pipe_0;
  assign mem_5__T_328_data = mem_5[mem_5__T_328_addr]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  assign mem_5__T_291_data = auto_in_w_bits_data[47:40];
  assign mem_5__T_291_addr = {_T_245,_T_233};
  assign mem_5__T_291_mask = auto_in_w_bits_strb[5];
  assign mem_5__T_291_en = _T_258 & w_sel0;
  assign mem_6__T_328_addr = mem_6__T_328_addr_pipe_0;
  assign mem_6__T_328_data = mem_6[mem_6__T_328_addr]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  assign mem_6__T_291_data = auto_in_w_bits_data[55:48];
  assign mem_6__T_291_addr = {_T_245,_T_233};
  assign mem_6__T_291_mask = auto_in_w_bits_strb[6];
  assign mem_6__T_291_en = _T_258 & w_sel0;
  assign mem_7__T_328_addr = mem_7__T_328_addr_pipe_0;
  assign mem_7__T_328_data = mem_7[mem_7__T_328_addr]; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
  assign mem_7__T_291_data = auto_in_w_bits_data[63:56];
  assign mem_7__T_291_addr = {_T_245,_T_233};
  assign mem_7__T_291_mask = auto_in_w_bits_strb[7];
  assign mem_7__T_291_en = _T_258 & w_sel0;
  assign _T_148 = auto_in_ar_bits_addr[27:3]; // @[SRAM.scala 37:49:boom.system.TestHarness.MegaBoomConfig.fir@328906.4]
  assign _T_149 = _T_148[0]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328907.4]
  assign _T_150 = _T_148[1]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328908.4]
  assign _T_151 = _T_148[2]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328909.4]
  assign _T_152 = _T_148[3]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328910.4]
  assign _T_153 = _T_148[4]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328911.4]
  assign _T_154 = _T_148[5]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328912.4]
  assign _T_155 = _T_148[6]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328913.4]
  assign _T_156 = _T_148[7]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328914.4]
  assign _T_157 = _T_148[8]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328915.4]
  assign _T_158 = _T_148[9]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328916.4]
  assign _T_159 = _T_148[10]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328917.4]
  assign _T_160 = _T_148[11]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328918.4]
  assign _T_161 = _T_148[12]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328919.4]
  assign _T_162 = _T_148[13]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328920.4]
  assign _T_163 = _T_148[14]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328921.4]
  assign _T_164 = _T_148[15]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328922.4]
  assign _T_165 = _T_148[16]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328923.4]
  assign _T_166 = _T_148[17]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328924.4]
  assign _T_167 = _T_148[18]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328925.4]
  assign _T_168 = _T_148[19]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328926.4]
  assign _T_169 = _T_148[20]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328927.4]
  assign _T_170 = _T_148[21]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328928.4]
  assign _T_171 = _T_148[22]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328929.4]
  assign _T_172 = _T_148[23]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328930.4]
  assign _T_173 = _T_148[24]; // @[SRAM.scala 37:73:boom.system.TestHarness.MegaBoomConfig.fir@328931.4]
  assign _T_174 = {_T_151,_T_150}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328932.4]
  assign _T_175 = {_T_174,_T_149}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328933.4]
  assign _T_176 = {_T_154,_T_153}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328934.4]
  assign _T_177 = {_T_176,_T_152}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328935.4]
  assign _T_178 = {_T_177,_T_175}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328936.4]
  assign _T_179 = {_T_157,_T_156}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328937.4]
  assign _T_180 = {_T_179,_T_155}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328938.4]
  assign _T_181 = {_T_160,_T_159}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328939.4]
  assign _T_182 = {_T_181,_T_158}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328940.4]
  assign _T_183 = {_T_182,_T_180}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328941.4]
  assign _T_184 = {_T_183,_T_178}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328942.4]
  assign _T_185 = {_T_163,_T_162}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328943.4]
  assign _T_186 = {_T_185,_T_161}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328944.4]
  assign _T_187 = {_T_166,_T_165}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328945.4]
  assign _T_188 = {_T_187,_T_164}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328946.4]
  assign _T_189 = {_T_188,_T_186}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328947.4]
  assign _T_190 = {_T_169,_T_168}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328948.4]
  assign _T_191 = {_T_190,_T_167}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328949.4]
  assign _T_192 = {_T_171,_T_170}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328950.4]
  assign _T_193 = {_T_173,_T_172}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328951.4]
  assign _T_194 = {_T_193,_T_192}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328952.4]
  assign _T_195 = {_T_194,_T_191}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328953.4]
  assign _T_196 = {_T_195,_T_189}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328954.4]
  assign r_addr = {_T_196,_T_184}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328955.4]
  assign _T_197 = auto_in_aw_bits_addr[27:3]; // @[SRAM.scala 38:49:boom.system.TestHarness.MegaBoomConfig.fir@328956.4]
  assign _T_198 = _T_197[0]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328957.4]
  assign _T_199 = _T_197[1]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328958.4]
  assign _T_200 = _T_197[2]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328959.4]
  assign _T_201 = _T_197[3]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328960.4]
  assign _T_202 = _T_197[4]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328961.4]
  assign _T_203 = _T_197[5]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328962.4]
  assign _T_204 = _T_197[6]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328963.4]
  assign _T_205 = _T_197[7]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328964.4]
  assign _T_206 = _T_197[8]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328965.4]
  assign _T_207 = _T_197[9]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328966.4]
  assign _T_208 = _T_197[10]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328967.4]
  assign _T_209 = _T_197[11]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328968.4]
  assign _T_210 = _T_197[12]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328969.4]
  assign _T_211 = _T_197[13]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328970.4]
  assign _T_212 = _T_197[14]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328971.4]
  assign _T_213 = _T_197[15]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328972.4]
  assign _T_214 = _T_197[16]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328973.4]
  assign _T_215 = _T_197[17]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328974.4]
  assign _T_216 = _T_197[18]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328975.4]
  assign _T_217 = _T_197[19]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328976.4]
  assign _T_218 = _T_197[20]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328977.4]
  assign _T_219 = _T_197[21]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328978.4]
  assign _T_220 = _T_197[22]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328979.4]
  assign _T_221 = _T_197[23]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328980.4]
  assign _T_222 = _T_197[24]; // @[SRAM.scala 38:73:boom.system.TestHarness.MegaBoomConfig.fir@328981.4]
  assign _T_223 = {_T_200,_T_199}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328982.4]
  assign _T_224 = {_T_223,_T_198}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328983.4]
  assign _T_225 = {_T_203,_T_202}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328984.4]
  assign _T_226 = {_T_225,_T_201}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328985.4]
  assign _T_227 = {_T_226,_T_224}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328986.4]
  assign _T_228 = {_T_206,_T_205}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328987.4]
  assign _T_229 = {_T_228,_T_204}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328988.4]
  assign _T_230 = {_T_209,_T_208}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328989.4]
  assign _T_231 = {_T_230,_T_207}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328990.4]
  assign _T_232 = {_T_231,_T_229}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328991.4]
  assign _T_233 = {_T_232,_T_227}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328992.4]
  assign _T_234 = {_T_212,_T_211}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328993.4]
  assign _T_235 = {_T_234,_T_210}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328994.4]
  assign _T_236 = {_T_215,_T_214}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328995.4]
  assign _T_237 = {_T_236,_T_213}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328996.4]
  assign _T_238 = {_T_237,_T_235}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328997.4]
  assign _T_239 = {_T_218,_T_217}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328998.4]
  assign _T_240 = {_T_239,_T_216}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@328999.4]
  assign _T_241 = {_T_220,_T_219}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329000.4]
  assign _T_242 = {_T_222,_T_221}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329001.4]
  assign _T_243 = {_T_242,_T_241}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329002.4]
  assign _T_244 = {_T_243,_T_240}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329003.4]
  assign _T_245 = {_T_244,_T_238}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329004.4]
  assign _T_247 = {1'b0,$signed(auto_in_ar_bits_addr)}; // @[Parameters.scala 121:49:boom.system.TestHarness.MegaBoomConfig.fir@329007.4]
  assign _T_248 = $signed(_T_247) & $signed(-29'sh10000000); // @[Parameters.scala 121:52:boom.system.TestHarness.MegaBoomConfig.fir@329008.4]
  assign _T_249 = $signed(_T_248); // @[Parameters.scala 121:52:boom.system.TestHarness.MegaBoomConfig.fir@329009.4]
  assign r_sel0 = $signed(_T_249) == $signed(29'sh0); // @[Parameters.scala 121:67:boom.system.TestHarness.MegaBoomConfig.fir@329010.4]
  assign _T_251 = {1'b0,$signed(auto_in_aw_bits_addr)}; // @[Parameters.scala 121:49:boom.system.TestHarness.MegaBoomConfig.fir@329012.4]
  assign _T_252 = $signed(_T_251) & $signed(-29'sh10000000); // @[Parameters.scala 121:52:boom.system.TestHarness.MegaBoomConfig.fir@329013.4]
  assign _T_253 = $signed(_T_252); // @[Parameters.scala 121:52:boom.system.TestHarness.MegaBoomConfig.fir@329014.4]
  assign w_sel0 = $signed(_T_253) == $signed(29'sh0); // @[Parameters.scala 121:67:boom.system.TestHarness.MegaBoomConfig.fir@329015.4]
  assign _T_257 = auto_in_b_ready & w_full; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329021.4]
  assign _T_311 = w_full == 1'h0; // @[SRAM.scala 64:50:boom.system.TestHarness.MegaBoomConfig.fir@329091.4]
  assign _T_312 = auto_in_b_ready | _T_311; // @[SRAM.scala 64:47:boom.system.TestHarness.MegaBoomConfig.fir@329092.4]
  assign in_aw_ready = auto_in_w_valid & _T_312; // @[SRAM.scala 64:32:boom.system.TestHarness.MegaBoomConfig.fir@329093.4]
  assign _T_258 = in_aw_ready & auto_in_aw_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329025.4]
  assign _T_321 = auto_in_r_ready & r_full; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329106.4]
  assign _T_445 = r_full == 1'h0; // @[SRAM.scala 89:34:boom.system.TestHarness.MegaBoomConfig.fir@329145.4]
  assign in_ar_ready = auto_in_r_ready | _T_445; // @[SRAM.scala 89:31:boom.system.TestHarness.MegaBoomConfig.fir@329146.4]
  assign _T_322 = in_ar_ready & auto_in_ar_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329110.4]
  assign _GEN_46 = _T_322; // @[package.scala 74:58:boom.system.TestHarness.MegaBoomConfig.fir@329124.4]
  assign _GEN_49 = _T_349 ? mem_0__T_328_data : _T_379_0; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  assign _GEN_50 = _T_349 ? mem_1__T_328_data : _T_379_1; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  assign _GEN_51 = _T_349 ? mem_2__T_328_data : _T_379_2; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  assign _GEN_52 = _T_349 ? mem_3__T_328_data : _T_379_3; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  assign _GEN_53 = _T_349 ? mem_4__T_328_data : _T_379_4; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  assign _GEN_54 = _T_349 ? mem_5__T_328_data : _T_379_5; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  assign _GEN_55 = _T_349 ? mem_6__T_328_data : _T_379_6; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  assign _GEN_56 = _T_349 ? mem_7__T_328_data : _T_379_7; // @[Reg.scala 12:19:boom.system.TestHarness.MegaBoomConfig.fir@329133.4]
  assign _T_449 = {_GEN_50,_GEN_49}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329152.4]
  assign _T_450 = {_GEN_52,_GEN_51}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329153.4]
  assign _T_451 = {_T_450,_T_449}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329154.4]
  assign _T_452 = {_GEN_54,_GEN_53}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329155.4]
  assign _T_453 = {_GEN_56,_GEN_55}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329156.4]
  assign _T_454 = {_T_453,_T_452}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329157.4]
  assign auto_in_aw_ready = auto_in_w_valid & _T_312; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_w_ready = auto_in_aw_valid & _T_312; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_b_valid = w_full; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_b_bits_id = w_id; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_b_bits_resp = w_sel1 ? 2'h0 : 2'h3; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_b_bits_user = w_user; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_ar_ready = auto_in_r_ready | _T_445; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_r_valid = r_full; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_r_bits_id = r_id; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_r_bits_data = {_T_454,_T_451}; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_r_bits_resp = r_sel1 ? 2'h0 : 2'h3; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
  assign auto_in_r_bits_user = r_user; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@328904.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 33554432; initvar = initvar+1)
    mem_0[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 33554432; initvar = initvar+1)
    mem_1[initvar] = _RAND_1[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 33554432; initvar = initvar+1)
    mem_2[initvar] = _RAND_2[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 33554432; initvar = initvar+1)
    mem_3[initvar] = _RAND_3[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 33554432; initvar = initvar+1)
    mem_4[initvar] = _RAND_4[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_5 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 33554432; initvar = initvar+1)
    mem_5[initvar] = _RAND_5[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_6 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 33554432; initvar = initvar+1)
    mem_6[initvar] = _RAND_6[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_7 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 33554432; initvar = initvar+1)
    mem_7[initvar] = _RAND_7[7:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  w_full = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  w_id = _RAND_9[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  w_user = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  r_sel1 = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  w_sel1 = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  r_full = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  r_id = _RAND_14[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  r_user = _RAND_15[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_349 = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_379_0 = _RAND_17[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_379_1 = _RAND_18[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_379_2 = _RAND_19[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_379_3 = _RAND_20[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_379_4 = _RAND_21[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_379_5 = _RAND_22[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_379_6 = _RAND_23[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_24 = {1{`RANDOM}};
  _T_379_7 = _RAND_24[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_25 = {1{`RANDOM}};
  mem_0__T_328_addr_pipe_0 = _RAND_25[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_26 = {1{`RANDOM}};
  mem_1__T_328_addr_pipe_0 = _RAND_26[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_27 = {1{`RANDOM}};
  mem_2__T_328_addr_pipe_0 = _RAND_27[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_28 = {1{`RANDOM}};
  mem_3__T_328_addr_pipe_0 = _RAND_28[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_29 = {1{`RANDOM}};
  mem_4__T_328_addr_pipe_0 = _RAND_29[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_30 = {1{`RANDOM}};
  mem_5__T_328_addr_pipe_0 = _RAND_30[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_31 = {1{`RANDOM}};
  mem_6__T_328_addr_pipe_0 = _RAND_31[24:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_32 = {1{`RANDOM}};
  mem_7__T_328_addr_pipe_0 = _RAND_32[24:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(mem_0__T_291_en & mem_0__T_291_mask) begin
      mem_0[mem_0__T_291_addr] <= mem_0__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
    end
    if(mem_1__T_291_en & mem_1__T_291_mask) begin
      mem_1[mem_1__T_291_addr] <= mem_1__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
    end
    if(mem_2__T_291_en & mem_2__T_291_mask) begin
      mem_2[mem_2__T_291_addr] <= mem_2__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
    end
    if(mem_3__T_291_en & mem_3__T_291_mask) begin
      mem_3[mem_3__T_291_addr] <= mem_3__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
    end
    if(mem_4__T_291_en & mem_4__T_291_mask) begin
      mem_4[mem_4__T_291_addr] <= mem_4__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
    end
    if(mem_5__T_291_en & mem_5__T_291_mask) begin
      mem_5[mem_5__T_291_addr] <= mem_5__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
    end
    if(mem_6__T_291_en & mem_6__T_291_mask) begin
      mem_6[mem_6__T_291_addr] <= mem_6__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
    end
    if(mem_7__T_291_en & mem_7__T_291_mask) begin
      mem_7[mem_7__T_291_addr] <= mem_7__T_291_data; // @[DescribedSRAM.scala 23:21:boom.system.TestHarness.MegaBoomConfig.fir@328905.4]
    end
    if (reset) begin
      w_full <= 1'h0;
    end else begin
      if (_T_258) begin
        w_full <= 1'h1;
      end else begin
        if (_T_257) begin
          w_full <= 1'h0;
        end
      end
    end
    if (_T_258) begin
      w_id <= auto_in_aw_bits_id;
    end
    if (_T_258) begin
      w_user <= auto_in_aw_bits_user;
    end
    if (_T_322) begin
      r_sel1 <= r_sel0;
    end
    if (_T_258) begin
      w_sel1 <= w_sel0;
    end
    if (reset) begin
      r_full <= 1'h0;
    end else begin
      if (_T_322) begin
        r_full <= 1'h1;
      end else begin
        if (_T_321) begin
          r_full <= 1'h0;
        end
      end
    end
    if (_T_322) begin
      r_id <= auto_in_ar_bits_id;
    end
    if (_T_322) begin
      r_user <= auto_in_ar_bits_user;
    end
    _T_349 <= in_ar_ready & auto_in_ar_valid;
    if (_T_349) begin
      _T_379_0 <= mem_0__T_328_data;
    end
    if (_T_349) begin
      _T_379_1 <= mem_1__T_328_data;
    end
    if (_T_349) begin
      _T_379_2 <= mem_2__T_328_data;
    end
    if (_T_349) begin
      _T_379_3 <= mem_3__T_328_data;
    end
    if (_T_349) begin
      _T_379_4 <= mem_4__T_328_data;
    end
    if (_T_349) begin
      _T_379_5 <= mem_5__T_328_data;
    end
    if (_T_349) begin
      _T_379_6 <= mem_6__T_328_data;
    end
    if (_T_349) begin
      _T_379_7 <= mem_7__T_328_data;
    end
    if (_GEN_46) begin
      mem_0__T_328_addr_pipe_0 <= r_addr;
    end
    if (_GEN_46) begin
      mem_1__T_328_addr_pipe_0 <= r_addr;
    end
    if (_GEN_46) begin
      mem_2__T_328_addr_pipe_0 <= r_addr;
    end
    if (_GEN_46) begin
      mem_3__T_328_addr_pipe_0 <= r_addr;
    end
    if (_GEN_46) begin
      mem_4__T_328_addr_pipe_0 <= r_addr;
    end
    if (_GEN_46) begin
      mem_5__T_328_addr_pipe_0 <= r_addr;
    end
    if (_GEN_46) begin
      mem_6__T_328_addr_pipe_0 <= r_addr;
    end
    if (_GEN_46) begin
      mem_7__T_328_addr_pipe_0 <= r_addr;
    end
  end
endmodule
module Queue_126( // @[:boom.system.TestHarness.MegaBoomConfig.fir@329163.2]
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329164.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329165.4]
  output        io_enq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
  input         io_enq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
  input  [3:0]  io_enq_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
  input  [27:0] io_enq_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
  input         io_enq_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
  input         io_deq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
  output        io_deq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
  output [3:0]  io_deq_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
  output [27:0] io_deq_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
  output        io_deq_bits_user // @[:boom.system.TestHarness.MegaBoomConfig.fir@329166.4]
);
  reg [3:0] _T_35_id [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  reg [31:0] _RAND_0;
  wire [3:0] _T_35_id__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_id__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire [3:0] _T_35_id__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_id__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_id__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_id__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  reg [27:0] _T_35_addr [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  reg [31:0] _RAND_1;
  wire [27:0] _T_35_addr__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_addr__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire [27:0] _T_35_addr__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_addr__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_addr__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_addr__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  reg  _T_35_user [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  reg [31:0] _RAND_2;
  wire  _T_35_user__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_user__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_user__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_user__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_user__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  wire  _T_35_user__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  reg  value; // @[Counter.scala 26:33:boom.system.TestHarness.MegaBoomConfig.fir@329169.4]
  reg [31:0] _RAND_3;
  reg  value_1; // @[Counter.scala 26:33:boom.system.TestHarness.MegaBoomConfig.fir@329170.4]
  reg [31:0] _RAND_4;
  reg  _T_39; // @[Decoupled.scala 217:35:boom.system.TestHarness.MegaBoomConfig.fir@329171.4]
  reg [31:0] _RAND_5;
  wire  _T_40; // @[Decoupled.scala 219:41:boom.system.TestHarness.MegaBoomConfig.fir@329172.4]
  wire  _T_41; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@329173.4]
  wire  _T_42; // @[Decoupled.scala 220:33:boom.system.TestHarness.MegaBoomConfig.fir@329174.4]
  wire  _T_43; // @[Decoupled.scala 221:32:boom.system.TestHarness.MegaBoomConfig.fir@329175.4]
  wire  _T_44; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329176.4]
  wire  _T_47; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329179.4]
  wire  _T_52; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329196.6]
  wire  _T_54; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329202.6]
  wire  _T_55; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@329205.4]
  assign _T_35_id__T_58_addr = value_1;
  assign _T_35_id__T_58_data = _T_35_id[_T_35_id__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  assign _T_35_id__T_50_data = io_enq_bits_id;
  assign _T_35_id__T_50_addr = value;
  assign _T_35_id__T_50_mask = 1'h1;
  assign _T_35_id__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_addr__T_58_addr = value_1;
  assign _T_35_addr__T_58_data = _T_35_addr[_T_35_addr__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  assign _T_35_addr__T_50_data = io_enq_bits_addr;
  assign _T_35_addr__T_50_addr = value;
  assign _T_35_addr__T_50_mask = 1'h1;
  assign _T_35_addr__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_user__T_58_addr = value_1;
  assign _T_35_user__T_58_data = _T_35_user[_T_35_user__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
  assign _T_35_user__T_50_data = io_enq_bits_user;
  assign _T_35_user__T_50_addr = value;
  assign _T_35_user__T_50_mask = 1'h1;
  assign _T_35_user__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_40 = value == value_1; // @[Decoupled.scala 219:41:boom.system.TestHarness.MegaBoomConfig.fir@329172.4]
  assign _T_41 = _T_39 == 1'h0; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@329173.4]
  assign _T_42 = _T_40 & _T_41; // @[Decoupled.scala 220:33:boom.system.TestHarness.MegaBoomConfig.fir@329174.4]
  assign _T_43 = _T_40 & _T_39; // @[Decoupled.scala 221:32:boom.system.TestHarness.MegaBoomConfig.fir@329175.4]
  assign _T_44 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329176.4]
  assign _T_47 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329179.4]
  assign _T_52 = value + 1'h1; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329196.6]
  assign _T_54 = value_1 + 1'h1; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329202.6]
  assign _T_55 = _T_44 != _T_47; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@329205.4]
  assign io_enq_ready = _T_43 == 1'h0; // @[Decoupled.scala 237:16:boom.system.TestHarness.MegaBoomConfig.fir@329212.4]
  assign io_deq_valid = _T_42 == 1'h0; // @[Decoupled.scala 236:16:boom.system.TestHarness.MegaBoomConfig.fir@329210.4]
  assign io_deq_bits_id = _T_35_id__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329223.4]
  assign io_deq_bits_addr = _T_35_addr__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329222.4]
  assign io_deq_bits_user = _T_35_user__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329214.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_id[initvar] = _RAND_0[3:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_addr[initvar] = _RAND_1[27:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_user[initvar] = _RAND_2[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  value = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  value_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_39 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_id__T_50_en & _T_35_id__T_50_mask) begin
      _T_35_id[_T_35_id__T_50_addr] <= _T_35_id__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
    end
    if(_T_35_addr__T_50_en & _T_35_addr__T_50_mask) begin
      _T_35_addr[_T_35_addr__T_50_addr] <= _T_35_addr__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
    end
    if(_T_35_user__T_50_en & _T_35_user__T_50_mask) begin
      _T_35_user[_T_35_user__T_50_addr] <= _T_35_user__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329168.4]
    end
    if (reset) begin
      value <= 1'h0;
    end else begin
      if (_T_44) begin
        value <= _T_52;
      end
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else begin
      if (_T_47) begin
        value_1 <= _T_54;
      end
    end
    if (reset) begin
      _T_39 <= 1'h0;
    end else begin
      if (_T_55) begin
        _T_39 <= _T_44;
      end
    end
  end
endmodule
module Queue_128( // @[:boom.system.TestHarness.MegaBoomConfig.fir@329285.2]
  input        clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329286.4]
  input        reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329287.4]
  output       io_enq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
  input        io_enq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
  input  [3:0] io_enq_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
  input  [1:0] io_enq_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
  input        io_enq_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
  input        io_deq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
  output       io_deq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
  output [3:0] io_deq_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
  output [1:0] io_deq_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
  output       io_deq_bits_user // @[:boom.system.TestHarness.MegaBoomConfig.fir@329288.4]
);
  reg [3:0] _T_35_id [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  reg [31:0] _RAND_0;
  wire [3:0] _T_35_id__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_id__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire [3:0] _T_35_id__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_id__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_id__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_id__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  reg [1:0] _T_35_resp [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  reg [31:0] _RAND_1;
  wire [1:0] _T_35_resp__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_resp__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire [1:0] _T_35_resp__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_resp__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_resp__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_resp__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  reg  _T_35_user [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  reg [31:0] _RAND_2;
  wire  _T_35_user__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_user__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_user__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_user__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_user__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  wire  _T_35_user__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  reg  value; // @[Counter.scala 26:33:boom.system.TestHarness.MegaBoomConfig.fir@329291.4]
  reg [31:0] _RAND_3;
  reg  value_1; // @[Counter.scala 26:33:boom.system.TestHarness.MegaBoomConfig.fir@329292.4]
  reg [31:0] _RAND_4;
  reg  _T_39; // @[Decoupled.scala 217:35:boom.system.TestHarness.MegaBoomConfig.fir@329293.4]
  reg [31:0] _RAND_5;
  wire  _T_40; // @[Decoupled.scala 219:41:boom.system.TestHarness.MegaBoomConfig.fir@329294.4]
  wire  _T_41; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@329295.4]
  wire  _T_42; // @[Decoupled.scala 220:33:boom.system.TestHarness.MegaBoomConfig.fir@329296.4]
  wire  _T_43; // @[Decoupled.scala 221:32:boom.system.TestHarness.MegaBoomConfig.fir@329297.4]
  wire  _T_44; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329298.4]
  wire  _T_47; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329301.4]
  wire  _T_52; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329311.6]
  wire  _T_54; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329317.6]
  wire  _T_55; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@329320.4]
  assign _T_35_id__T_58_addr = value_1;
  assign _T_35_id__T_58_data = _T_35_id[_T_35_id__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  assign _T_35_id__T_50_data = io_enq_bits_id;
  assign _T_35_id__T_50_addr = value;
  assign _T_35_id__T_50_mask = 1'h1;
  assign _T_35_id__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_resp__T_58_addr = value_1;
  assign _T_35_resp__T_58_data = _T_35_resp[_T_35_resp__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  assign _T_35_resp__T_50_data = io_enq_bits_resp;
  assign _T_35_resp__T_50_addr = value;
  assign _T_35_resp__T_50_mask = 1'h1;
  assign _T_35_resp__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_user__T_58_addr = value_1;
  assign _T_35_user__T_58_data = _T_35_user[_T_35_user__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
  assign _T_35_user__T_50_data = io_enq_bits_user;
  assign _T_35_user__T_50_addr = value;
  assign _T_35_user__T_50_mask = 1'h1;
  assign _T_35_user__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_40 = value == value_1; // @[Decoupled.scala 219:41:boom.system.TestHarness.MegaBoomConfig.fir@329294.4]
  assign _T_41 = _T_39 == 1'h0; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@329295.4]
  assign _T_42 = _T_40 & _T_41; // @[Decoupled.scala 220:33:boom.system.TestHarness.MegaBoomConfig.fir@329296.4]
  assign _T_43 = _T_40 & _T_39; // @[Decoupled.scala 221:32:boom.system.TestHarness.MegaBoomConfig.fir@329297.4]
  assign _T_44 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329298.4]
  assign _T_47 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329301.4]
  assign _T_52 = value + 1'h1; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329311.6]
  assign _T_54 = value_1 + 1'h1; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329317.6]
  assign _T_55 = _T_44 != _T_47; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@329320.4]
  assign io_enq_ready = _T_43 == 1'h0; // @[Decoupled.scala 237:16:boom.system.TestHarness.MegaBoomConfig.fir@329327.4]
  assign io_deq_valid = _T_42 == 1'h0; // @[Decoupled.scala 236:16:boom.system.TestHarness.MegaBoomConfig.fir@329325.4]
  assign io_deq_bits_id = _T_35_id__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329331.4]
  assign io_deq_bits_resp = _T_35_resp__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329330.4]
  assign io_deq_bits_user = _T_35_user__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329329.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_id[initvar] = _RAND_0[3:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_resp[initvar] = _RAND_1[1:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_user[initvar] = _RAND_2[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  value = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  value_1 = _RAND_4[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_39 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_id__T_50_en & _T_35_id__T_50_mask) begin
      _T_35_id[_T_35_id__T_50_addr] <= _T_35_id__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
    end
    if(_T_35_resp__T_50_en & _T_35_resp__T_50_mask) begin
      _T_35_resp[_T_35_resp__T_50_addr] <= _T_35_resp__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
    end
    if(_T_35_user__T_50_en & _T_35_user__T_50_mask) begin
      _T_35_user[_T_35_user__T_50_addr] <= _T_35_user__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329290.4]
    end
    if (reset) begin
      value <= 1'h0;
    end else begin
      if (_T_44) begin
        value <= _T_52;
      end
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else begin
      if (_T_47) begin
        value_1 <= _T_54;
      end
    end
    if (reset) begin
      _T_39 <= 1'h0;
    end else begin
      if (_T_55) begin
        _T_39 <= _T_44;
      end
    end
  end
endmodule
module Queue_130( // @[:boom.system.TestHarness.MegaBoomConfig.fir@329407.2]
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329408.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329409.4]
  output        io_enq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  input         io_enq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  input  [3:0]  io_enq_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  input  [63:0] io_enq_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  input  [1:0]  io_enq_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  input         io_enq_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  input         io_deq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  output        io_deq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  output [3:0]  io_deq_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  output [63:0] io_deq_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  output [1:0]  io_deq_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  output        io_deq_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
  output        io_deq_bits_last // @[:boom.system.TestHarness.MegaBoomConfig.fir@329410.4]
);
  reg [3:0] _T_35_id [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg [31:0] _RAND_0;
  wire [3:0] _T_35_id__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_id__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire [3:0] _T_35_id__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_id__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_id__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_id__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg [63:0] _T_35_data [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg [63:0] _RAND_1;
  wire [63:0] _T_35_data__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_data__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire [63:0] _T_35_data__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_data__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_data__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_data__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg [1:0] _T_35_resp [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg [31:0] _RAND_2;
  wire [1:0] _T_35_resp__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_resp__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire [1:0] _T_35_resp__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_resp__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_resp__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_resp__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg  _T_35_user [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg [31:0] _RAND_3;
  wire  _T_35_user__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_user__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_user__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_user__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_user__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_user__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg  _T_35_last [0:1]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg [31:0] _RAND_4;
  wire  _T_35_last__T_58_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_last__T_58_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_last__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_last__T_50_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_last__T_50_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  wire  _T_35_last__T_50_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  reg  value; // @[Counter.scala 26:33:boom.system.TestHarness.MegaBoomConfig.fir@329413.4]
  reg [31:0] _RAND_5;
  reg  value_1; // @[Counter.scala 26:33:boom.system.TestHarness.MegaBoomConfig.fir@329414.4]
  reg [31:0] _RAND_6;
  reg  _T_39; // @[Decoupled.scala 217:35:boom.system.TestHarness.MegaBoomConfig.fir@329415.4]
  reg [31:0] _RAND_7;
  wire  _T_40; // @[Decoupled.scala 219:41:boom.system.TestHarness.MegaBoomConfig.fir@329416.4]
  wire  _T_41; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@329417.4]
  wire  _T_42; // @[Decoupled.scala 220:33:boom.system.TestHarness.MegaBoomConfig.fir@329418.4]
  wire  _T_43; // @[Decoupled.scala 221:32:boom.system.TestHarness.MegaBoomConfig.fir@329419.4]
  wire  _T_44; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329420.4]
  wire  _T_47; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329423.4]
  wire  _T_52; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329435.6]
  wire  _T_54; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329441.6]
  wire  _T_55; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@329444.4]
  assign _T_35_id__T_58_addr = value_1;
  assign _T_35_id__T_58_data = _T_35_id[_T_35_id__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  assign _T_35_id__T_50_data = io_enq_bits_id;
  assign _T_35_id__T_50_addr = value;
  assign _T_35_id__T_50_mask = 1'h1;
  assign _T_35_id__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_data__T_58_addr = value_1;
  assign _T_35_data__T_58_data = _T_35_data[_T_35_data__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  assign _T_35_data__T_50_data = io_enq_bits_data;
  assign _T_35_data__T_50_addr = value;
  assign _T_35_data__T_50_mask = 1'h1;
  assign _T_35_data__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_resp__T_58_addr = value_1;
  assign _T_35_resp__T_58_data = _T_35_resp[_T_35_resp__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  assign _T_35_resp__T_50_data = io_enq_bits_resp;
  assign _T_35_resp__T_50_addr = value;
  assign _T_35_resp__T_50_mask = 1'h1;
  assign _T_35_resp__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_user__T_58_addr = value_1;
  assign _T_35_user__T_58_data = _T_35_user[_T_35_user__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  assign _T_35_user__T_50_data = io_enq_bits_user;
  assign _T_35_user__T_50_addr = value;
  assign _T_35_user__T_50_mask = 1'h1;
  assign _T_35_user__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_35_last__T_58_addr = value_1;
  assign _T_35_last__T_58_data = _T_35_last[_T_35_last__T_58_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
  assign _T_35_last__T_50_data = 1'h1;
  assign _T_35_last__T_50_addr = value;
  assign _T_35_last__T_50_mask = 1'h1;
  assign _T_35_last__T_50_en = io_enq_ready & io_enq_valid;
  assign _T_40 = value == value_1; // @[Decoupled.scala 219:41:boom.system.TestHarness.MegaBoomConfig.fir@329416.4]
  assign _T_41 = _T_39 == 1'h0; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@329417.4]
  assign _T_42 = _T_40 & _T_41; // @[Decoupled.scala 220:33:boom.system.TestHarness.MegaBoomConfig.fir@329418.4]
  assign _T_43 = _T_40 & _T_39; // @[Decoupled.scala 221:32:boom.system.TestHarness.MegaBoomConfig.fir@329419.4]
  assign _T_44 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329420.4]
  assign _T_47 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329423.4]
  assign _T_52 = value + 1'h1; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329435.6]
  assign _T_54 = value_1 + 1'h1; // @[Counter.scala 35:22:boom.system.TestHarness.MegaBoomConfig.fir@329441.6]
  assign _T_55 = _T_44 != _T_47; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@329444.4]
  assign io_enq_ready = _T_43 == 1'h0; // @[Decoupled.scala 237:16:boom.system.TestHarness.MegaBoomConfig.fir@329451.4]
  assign io_deq_valid = _T_42 == 1'h0; // @[Decoupled.scala 236:16:boom.system.TestHarness.MegaBoomConfig.fir@329449.4]
  assign io_deq_bits_id = _T_35_id__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329457.4]
  assign io_deq_bits_data = _T_35_data__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329456.4]
  assign io_deq_bits_resp = _T_35_resp__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329455.4]
  assign io_deq_bits_user = _T_35_user__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329454.4]
  assign io_deq_bits_last = _T_35_last__T_58_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329453.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_id[initvar] = _RAND_0[3:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {2{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_data[initvar] = _RAND_1[63:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_resp[initvar] = _RAND_2[1:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_user[initvar] = _RAND_3[0:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 2; initvar = initvar+1)
    _T_35_last[initvar] = _RAND_4[0:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  value = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  value_1 = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_39 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_id__T_50_en & _T_35_id__T_50_mask) begin
      _T_35_id[_T_35_id__T_50_addr] <= _T_35_id__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
    end
    if(_T_35_data__T_50_en & _T_35_data__T_50_mask) begin
      _T_35_data[_T_35_data__T_50_addr] <= _T_35_data__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
    end
    if(_T_35_resp__T_50_en & _T_35_resp__T_50_mask) begin
      _T_35_resp[_T_35_resp__T_50_addr] <= _T_35_resp__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
    end
    if(_T_35_user__T_50_en & _T_35_user__T_50_mask) begin
      _T_35_user[_T_35_user__T_50_addr] <= _T_35_user__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
    end
    if(_T_35_last__T_50_en & _T_35_last__T_50_mask) begin
      _T_35_last[_T_35_last__T_50_addr] <= _T_35_last__T_50_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329412.4]
    end
    if (reset) begin
      value <= 1'h0;
    end else begin
      if (_T_44) begin
        value <= _T_52;
      end
    end
    if (reset) begin
      value_1 <= 1'h0;
    end else begin
      if (_T_47) begin
        value_1 <= _T_54;
      end
    end
    if (reset) begin
      _T_39 <= 1'h0;
    end else begin
      if (_T_55) begin
        _T_39 <= _T_44;
      end
    end
  end
endmodule
module AXI4Buffer_1( // @[:boom.system.TestHarness.MegaBoomConfig.fir@329465.2]
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329466.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329467.4]
  output        auto_in_aw_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_in_aw_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [3:0]  auto_in_aw_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [27:0] auto_in_aw_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_in_aw_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_in_w_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_in_w_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [63:0] auto_in_w_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [7:0]  auto_in_w_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_in_w_bits_last, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_in_b_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_in_b_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [3:0]  auto_in_b_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [1:0]  auto_in_b_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_in_b_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_in_ar_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_in_ar_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [3:0]  auto_in_ar_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [27:0] auto_in_ar_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_in_ar_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_in_r_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_in_r_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [3:0]  auto_in_r_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [63:0] auto_in_r_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [1:0]  auto_in_r_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_in_r_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_in_r_bits_last, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_out_aw_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_out_aw_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [3:0]  auto_out_aw_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [27:0] auto_out_aw_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_out_aw_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_out_w_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_out_w_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [63:0] auto_out_w_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [7:0]  auto_out_w_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_out_b_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_out_b_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [3:0]  auto_out_b_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [1:0]  auto_out_b_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_out_b_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_out_ar_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_out_ar_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [3:0]  auto_out_ar_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output [27:0] auto_out_ar_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_out_ar_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  output        auto_out_r_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_out_r_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [3:0]  auto_out_r_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [63:0] auto_out_r_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input  [1:0]  auto_out_r_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
  input         auto_out_r_bits_user // @[:boom.system.TestHarness.MegaBoomConfig.fir@329468.4]
);
  wire  Queue_clock; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire  Queue_reset; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire  Queue_io_enq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire  Queue_io_enq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire [3:0] Queue_io_enq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire [27:0] Queue_io_enq_bits_addr; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire  Queue_io_enq_bits_user; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire  Queue_io_deq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire  Queue_io_deq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire [3:0] Queue_io_deq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire [27:0] Queue_io_deq_bits_addr; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire  Queue_io_deq_bits_user; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
  wire  Queue_1_clock; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire  Queue_1_reset; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire  Queue_1_io_enq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire  Queue_1_io_enq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire [63:0] Queue_1_io_enq_bits_data; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire [7:0] Queue_1_io_enq_bits_strb; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire  Queue_1_io_enq_bits_last; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire  Queue_1_io_deq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire  Queue_1_io_deq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire [63:0] Queue_1_io_deq_bits_data; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire [7:0] Queue_1_io_deq_bits_strb; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire  Queue_1_io_deq_bits_last; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
  wire  Queue_2_clock; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire  Queue_2_reset; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire  Queue_2_io_enq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire  Queue_2_io_enq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire [3:0] Queue_2_io_enq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire [1:0] Queue_2_io_enq_bits_resp; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire  Queue_2_io_enq_bits_user; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire  Queue_2_io_deq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire  Queue_2_io_deq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire [3:0] Queue_2_io_deq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire [1:0] Queue_2_io_deq_bits_resp; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire  Queue_2_io_deq_bits_user; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
  wire  Queue_3_clock; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire  Queue_3_reset; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire  Queue_3_io_enq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire  Queue_3_io_enq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire [3:0] Queue_3_io_enq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire [27:0] Queue_3_io_enq_bits_addr; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire  Queue_3_io_enq_bits_user; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire  Queue_3_io_deq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire  Queue_3_io_deq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire [3:0] Queue_3_io_deq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire [27:0] Queue_3_io_deq_bits_addr; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire  Queue_3_io_deq_bits_user; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
  wire  Queue_4_clock; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire  Queue_4_reset; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire  Queue_4_io_enq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire  Queue_4_io_enq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire [3:0] Queue_4_io_enq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire [63:0] Queue_4_io_enq_bits_data; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire [1:0] Queue_4_io_enq_bits_resp; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire  Queue_4_io_enq_bits_user; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire  Queue_4_io_deq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire  Queue_4_io_deq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire [3:0] Queue_4_io_deq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire [63:0] Queue_4_io_deq_bits_data; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire [1:0] Queue_4_io_deq_bits_resp; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire  Queue_4_io_deq_bits_user; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  wire  Queue_4_io_deq_bits_last; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
  Queue_126 Queue ( // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329479.4]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_id(Queue_io_enq_bits_id),
    .io_enq_bits_addr(Queue_io_enq_bits_addr),
    .io_enq_bits_user(Queue_io_enq_bits_user),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_id(Queue_io_deq_bits_id),
    .io_deq_bits_addr(Queue_io_deq_bits_addr),
    .io_deq_bits_user(Queue_io_deq_bits_user)
  );
  Queue_3 Queue_1 ( // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329508.4]
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits_data(Queue_1_io_enq_bits_data),
    .io_enq_bits_strb(Queue_1_io_enq_bits_strb),
    .io_enq_bits_last(Queue_1_io_enq_bits_last),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits_data(Queue_1_io_deq_bits_data),
    .io_deq_bits_strb(Queue_1_io_deq_bits_strb),
    .io_deq_bits_last(Queue_1_io_deq_bits_last)
  );
  Queue_128 Queue_2 ( // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329523.4]
    .clock(Queue_2_clock),
    .reset(Queue_2_reset),
    .io_enq_ready(Queue_2_io_enq_ready),
    .io_enq_valid(Queue_2_io_enq_valid),
    .io_enq_bits_id(Queue_2_io_enq_bits_id),
    .io_enq_bits_resp(Queue_2_io_enq_bits_resp),
    .io_enq_bits_user(Queue_2_io_enq_bits_user),
    .io_deq_ready(Queue_2_io_deq_ready),
    .io_deq_valid(Queue_2_io_deq_valid),
    .io_deq_bits_id(Queue_2_io_deq_bits_id),
    .io_deq_bits_resp(Queue_2_io_deq_bits_resp),
    .io_deq_bits_user(Queue_2_io_deq_bits_user)
  );
  Queue_126 Queue_3 ( // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329538.4]
    .clock(Queue_3_clock),
    .reset(Queue_3_reset),
    .io_enq_ready(Queue_3_io_enq_ready),
    .io_enq_valid(Queue_3_io_enq_valid),
    .io_enq_bits_id(Queue_3_io_enq_bits_id),
    .io_enq_bits_addr(Queue_3_io_enq_bits_addr),
    .io_enq_bits_user(Queue_3_io_enq_bits_user),
    .io_deq_ready(Queue_3_io_deq_ready),
    .io_deq_valid(Queue_3_io_deq_valid),
    .io_deq_bits_id(Queue_3_io_deq_bits_id),
    .io_deq_bits_addr(Queue_3_io_deq_bits_addr),
    .io_deq_bits_user(Queue_3_io_deq_bits_user)
  );
  Queue_130 Queue_4 ( // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329567.4]
    .clock(Queue_4_clock),
    .reset(Queue_4_reset),
    .io_enq_ready(Queue_4_io_enq_ready),
    .io_enq_valid(Queue_4_io_enq_valid),
    .io_enq_bits_id(Queue_4_io_enq_bits_id),
    .io_enq_bits_data(Queue_4_io_enq_bits_data),
    .io_enq_bits_resp(Queue_4_io_enq_bits_resp),
    .io_enq_bits_user(Queue_4_io_enq_bits_user),
    .io_deq_ready(Queue_4_io_deq_ready),
    .io_deq_valid(Queue_4_io_deq_valid),
    .io_deq_bits_id(Queue_4_io_deq_bits_id),
    .io_deq_bits_data(Queue_4_io_deq_bits_data),
    .io_deq_bits_resp(Queue_4_io_deq_bits_resp),
    .io_deq_bits_user(Queue_4_io_deq_bits_user),
    .io_deq_bits_last(Queue_4_io_deq_bits_last)
  );
  assign auto_in_aw_ready = Queue_io_enq_ready; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_w_ready = Queue_1_io_enq_ready; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_b_valid = Queue_2_io_deq_valid; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_b_bits_id = Queue_2_io_deq_bits_id; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_b_bits_resp = Queue_2_io_deq_bits_resp; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_b_bits_user = Queue_2_io_deq_bits_user; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_ar_ready = Queue_3_io_enq_ready; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_r_valid = Queue_4_io_deq_valid; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_r_bits_id = Queue_4_io_deq_bits_id; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_r_bits_data = Queue_4_io_deq_bits_data; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_r_bits_resp = Queue_4_io_deq_bits_resp; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_r_bits_user = Queue_4_io_deq_bits_user; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_in_r_bits_last = Queue_4_io_deq_bits_last; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329478.4]
  assign auto_out_aw_valid = Queue_io_deq_valid; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_aw_bits_id = Queue_io_deq_bits_id; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_aw_bits_addr = Queue_io_deq_bits_addr; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_aw_bits_user = Queue_io_deq_bits_user; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_w_valid = Queue_1_io_deq_valid; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_w_bits_data = Queue_1_io_deq_bits_data; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_w_bits_strb = Queue_1_io_deq_bits_strb; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_b_ready = Queue_2_io_enq_ready; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_ar_valid = Queue_3_io_deq_valid; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_ar_bits_id = Queue_3_io_deq_bits_id; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_ar_bits_addr = Queue_3_io_deq_bits_addr; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_ar_bits_user = Queue_3_io_deq_bits_user; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign auto_out_r_ready = Queue_4_io_enq_ready; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329477.4]
  assign Queue_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329480.4]
  assign Queue_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329481.4]
  assign Queue_io_enq_valid = auto_in_aw_valid; // @[Decoupled.scala 294:22:boom.system.TestHarness.MegaBoomConfig.fir@329482.4]
  assign Queue_io_enq_bits_id = auto_in_aw_bits_id; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329492.4]
  assign Queue_io_enq_bits_addr = auto_in_aw_bits_addr; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329491.4]
  assign Queue_io_enq_bits_user = auto_in_aw_bits_user; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329483.4]
  assign Queue_io_deq_ready = auto_out_aw_ready; // @[Decoupled.scala 317:15:boom.system.TestHarness.MegaBoomConfig.fir@329506.4]
  assign Queue_1_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329509.4]
  assign Queue_1_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329510.4]
  assign Queue_1_io_enq_valid = auto_in_w_valid; // @[Decoupled.scala 294:22:boom.system.TestHarness.MegaBoomConfig.fir@329511.4]
  assign Queue_1_io_enq_bits_data = auto_in_w_bits_data; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329514.4]
  assign Queue_1_io_enq_bits_strb = auto_in_w_bits_strb; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329513.4]
  assign Queue_1_io_enq_bits_last = auto_in_w_bits_last; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329512.4]
  assign Queue_1_io_deq_ready = auto_out_w_ready; // @[Decoupled.scala 317:15:boom.system.TestHarness.MegaBoomConfig.fir@329521.4]
  assign Queue_2_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329524.4]
  assign Queue_2_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329525.4]
  assign Queue_2_io_enq_valid = auto_out_b_valid; // @[Decoupled.scala 294:22:boom.system.TestHarness.MegaBoomConfig.fir@329526.4]
  assign Queue_2_io_enq_bits_id = auto_out_b_bits_id; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329529.4]
  assign Queue_2_io_enq_bits_resp = auto_out_b_bits_resp; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329528.4]
  assign Queue_2_io_enq_bits_user = auto_out_b_bits_user; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329527.4]
  assign Queue_2_io_deq_ready = auto_in_b_ready; // @[Decoupled.scala 317:15:boom.system.TestHarness.MegaBoomConfig.fir@329536.4]
  assign Queue_3_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329539.4]
  assign Queue_3_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329540.4]
  assign Queue_3_io_enq_valid = auto_in_ar_valid; // @[Decoupled.scala 294:22:boom.system.TestHarness.MegaBoomConfig.fir@329541.4]
  assign Queue_3_io_enq_bits_id = auto_in_ar_bits_id; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329551.4]
  assign Queue_3_io_enq_bits_addr = auto_in_ar_bits_addr; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329550.4]
  assign Queue_3_io_enq_bits_user = auto_in_ar_bits_user; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329542.4]
  assign Queue_3_io_deq_ready = auto_out_ar_ready; // @[Decoupled.scala 317:15:boom.system.TestHarness.MegaBoomConfig.fir@329565.4]
  assign Queue_4_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329568.4]
  assign Queue_4_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329569.4]
  assign Queue_4_io_enq_valid = auto_out_r_valid; // @[Decoupled.scala 294:22:boom.system.TestHarness.MegaBoomConfig.fir@329570.4]
  assign Queue_4_io_enq_bits_id = auto_out_r_bits_id; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329575.4]
  assign Queue_4_io_enq_bits_data = auto_out_r_bits_data; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329574.4]
  assign Queue_4_io_enq_bits_resp = auto_out_r_bits_resp; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329573.4]
  assign Queue_4_io_enq_bits_user = auto_out_r_bits_user; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329572.4]
  assign Queue_4_io_deq_ready = auto_in_r_ready; // @[Decoupled.scala 317:15:boom.system.TestHarness.MegaBoomConfig.fir@329584.4]
endmodule
module Queue_131( // @[:boom.system.TestHarness.MegaBoomConfig.fir@329587.2]
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329588.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329589.4]
  output        io_enq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  input         io_enq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  input  [3:0]  io_enq_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  input  [27:0] io_enq_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  input  [7:0]  io_enq_bits_len, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  input  [2:0]  io_enq_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  input  [1:0]  io_enq_bits_burst, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  input         io_deq_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  output        io_deq_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  output [3:0]  io_deq_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  output [27:0] io_deq_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  output [7:0]  io_deq_bits_len, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  output [2:0]  io_deq_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
  output [1:0]  io_deq_bits_burst // @[:boom.system.TestHarness.MegaBoomConfig.fir@329590.4]
);
  reg [3:0] _T_35_id [0:0]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg [31:0] _RAND_0;
  wire [3:0] _T_35_id__T_52_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_id__T_52_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire [3:0] _T_35_id__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_id__T_48_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_id__T_48_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_id__T_48_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg [27:0] _T_35_addr [0:0]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg [31:0] _RAND_1;
  wire [27:0] _T_35_addr__T_52_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_addr__T_52_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire [27:0] _T_35_addr__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_addr__T_48_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_addr__T_48_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_addr__T_48_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg [7:0] _T_35_len [0:0]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg [31:0] _RAND_2;
  wire [7:0] _T_35_len__T_52_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_len__T_52_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire [7:0] _T_35_len__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_len__T_48_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_len__T_48_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_len__T_48_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg [2:0] _T_35_size [0:0]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg [31:0] _RAND_3;
  wire [2:0] _T_35_size__T_52_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_size__T_52_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire [2:0] _T_35_size__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_size__T_48_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_size__T_48_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_size__T_48_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg [1:0] _T_35_burst [0:0]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg [31:0] _RAND_4;
  wire [1:0] _T_35_burst__T_52_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_burst__T_52_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire [1:0] _T_35_burst__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_burst__T_48_addr; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_burst__T_48_mask; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  wire  _T_35_burst__T_48_en; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  reg  _T_37; // @[Decoupled.scala 217:35:boom.system.TestHarness.MegaBoomConfig.fir@329593.4]
  reg [31:0] _RAND_5;
  wire  _T_39; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@329595.4]
  wire  _T_42; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329598.4]
  wire  _T_45; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329601.4]
  wire  _GEN_15; // @[Decoupled.scala 245:27:boom.system.TestHarness.MegaBoomConfig.fir@329650.6]
  wire  _GEN_26; // @[Decoupled.scala 242:18:boom.system.TestHarness.MegaBoomConfig.fir@329639.4]
  wire  _GEN_25; // @[Decoupled.scala 242:18:boom.system.TestHarness.MegaBoomConfig.fir@329639.4]
  wire  _T_49; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@329618.4]
  wire  _T_50; // @[Decoupled.scala 236:19:boom.system.TestHarness.MegaBoomConfig.fir@329622.4]
  assign _T_35_id__T_52_addr = 1'h0;
  assign _T_35_id__T_52_data = _T_35_id[_T_35_id__T_52_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  assign _T_35_id__T_48_data = io_enq_bits_id;
  assign _T_35_id__T_48_addr = 1'h0;
  assign _T_35_id__T_48_mask = 1'h1;
  assign _T_35_id__T_48_en = _T_39 ? _GEN_15 : _T_42;
  assign _T_35_addr__T_52_addr = 1'h0;
  assign _T_35_addr__T_52_data = _T_35_addr[_T_35_addr__T_52_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  assign _T_35_addr__T_48_data = io_enq_bits_addr;
  assign _T_35_addr__T_48_addr = 1'h0;
  assign _T_35_addr__T_48_mask = 1'h1;
  assign _T_35_addr__T_48_en = _T_39 ? _GEN_15 : _T_42;
  assign _T_35_len__T_52_addr = 1'h0;
  assign _T_35_len__T_52_data = _T_35_len[_T_35_len__T_52_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  assign _T_35_len__T_48_data = io_enq_bits_len;
  assign _T_35_len__T_48_addr = 1'h0;
  assign _T_35_len__T_48_mask = 1'h1;
  assign _T_35_len__T_48_en = _T_39 ? _GEN_15 : _T_42;
  assign _T_35_size__T_52_addr = 1'h0;
  assign _T_35_size__T_52_data = _T_35_size[_T_35_size__T_52_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  assign _T_35_size__T_48_data = io_enq_bits_size;
  assign _T_35_size__T_48_addr = 1'h0;
  assign _T_35_size__T_48_mask = 1'h1;
  assign _T_35_size__T_48_en = _T_39 ? _GEN_15 : _T_42;
  assign _T_35_burst__T_52_addr = 1'h0;
  assign _T_35_burst__T_52_data = _T_35_burst[_T_35_burst__T_52_addr]; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
  assign _T_35_burst__T_48_data = io_enq_bits_burst;
  assign _T_35_burst__T_48_addr = 1'h0;
  assign _T_35_burst__T_48_mask = 1'h1;
  assign _T_35_burst__T_48_en = _T_39 ? _GEN_15 : _T_42;
  assign _T_39 = _T_37 == 1'h0; // @[Decoupled.scala 220:36:boom.system.TestHarness.MegaBoomConfig.fir@329595.4]
  assign _T_42 = io_enq_ready & io_enq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329598.4]
  assign _T_45 = io_deq_ready & io_deq_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329601.4]
  assign _GEN_15 = io_deq_ready ? 1'h0 : _T_42; // @[Decoupled.scala 245:27:boom.system.TestHarness.MegaBoomConfig.fir@329650.6]
  assign _GEN_26 = _T_39 ? _GEN_15 : _T_42; // @[Decoupled.scala 242:18:boom.system.TestHarness.MegaBoomConfig.fir@329639.4]
  assign _GEN_25 = _T_39 ? 1'h0 : _T_45; // @[Decoupled.scala 242:18:boom.system.TestHarness.MegaBoomConfig.fir@329639.4]
  assign _T_49 = _GEN_26 != _GEN_25; // @[Decoupled.scala 232:16:boom.system.TestHarness.MegaBoomConfig.fir@329618.4]
  assign _T_50 = _T_39 == 1'h0; // @[Decoupled.scala 236:19:boom.system.TestHarness.MegaBoomConfig.fir@329622.4]
  assign io_enq_ready = _T_37 == 1'h0; // @[Decoupled.scala 237:16:boom.system.TestHarness.MegaBoomConfig.fir@329625.4]
  assign io_deq_valid = io_enq_valid ? 1'h1 : _T_50; // @[Decoupled.scala 236:16:boom.system.TestHarness.MegaBoomConfig.fir@329623.4 Decoupled.scala 241:40:boom.system.TestHarness.MegaBoomConfig.fir@329637.6]
  assign io_deq_bits_id = _T_39 ? io_enq_bits_id : _T_35_id__T_52_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329635.4 Decoupled.scala 243:19:boom.system.TestHarness.MegaBoomConfig.fir@329648.6]
  assign io_deq_bits_addr = _T_39 ? io_enq_bits_addr : _T_35_addr__T_52_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329634.4 Decoupled.scala 243:19:boom.system.TestHarness.MegaBoomConfig.fir@329647.6]
  assign io_deq_bits_len = _T_39 ? io_enq_bits_len : _T_35_len__T_52_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329633.4 Decoupled.scala 243:19:boom.system.TestHarness.MegaBoomConfig.fir@329646.6]
  assign io_deq_bits_size = _T_39 ? io_enq_bits_size : _T_35_size__T_52_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329632.4 Decoupled.scala 243:19:boom.system.TestHarness.MegaBoomConfig.fir@329645.6]
  assign io_deq_bits_burst = _T_39 ? io_enq_bits_burst : _T_35_burst__T_52_data; // @[Decoupled.scala 238:15:boom.system.TestHarness.MegaBoomConfig.fir@329631.4 Decoupled.scala 243:19:boom.system.TestHarness.MegaBoomConfig.fir@329644.6]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_id[initvar] = _RAND_0[3:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_addr[initvar] = _RAND_1[27:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_2 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_len[initvar] = _RAND_2[7:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_3 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_size[initvar] = _RAND_3[2:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_4 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    _T_35_burst[initvar] = _RAND_4[1:0];
  `endif // RANDOMIZE_MEM_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_37 = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(_T_35_id__T_48_en & _T_35_id__T_48_mask) begin
      _T_35_id[_T_35_id__T_48_addr] <= _T_35_id__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
    end
    if(_T_35_addr__T_48_en & _T_35_addr__T_48_mask) begin
      _T_35_addr[_T_35_addr__T_48_addr] <= _T_35_addr__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
    end
    if(_T_35_len__T_48_en & _T_35_len__T_48_mask) begin
      _T_35_len[_T_35_len__T_48_addr] <= _T_35_len__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
    end
    if(_T_35_size__T_48_en & _T_35_size__T_48_mask) begin
      _T_35_size[_T_35_size__T_48_addr] <= _T_35_size__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
    end
    if(_T_35_burst__T_48_en & _T_35_burst__T_48_mask) begin
      _T_35_burst[_T_35_burst__T_48_addr] <= _T_35_burst__T_48_data; // @[Decoupled.scala 214:24:boom.system.TestHarness.MegaBoomConfig.fir@329592.4]
    end
    if (reset) begin
      _T_37 <= 1'h0;
    end else begin
      if (_T_49) begin
        if (_T_39) begin
          if (io_deq_ready) begin
            _T_37 <= 1'h0;
          end else begin
            _T_37 <= _T_42;
          end
        end else begin
          _T_37 <= _T_42;
        end
      end
    end
  end
endmodule
module AXI4Fragmenter_1( // @[:boom.system.TestHarness.MegaBoomConfig.fir@329791.2]
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329792.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329793.4]
  output        auto_in_aw_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_in_aw_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [3:0]  auto_in_aw_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [27:0] auto_in_aw_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [7:0]  auto_in_aw_bits_len, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [2:0]  auto_in_aw_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [1:0]  auto_in_aw_bits_burst, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_in_w_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_in_w_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [63:0] auto_in_w_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [7:0]  auto_in_w_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_in_w_bits_last, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_in_b_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_in_b_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [3:0]  auto_in_b_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [1:0]  auto_in_b_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_in_ar_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_in_ar_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [3:0]  auto_in_ar_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [27:0] auto_in_ar_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [7:0]  auto_in_ar_bits_len, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [2:0]  auto_in_ar_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [1:0]  auto_in_ar_bits_burst, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_in_r_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_in_r_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [3:0]  auto_in_r_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [63:0] auto_in_r_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [1:0]  auto_in_r_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_in_r_bits_last, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_out_aw_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_out_aw_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [3:0]  auto_out_aw_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [27:0] auto_out_aw_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_out_aw_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_out_w_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_out_w_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [63:0] auto_out_w_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [7:0]  auto_out_w_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_out_w_bits_last, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_out_b_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_out_b_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [3:0]  auto_out_b_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [1:0]  auto_out_b_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_out_b_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_out_ar_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_out_ar_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [3:0]  auto_out_ar_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output [27:0] auto_out_ar_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_out_ar_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  output        auto_out_r_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_out_r_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [3:0]  auto_out_r_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [63:0] auto_out_r_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input  [1:0]  auto_out_r_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_out_r_bits_user, // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
  input         auto_out_r_bits_last // @[:boom.system.TestHarness.MegaBoomConfig.fir@329794.4]
);
  wire  Queue_clock; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire  Queue_reset; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire  Queue_io_enq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire  Queue_io_enq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [3:0] Queue_io_enq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [27:0] Queue_io_enq_bits_addr; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [7:0] Queue_io_enq_bits_len; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [2:0] Queue_io_enq_bits_size; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [1:0] Queue_io_enq_bits_burst; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire  Queue_io_deq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire  Queue_io_deq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [3:0] Queue_io_deq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [27:0] Queue_io_deq_bits_addr; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [7:0] Queue_io_deq_bits_len; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [2:0] Queue_io_deq_bits_size; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire [1:0] Queue_io_deq_bits_burst; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
  wire  Queue_1_clock; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire  Queue_1_reset; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire  Queue_1_io_enq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire  Queue_1_io_enq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [3:0] Queue_1_io_enq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [27:0] Queue_1_io_enq_bits_addr; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [7:0] Queue_1_io_enq_bits_len; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [2:0] Queue_1_io_enq_bits_size; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [1:0] Queue_1_io_enq_bits_burst; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire  Queue_1_io_deq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire  Queue_1_io_deq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [3:0] Queue_1_io_deq_bits_id; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [27:0] Queue_1_io_deq_bits_addr; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [7:0] Queue_1_io_deq_bits_len; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [2:0] Queue_1_io_deq_bits_size; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire [1:0] Queue_1_io_deq_bits_burst; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
  wire  Queue_2_clock; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire  Queue_2_reset; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire  Queue_2_io_enq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire  Queue_2_io_enq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire [63:0] Queue_2_io_enq_bits_data; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire [7:0] Queue_2_io_enq_bits_strb; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire  Queue_2_io_enq_bits_last; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire  Queue_2_io_deq_ready; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire  Queue_2_io_deq_valid; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire [63:0] Queue_2_io_deq_bits_data; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire [7:0] Queue_2_io_deq_bits_strb; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  wire  Queue_2_io_deq_bits_last; // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
  reg  _T_234; // @[Fragmenter.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@329833.4]
  reg [31:0] _RAND_0;
  reg [27:0] _T_236; // @[Fragmenter.scala 59:25:boom.system.TestHarness.MegaBoomConfig.fir@329834.4]
  reg [31:0] _RAND_1;
  reg [7:0] _T_238; // @[Fragmenter.scala 60:25:boom.system.TestHarness.MegaBoomConfig.fir@329835.4]
  reg [31:0] _RAND_2;
  wire [7:0] _T_225_bits_len; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329826.4]
  wire [7:0] _T_239; // @[Fragmenter.scala 62:23:boom.system.TestHarness.MegaBoomConfig.fir@329836.4]
  wire [27:0] _T_225_bits_addr; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329827.4]
  wire [27:0] _T_240; // @[Fragmenter.scala 63:23:boom.system.TestHarness.MegaBoomConfig.fir@329837.4]
  wire [1:0] _T_225_bits_burst; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329824.4]
  wire  _T_283; // @[Fragmenter.scala 90:34:boom.system.TestHarness.MegaBoomConfig.fir@329880.4]
  wire [2:0] _T_225_bits_size; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329825.4]
  wire [8:0] _T_287; // @[package.scala 183:35:boom.system.TestHarness.MegaBoomConfig.fir@329884.4]
  wire [8:0] _T_288; // @[package.scala 183:40:boom.system.TestHarness.MegaBoomConfig.fir@329885.4]
  wire [15:0] _GEN_54; // @[Fragmenter.scala 98:38:boom.system.TestHarness.MegaBoomConfig.fir@329889.4]
  wire [15:0] _T_292; // @[Fragmenter.scala 98:38:boom.system.TestHarness.MegaBoomConfig.fir@329889.4]
  wire [27:0] _GEN_55; // @[Fragmenter.scala 98:29:boom.system.TestHarness.MegaBoomConfig.fir@329890.4]
  wire [27:0] _T_294; // @[Fragmenter.scala 98:29:boom.system.TestHarness.MegaBoomConfig.fir@329891.4]
  wire [15:0] _T_295; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329892.4]
  wire [22:0] _GEN_56; // @[Bundles.scala 29:21:boom.system.TestHarness.MegaBoomConfig.fir@329893.4]
  wire [22:0] _T_296; // @[Bundles.scala 29:21:boom.system.TestHarness.MegaBoomConfig.fir@329893.4]
  wire [14:0] _T_297; // @[Bundles.scala 29:30:boom.system.TestHarness.MegaBoomConfig.fir@329894.4]
  wire  _T_300; // @[Fragmenter.scala 101:28:boom.system.TestHarness.MegaBoomConfig.fir@329898.4]
  wire [27:0] _GEN_57; // @[Fragmenter.scala 102:33:boom.system.TestHarness.MegaBoomConfig.fir@329900.6]
  wire [27:0] _T_301; // @[Fragmenter.scala 102:33:boom.system.TestHarness.MegaBoomConfig.fir@329900.6]
  wire [27:0] _T_302; // @[Fragmenter.scala 102:49:boom.system.TestHarness.MegaBoomConfig.fir@329901.6]
  wire [27:0] _T_303; // @[Fragmenter.scala 102:62:boom.system.TestHarness.MegaBoomConfig.fir@329902.6]
  wire [27:0] _T_304; // @[Fragmenter.scala 102:47:boom.system.TestHarness.MegaBoomConfig.fir@329903.6]
  wire [27:0] _T_305; // @[Fragmenter.scala 102:45:boom.system.TestHarness.MegaBoomConfig.fir@329904.6]
  wire  _T_307; // @[Fragmenter.scala 108:27:boom.system.TestHarness.MegaBoomConfig.fir@329911.4]
  wire [27:0] _T_309; // @[Fragmenter.scala 120:28:boom.system.TestHarness.MegaBoomConfig.fir@329917.4]
  wire [9:0] _T_311; // @[package.scala 185:77:boom.system.TestHarness.MegaBoomConfig.fir@329919.4]
  wire [2:0] _T_312; // @[package.scala 185:82:boom.system.TestHarness.MegaBoomConfig.fir@329920.4]
  wire [2:0] _T_313; // @[package.scala 185:46:boom.system.TestHarness.MegaBoomConfig.fir@329921.4]
  wire [27:0] _GEN_59; // @[Fragmenter.scala 120:34:boom.system.TestHarness.MegaBoomConfig.fir@329922.4]
  wire [27:0] _T_314; // @[Fragmenter.scala 120:34:boom.system.TestHarness.MegaBoomConfig.fir@329922.4]
  wire  _T_225_valid; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 316:15:boom.system.TestHarness.MegaBoomConfig.fir@329829.4]
  wire  _T_316; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329925.4]
  wire  _T_317; // @[Fragmenter.scala 123:19:boom.system.TestHarness.MegaBoomConfig.fir@329927.6]
  wire [8:0] _GEN_60; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@329930.6]
  wire [9:0] _T_318; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@329930.6]
  wire [9:0] _T_319; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@329931.6]
  wire [8:0] _T_320; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@329932.6]
  wire [8:0] _GEN_4; // @[Fragmenter.scala 122:27:boom.system.TestHarness.MegaBoomConfig.fir@329926.4]
  reg  _T_334; // @[Fragmenter.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@329963.4]
  reg [31:0] _RAND_3;
  reg [27:0] _T_336; // @[Fragmenter.scala 59:25:boom.system.TestHarness.MegaBoomConfig.fir@329964.4]
  reg [31:0] _RAND_4;
  reg [7:0] _T_338; // @[Fragmenter.scala 60:25:boom.system.TestHarness.MegaBoomConfig.fir@329965.4]
  reg [31:0] _RAND_5;
  wire [7:0] _T_325_bits_len; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329956.4]
  wire [7:0] _T_339; // @[Fragmenter.scala 62:23:boom.system.TestHarness.MegaBoomConfig.fir@329966.4]
  wire [27:0] _T_325_bits_addr; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329957.4]
  wire [27:0] _T_340; // @[Fragmenter.scala 63:23:boom.system.TestHarness.MegaBoomConfig.fir@329967.4]
  wire [1:0] _T_325_bits_burst; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329954.4]
  wire  _T_383; // @[Fragmenter.scala 90:34:boom.system.TestHarness.MegaBoomConfig.fir@330010.4]
  wire [2:0] _T_325_bits_size; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329955.4]
  wire [15:0] _T_392; // @[Fragmenter.scala 98:38:boom.system.TestHarness.MegaBoomConfig.fir@330019.4]
  wire [27:0] _GEN_72; // @[Fragmenter.scala 98:29:boom.system.TestHarness.MegaBoomConfig.fir@330020.4]
  wire [27:0] _T_394; // @[Fragmenter.scala 98:29:boom.system.TestHarness.MegaBoomConfig.fir@330021.4]
  wire [15:0] _T_395; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@330022.4]
  wire [22:0] _GEN_73; // @[Bundles.scala 29:21:boom.system.TestHarness.MegaBoomConfig.fir@330023.4]
  wire [22:0] _T_396; // @[Bundles.scala 29:21:boom.system.TestHarness.MegaBoomConfig.fir@330023.4]
  wire [14:0] _T_397; // @[Bundles.scala 29:30:boom.system.TestHarness.MegaBoomConfig.fir@330024.4]
  wire  _T_400; // @[Fragmenter.scala 101:28:boom.system.TestHarness.MegaBoomConfig.fir@330028.4]
  wire [27:0] _GEN_74; // @[Fragmenter.scala 102:33:boom.system.TestHarness.MegaBoomConfig.fir@330030.6]
  wire [27:0] _T_401; // @[Fragmenter.scala 102:33:boom.system.TestHarness.MegaBoomConfig.fir@330030.6]
  wire [27:0] _T_402; // @[Fragmenter.scala 102:49:boom.system.TestHarness.MegaBoomConfig.fir@330031.6]
  wire [27:0] _T_403; // @[Fragmenter.scala 102:62:boom.system.TestHarness.MegaBoomConfig.fir@330032.6]
  wire [27:0] _T_404; // @[Fragmenter.scala 102:47:boom.system.TestHarness.MegaBoomConfig.fir@330033.6]
  wire [27:0] _T_405; // @[Fragmenter.scala 102:45:boom.system.TestHarness.MegaBoomConfig.fir@330034.6]
  wire  _T_407; // @[Fragmenter.scala 108:27:boom.system.TestHarness.MegaBoomConfig.fir@330041.4]
  reg [8:0] _T_444; // @[Fragmenter.scala 162:30:boom.system.TestHarness.MegaBoomConfig.fir@330105.4]
  reg [31:0] _RAND_6;
  wire  _T_445; // @[Fragmenter.scala 163:30:boom.system.TestHarness.MegaBoomConfig.fir@330106.4]
  reg  _T_430; // @[Fragmenter.scala 148:35:boom.system.TestHarness.MegaBoomConfig.fir@330081.4]
  reg [31:0] _RAND_7;
  wire  _T_439; // @[Fragmenter.scala 156:52:boom.system.TestHarness.MegaBoomConfig.fir@330097.4]
  wire  _T_440; // @[Fragmenter.scala 156:35:boom.system.TestHarness.MegaBoomConfig.fir@330098.4]
  wire [27:0] _T_409; // @[Fragmenter.scala 120:28:boom.system.TestHarness.MegaBoomConfig.fir@330047.4]
  wire [9:0] _T_411; // @[package.scala 185:77:boom.system.TestHarness.MegaBoomConfig.fir@330049.4]
  wire [2:0] _T_412; // @[package.scala 185:82:boom.system.TestHarness.MegaBoomConfig.fir@330050.4]
  wire [2:0] _T_413; // @[package.scala 185:46:boom.system.TestHarness.MegaBoomConfig.fir@330051.4]
  wire [27:0] _GEN_76; // @[Fragmenter.scala 120:34:boom.system.TestHarness.MegaBoomConfig.fir@330052.4]
  wire [27:0] _T_414; // @[Fragmenter.scala 120:34:boom.system.TestHarness.MegaBoomConfig.fir@330052.4]
  wire  _T_325_valid; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 316:15:boom.system.TestHarness.MegaBoomConfig.fir@329959.4]
  wire  _T_416; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@330055.4]
  wire  _T_417; // @[Fragmenter.scala 123:19:boom.system.TestHarness.MegaBoomConfig.fir@330057.6]
  wire [8:0] _GEN_77; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@330060.6]
  wire [9:0] _T_418; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@330060.6]
  wire [9:0] _T_419; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@330061.6]
  wire [8:0] _T_420; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@330062.6]
  wire [8:0] _GEN_9; // @[Fragmenter.scala 122:27:boom.system.TestHarness.MegaBoomConfig.fir@330056.4]
  wire  _T_441; // @[Fragmenter.scala 157:38:boom.system.TestHarness.MegaBoomConfig.fir@330100.4]
  wire  _T_442; // @[Fragmenter.scala 157:35:boom.system.TestHarness.MegaBoomConfig.fir@330101.4]
  wire  _T_435; // @[Fragmenter.scala 151:26:boom.system.TestHarness.MegaBoomConfig.fir@330086.4]
  wire  _T_438; // @[Fragmenter.scala 155:35:boom.system.TestHarness.MegaBoomConfig.fir@330095.4]
  wire  _T_436; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@330090.4]
  wire [8:0] _T_446; // @[Fragmenter.scala 164:35:boom.system.TestHarness.MegaBoomConfig.fir@330107.4]
  wire [8:0] _T_447; // @[Fragmenter.scala 164:23:boom.system.TestHarness.MegaBoomConfig.fir@330108.4]
  wire  _T_448; // @[Fragmenter.scala 165:27:boom.system.TestHarness.MegaBoomConfig.fir@330109.4]
  wire  _T_425_valid; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@330073.4 Decoupled.scala 316:15:boom.system.TestHarness.MegaBoomConfig.fir@330077.4]
  wire  _T_460; // @[Fragmenter.scala 171:37:boom.system.TestHarness.MegaBoomConfig.fir@330127.4]
  wire  _T_461; // @[Fragmenter.scala 171:51:boom.system.TestHarness.MegaBoomConfig.fir@330128.4]
  wire  _T_462; // @[Fragmenter.scala 171:33:boom.system.TestHarness.MegaBoomConfig.fir@330129.4]
  wire  _T_449; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@330110.4]
  wire [8:0] _GEN_78; // @[Fragmenter.scala 166:27:boom.system.TestHarness.MegaBoomConfig.fir@330111.4]
  wire [9:0] _T_450; // @[Fragmenter.scala 166:27:boom.system.TestHarness.MegaBoomConfig.fir@330111.4]
  wire [9:0] _T_451; // @[Fragmenter.scala 166:27:boom.system.TestHarness.MegaBoomConfig.fir@330112.4]
  wire [8:0] _T_452; // @[Fragmenter.scala 166:27:boom.system.TestHarness.MegaBoomConfig.fir@330113.4]
  wire  _T_454; // @[Fragmenter.scala 167:15:boom.system.TestHarness.MegaBoomConfig.fir@330116.4]
  wire  _T_455; // @[Fragmenter.scala 167:39:boom.system.TestHarness.MegaBoomConfig.fir@330117.4]
  wire  _T_456; // @[Fragmenter.scala 167:29:boom.system.TestHarness.MegaBoomConfig.fir@330118.4]
  wire  _T_458; // @[Fragmenter.scala 167:14:boom.system.TestHarness.MegaBoomConfig.fir@330120.4]
  wire  _T_459; // @[Fragmenter.scala 167:14:boom.system.TestHarness.MegaBoomConfig.fir@330121.4]
  wire  _T_466; // @[Fragmenter.scala 176:15:boom.system.TestHarness.MegaBoomConfig.fir@330137.4]
  wire  _T_425_bits_last; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@330073.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@330074.4]
  wire  _T_467; // @[Fragmenter.scala 176:31:boom.system.TestHarness.MegaBoomConfig.fir@330138.4]
  wire  _T_468; // @[Fragmenter.scala 176:28:boom.system.TestHarness.MegaBoomConfig.fir@330139.4]
  wire  _T_469; // @[Fragmenter.scala 176:47:boom.system.TestHarness.MegaBoomConfig.fir@330140.4]
  wire  _T_471; // @[Fragmenter.scala 176:14:boom.system.TestHarness.MegaBoomConfig.fir@330142.4]
  wire  _T_472; // @[Fragmenter.scala 176:14:boom.system.TestHarness.MegaBoomConfig.fir@330143.4]
  wire  _T_477; // @[Fragmenter.scala 188:36:boom.system.TestHarness.MegaBoomConfig.fir@330156.4]
  wire  _T_478; // @[Fragmenter.scala 188:33:boom.system.TestHarness.MegaBoomConfig.fir@330157.4]
  reg [1:0] _T_537_0; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_8;
  reg [1:0] _T_537_1; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_9;
  reg [1:0] _T_537_2; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_10;
  reg [1:0] _T_537_3; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_11;
  reg [1:0] _T_537_4; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_12;
  reg [1:0] _T_537_5; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_13;
  reg [1:0] _T_537_6; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_14;
  reg [1:0] _T_537_7; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_15;
  reg [1:0] _T_537_8; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_16;
  reg [1:0] _T_537_9; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_17;
  reg [1:0] _T_537_10; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_18;
  reg [1:0] _T_537_11; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_19;
  reg [1:0] _T_537_12; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_20;
  reg [1:0] _T_537_13; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_21;
  reg [1:0] _T_537_14; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_22;
  reg [1:0] _T_537_15; // @[Fragmenter.scala 192:26:boom.system.TestHarness.MegaBoomConfig.fir@330177.4]
  reg [31:0] _RAND_23;
  wire [1:0] _GEN_13; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_14; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_15; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_16; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_17; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_18; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_19; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_20; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_21; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_22; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_23; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_24; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_25; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_26; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [1:0] _GEN_27; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  wire [15:0] _T_595; // @[OneHot.scala 52:12:boom.system.TestHarness.MegaBoomConfig.fir@330181.4]
  wire  _T_597; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330183.4]
  wire  _T_598; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330184.4]
  wire  _T_599; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330185.4]
  wire  _T_600; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330186.4]
  wire  _T_601; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330187.4]
  wire  _T_602; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330188.4]
  wire  _T_603; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330189.4]
  wire  _T_604; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330190.4]
  wire  _T_605; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330191.4]
  wire  _T_606; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330192.4]
  wire  _T_607; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330193.4]
  wire  _T_608; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330194.4]
  wire  _T_609; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330195.4]
  wire  _T_610; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330196.4]
  wire  _T_611; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330197.4]
  wire  _T_612; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330198.4]
  wire  _T_613; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@330199.4]
  wire  _T_614; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330200.4]
  wire [1:0] _T_615; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330202.6]
  wire  _T_618; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330207.4]
  wire [1:0] _T_619; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330209.6]
  wire  _T_622; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330214.4]
  wire [1:0] _T_623; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330216.6]
  wire  _T_626; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330221.4]
  wire [1:0] _T_627; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330223.6]
  wire  _T_630; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330228.4]
  wire [1:0] _T_631; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330230.6]
  wire  _T_634; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330235.4]
  wire [1:0] _T_635; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330237.6]
  wire  _T_638; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330242.4]
  wire [1:0] _T_639; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330244.6]
  wire  _T_642; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330249.4]
  wire [1:0] _T_643; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330251.6]
  wire  _T_646; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330256.4]
  wire [1:0] _T_647; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330258.6]
  wire  _T_650; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330263.4]
  wire [1:0] _T_651; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330265.6]
  wire  _T_654; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330270.4]
  wire [1:0] _T_655; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330272.6]
  wire  _T_658; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330277.4]
  wire [1:0] _T_659; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330279.6]
  wire  _T_662; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330284.4]
  wire [1:0] _T_663; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330286.6]
  wire  _T_666; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330291.4]
  wire [1:0] _T_667; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330293.6]
  wire  _T_670; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330298.4]
  wire [1:0] _T_671; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330300.6]
  wire  _T_674; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330305.4]
  wire [1:0] _T_675; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330307.6]
  Queue_131 Queue ( // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329805.4]
    .clock(Queue_clock),
    .reset(Queue_reset),
    .io_enq_ready(Queue_io_enq_ready),
    .io_enq_valid(Queue_io_enq_valid),
    .io_enq_bits_id(Queue_io_enq_bits_id),
    .io_enq_bits_addr(Queue_io_enq_bits_addr),
    .io_enq_bits_len(Queue_io_enq_bits_len),
    .io_enq_bits_size(Queue_io_enq_bits_size),
    .io_enq_bits_burst(Queue_io_enq_bits_burst),
    .io_deq_ready(Queue_io_deq_ready),
    .io_deq_valid(Queue_io_deq_valid),
    .io_deq_bits_id(Queue_io_deq_bits_id),
    .io_deq_bits_addr(Queue_io_deq_bits_addr),
    .io_deq_bits_len(Queue_io_deq_bits_len),
    .io_deq_bits_size(Queue_io_deq_bits_size),
    .io_deq_bits_burst(Queue_io_deq_bits_burst)
  );
  Queue_131 Queue_1 ( // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@329935.4]
    .clock(Queue_1_clock),
    .reset(Queue_1_reset),
    .io_enq_ready(Queue_1_io_enq_ready),
    .io_enq_valid(Queue_1_io_enq_valid),
    .io_enq_bits_id(Queue_1_io_enq_bits_id),
    .io_enq_bits_addr(Queue_1_io_enq_bits_addr),
    .io_enq_bits_len(Queue_1_io_enq_bits_len),
    .io_enq_bits_size(Queue_1_io_enq_bits_size),
    .io_enq_bits_burst(Queue_1_io_enq_bits_burst),
    .io_deq_ready(Queue_1_io_deq_ready),
    .io_deq_valid(Queue_1_io_deq_valid),
    .io_deq_bits_id(Queue_1_io_deq_bits_id),
    .io_deq_bits_addr(Queue_1_io_deq_bits_addr),
    .io_deq_bits_len(Queue_1_io_deq_bits_len),
    .io_deq_bits_size(Queue_1_io_deq_bits_size),
    .io_deq_bits_burst(Queue_1_io_deq_bits_burst)
  );
  Queue_43 Queue_2 ( // @[Decoupled.scala 293:21:boom.system.TestHarness.MegaBoomConfig.fir@330065.4]
    .clock(Queue_2_clock),
    .reset(Queue_2_reset),
    .io_enq_ready(Queue_2_io_enq_ready),
    .io_enq_valid(Queue_2_io_enq_valid),
    .io_enq_bits_data(Queue_2_io_enq_bits_data),
    .io_enq_bits_strb(Queue_2_io_enq_bits_strb),
    .io_enq_bits_last(Queue_2_io_enq_bits_last),
    .io_deq_ready(Queue_2_io_deq_ready),
    .io_deq_valid(Queue_2_io_deq_valid),
    .io_deq_bits_data(Queue_2_io_deq_bits_data),
    .io_deq_bits_strb(Queue_2_io_deq_bits_strb),
    .io_deq_bits_last(Queue_2_io_deq_bits_last)
  );
  assign _T_225_bits_len = Queue_io_deq_bits_len; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329826.4]
  assign _T_239 = _T_234 ? _T_238 : _T_225_bits_len; // @[Fragmenter.scala 62:23:boom.system.TestHarness.MegaBoomConfig.fir@329836.4]
  assign _T_225_bits_addr = Queue_io_deq_bits_addr; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329827.4]
  assign _T_240 = _T_234 ? _T_236 : _T_225_bits_addr; // @[Fragmenter.scala 63:23:boom.system.TestHarness.MegaBoomConfig.fir@329837.4]
  assign _T_225_bits_burst = Queue_io_deq_bits_burst; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329824.4]
  assign _T_283 = _T_225_bits_burst == 2'h0; // @[Fragmenter.scala 90:34:boom.system.TestHarness.MegaBoomConfig.fir@329880.4]
  assign _T_225_bits_size = Queue_io_deq_bits_size; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329825.4]
  assign _T_287 = 9'h0 << 1; // @[package.scala 183:35:boom.system.TestHarness.MegaBoomConfig.fir@329884.4]
  assign _T_288 = _T_287 | 9'h1; // @[package.scala 183:40:boom.system.TestHarness.MegaBoomConfig.fir@329885.4]
  assign _GEN_54 = {{7'd0}, _T_288}; // @[Fragmenter.scala 98:38:boom.system.TestHarness.MegaBoomConfig.fir@329889.4]
  assign _T_292 = _GEN_54 << _T_225_bits_size; // @[Fragmenter.scala 98:38:boom.system.TestHarness.MegaBoomConfig.fir@329889.4]
  assign _GEN_55 = {{12'd0}, _T_292}; // @[Fragmenter.scala 98:29:boom.system.TestHarness.MegaBoomConfig.fir@329890.4]
  assign _T_294 = _T_240 + _GEN_55; // @[Fragmenter.scala 98:29:boom.system.TestHarness.MegaBoomConfig.fir@329891.4]
  assign _T_295 = {_T_225_bits_len,8'hff}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@329892.4]
  assign _GEN_56 = {{7'd0}, _T_295}; // @[Bundles.scala 29:21:boom.system.TestHarness.MegaBoomConfig.fir@329893.4]
  assign _T_296 = _GEN_56 << _T_225_bits_size; // @[Bundles.scala 29:21:boom.system.TestHarness.MegaBoomConfig.fir@329893.4]
  assign _T_297 = _T_296[22:8]; // @[Bundles.scala 29:30:boom.system.TestHarness.MegaBoomConfig.fir@329894.4]
  assign _T_300 = _T_225_bits_burst == 2'h2; // @[Fragmenter.scala 101:28:boom.system.TestHarness.MegaBoomConfig.fir@329898.4]
  assign _GEN_57 = {{13'd0}, _T_297}; // @[Fragmenter.scala 102:33:boom.system.TestHarness.MegaBoomConfig.fir@329900.6]
  assign _T_301 = _T_294 & _GEN_57; // @[Fragmenter.scala 102:33:boom.system.TestHarness.MegaBoomConfig.fir@329900.6]
  assign _T_302 = ~ _T_225_bits_addr; // @[Fragmenter.scala 102:49:boom.system.TestHarness.MegaBoomConfig.fir@329901.6]
  assign _T_303 = _T_302 | _GEN_57; // @[Fragmenter.scala 102:62:boom.system.TestHarness.MegaBoomConfig.fir@329902.6]
  assign _T_304 = ~ _T_303; // @[Fragmenter.scala 102:47:boom.system.TestHarness.MegaBoomConfig.fir@329903.6]
  assign _T_305 = _T_301 | _T_304; // @[Fragmenter.scala 102:45:boom.system.TestHarness.MegaBoomConfig.fir@329904.6]
  assign _T_307 = 8'h0 == _T_239; // @[Fragmenter.scala 108:27:boom.system.TestHarness.MegaBoomConfig.fir@329911.4]
  assign _T_309 = ~ _T_240; // @[Fragmenter.scala 120:28:boom.system.TestHarness.MegaBoomConfig.fir@329917.4]
  assign _T_311 = 10'h7 << _T_225_bits_size; // @[package.scala 185:77:boom.system.TestHarness.MegaBoomConfig.fir@329919.4]
  assign _T_312 = _T_311[2:0]; // @[package.scala 185:82:boom.system.TestHarness.MegaBoomConfig.fir@329920.4]
  assign _T_313 = ~ _T_312; // @[package.scala 185:46:boom.system.TestHarness.MegaBoomConfig.fir@329921.4]
  assign _GEN_59 = {{25'd0}, _T_313}; // @[Fragmenter.scala 120:34:boom.system.TestHarness.MegaBoomConfig.fir@329922.4]
  assign _T_314 = _T_309 | _GEN_59; // @[Fragmenter.scala 120:34:boom.system.TestHarness.MegaBoomConfig.fir@329922.4]
  assign _T_225_valid = Queue_io_deq_valid; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329819.4 Decoupled.scala 316:15:boom.system.TestHarness.MegaBoomConfig.fir@329829.4]
  assign _T_316 = auto_out_ar_ready & _T_225_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@329925.4]
  assign _T_317 = _T_307 == 1'h0; // @[Fragmenter.scala 123:19:boom.system.TestHarness.MegaBoomConfig.fir@329927.6]
  assign _GEN_60 = {{1'd0}, _T_239}; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@329930.6]
  assign _T_318 = _GEN_60 - _T_288; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@329930.6]
  assign _T_319 = $unsigned(_T_318); // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@329931.6]
  assign _T_320 = _T_319[8:0]; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@329932.6]
  assign _GEN_4 = _T_316 ? _T_320 : {{1'd0}, _T_238}; // @[Fragmenter.scala 122:27:boom.system.TestHarness.MegaBoomConfig.fir@329926.4]
  assign _T_325_bits_len = Queue_1_io_deq_bits_len; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329956.4]
  assign _T_339 = _T_334 ? _T_338 : _T_325_bits_len; // @[Fragmenter.scala 62:23:boom.system.TestHarness.MegaBoomConfig.fir@329966.4]
  assign _T_325_bits_addr = Queue_1_io_deq_bits_addr; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329957.4]
  assign _T_340 = _T_334 ? _T_336 : _T_325_bits_addr; // @[Fragmenter.scala 63:23:boom.system.TestHarness.MegaBoomConfig.fir@329967.4]
  assign _T_325_bits_burst = Queue_1_io_deq_bits_burst; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329954.4]
  assign _T_383 = _T_325_bits_burst == 2'h0; // @[Fragmenter.scala 90:34:boom.system.TestHarness.MegaBoomConfig.fir@330010.4]
  assign _T_325_bits_size = Queue_1_io_deq_bits_size; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@329955.4]
  assign _T_392 = _GEN_54 << _T_325_bits_size; // @[Fragmenter.scala 98:38:boom.system.TestHarness.MegaBoomConfig.fir@330019.4]
  assign _GEN_72 = {{12'd0}, _T_392}; // @[Fragmenter.scala 98:29:boom.system.TestHarness.MegaBoomConfig.fir@330020.4]
  assign _T_394 = _T_340 + _GEN_72; // @[Fragmenter.scala 98:29:boom.system.TestHarness.MegaBoomConfig.fir@330021.4]
  assign _T_395 = {_T_325_bits_len,8'hff}; // @[Cat.scala 30:58:boom.system.TestHarness.MegaBoomConfig.fir@330022.4]
  assign _GEN_73 = {{7'd0}, _T_395}; // @[Bundles.scala 29:21:boom.system.TestHarness.MegaBoomConfig.fir@330023.4]
  assign _T_396 = _GEN_73 << _T_325_bits_size; // @[Bundles.scala 29:21:boom.system.TestHarness.MegaBoomConfig.fir@330023.4]
  assign _T_397 = _T_396[22:8]; // @[Bundles.scala 29:30:boom.system.TestHarness.MegaBoomConfig.fir@330024.4]
  assign _T_400 = _T_325_bits_burst == 2'h2; // @[Fragmenter.scala 101:28:boom.system.TestHarness.MegaBoomConfig.fir@330028.4]
  assign _GEN_74 = {{13'd0}, _T_397}; // @[Fragmenter.scala 102:33:boom.system.TestHarness.MegaBoomConfig.fir@330030.6]
  assign _T_401 = _T_394 & _GEN_74; // @[Fragmenter.scala 102:33:boom.system.TestHarness.MegaBoomConfig.fir@330030.6]
  assign _T_402 = ~ _T_325_bits_addr; // @[Fragmenter.scala 102:49:boom.system.TestHarness.MegaBoomConfig.fir@330031.6]
  assign _T_403 = _T_402 | _GEN_74; // @[Fragmenter.scala 102:62:boom.system.TestHarness.MegaBoomConfig.fir@330032.6]
  assign _T_404 = ~ _T_403; // @[Fragmenter.scala 102:47:boom.system.TestHarness.MegaBoomConfig.fir@330033.6]
  assign _T_405 = _T_401 | _T_404; // @[Fragmenter.scala 102:45:boom.system.TestHarness.MegaBoomConfig.fir@330034.6]
  assign _T_407 = 8'h0 == _T_339; // @[Fragmenter.scala 108:27:boom.system.TestHarness.MegaBoomConfig.fir@330041.4]
  assign _T_445 = _T_444 == 9'h0; // @[Fragmenter.scala 163:30:boom.system.TestHarness.MegaBoomConfig.fir@330106.4]
  assign _T_439 = _T_445 | _T_430; // @[Fragmenter.scala 156:52:boom.system.TestHarness.MegaBoomConfig.fir@330097.4]
  assign _T_440 = auto_out_aw_ready & _T_439; // @[Fragmenter.scala 156:35:boom.system.TestHarness.MegaBoomConfig.fir@330098.4]
  assign _T_409 = ~ _T_340; // @[Fragmenter.scala 120:28:boom.system.TestHarness.MegaBoomConfig.fir@330047.4]
  assign _T_411 = 10'h7 << _T_325_bits_size; // @[package.scala 185:77:boom.system.TestHarness.MegaBoomConfig.fir@330049.4]
  assign _T_412 = _T_411[2:0]; // @[package.scala 185:82:boom.system.TestHarness.MegaBoomConfig.fir@330050.4]
  assign _T_413 = ~ _T_412; // @[package.scala 185:46:boom.system.TestHarness.MegaBoomConfig.fir@330051.4]
  assign _GEN_76 = {{25'd0}, _T_413}; // @[Fragmenter.scala 120:34:boom.system.TestHarness.MegaBoomConfig.fir@330052.4]
  assign _T_414 = _T_409 | _GEN_76; // @[Fragmenter.scala 120:34:boom.system.TestHarness.MegaBoomConfig.fir@330052.4]
  assign _T_325_valid = Queue_1_io_deq_valid; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@329949.4 Decoupled.scala 316:15:boom.system.TestHarness.MegaBoomConfig.fir@329959.4]
  assign _T_416 = _T_440 & _T_325_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@330055.4]
  assign _T_417 = _T_407 == 1'h0; // @[Fragmenter.scala 123:19:boom.system.TestHarness.MegaBoomConfig.fir@330057.6]
  assign _GEN_77 = {{1'd0}, _T_339}; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@330060.6]
  assign _T_418 = _GEN_77 - _T_288; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@330060.6]
  assign _T_419 = $unsigned(_T_418); // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@330061.6]
  assign _T_420 = _T_419[8:0]; // @[Fragmenter.scala 125:25:boom.system.TestHarness.MegaBoomConfig.fir@330062.6]
  assign _GEN_9 = _T_416 ? _T_420 : {{1'd0}, _T_338}; // @[Fragmenter.scala 122:27:boom.system.TestHarness.MegaBoomConfig.fir@330056.4]
  assign _T_441 = _T_430 == 1'h0; // @[Fragmenter.scala 157:38:boom.system.TestHarness.MegaBoomConfig.fir@330100.4]
  assign _T_442 = _T_325_valid & _T_441; // @[Fragmenter.scala 157:35:boom.system.TestHarness.MegaBoomConfig.fir@330101.4]
  assign _T_435 = _T_442 & _T_445; // @[Fragmenter.scala 151:26:boom.system.TestHarness.MegaBoomConfig.fir@330086.4]
  assign _T_438 = _T_325_valid & _T_439; // @[Fragmenter.scala 155:35:boom.system.TestHarness.MegaBoomConfig.fir@330095.4]
  assign _T_436 = auto_out_aw_ready & _T_438; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@330090.4]
  assign _T_446 = _T_442 ? _T_288 : 9'h0; // @[Fragmenter.scala 164:35:boom.system.TestHarness.MegaBoomConfig.fir@330107.4]
  assign _T_447 = _T_445 ? _T_446 : _T_444; // @[Fragmenter.scala 164:23:boom.system.TestHarness.MegaBoomConfig.fir@330108.4]
  assign _T_448 = _T_447 == 9'h1; // @[Fragmenter.scala 165:27:boom.system.TestHarness.MegaBoomConfig.fir@330109.4]
  assign _T_425_valid = Queue_2_io_deq_valid; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@330073.4 Decoupled.scala 316:15:boom.system.TestHarness.MegaBoomConfig.fir@330077.4]
  assign _T_460 = _T_445 == 1'h0; // @[Fragmenter.scala 171:37:boom.system.TestHarness.MegaBoomConfig.fir@330127.4]
  assign _T_461 = _T_460 | _T_442; // @[Fragmenter.scala 171:51:boom.system.TestHarness.MegaBoomConfig.fir@330128.4]
  assign _T_462 = _T_425_valid & _T_461; // @[Fragmenter.scala 171:33:boom.system.TestHarness.MegaBoomConfig.fir@330129.4]
  assign _T_449 = auto_out_w_ready & _T_462; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@330110.4]
  assign _GEN_78 = {{8'd0}, _T_449}; // @[Fragmenter.scala 166:27:boom.system.TestHarness.MegaBoomConfig.fir@330111.4]
  assign _T_450 = _T_447 - _GEN_78; // @[Fragmenter.scala 166:27:boom.system.TestHarness.MegaBoomConfig.fir@330111.4]
  assign _T_451 = $unsigned(_T_450); // @[Fragmenter.scala 166:27:boom.system.TestHarness.MegaBoomConfig.fir@330112.4]
  assign _T_452 = _T_451[8:0]; // @[Fragmenter.scala 166:27:boom.system.TestHarness.MegaBoomConfig.fir@330113.4]
  assign _T_454 = _T_449 == 1'h0; // @[Fragmenter.scala 167:15:boom.system.TestHarness.MegaBoomConfig.fir@330116.4]
  assign _T_455 = _T_447 != 9'h0; // @[Fragmenter.scala 167:39:boom.system.TestHarness.MegaBoomConfig.fir@330117.4]
  assign _T_456 = _T_454 | _T_455; // @[Fragmenter.scala 167:29:boom.system.TestHarness.MegaBoomConfig.fir@330118.4]
  assign _T_458 = _T_456 | reset; // @[Fragmenter.scala 167:14:boom.system.TestHarness.MegaBoomConfig.fir@330120.4]
  assign _T_459 = _T_458 == 1'h0; // @[Fragmenter.scala 167:14:boom.system.TestHarness.MegaBoomConfig.fir@330121.4]
  assign _T_466 = _T_462 == 1'h0; // @[Fragmenter.scala 176:15:boom.system.TestHarness.MegaBoomConfig.fir@330137.4]
  assign _T_425_bits_last = Queue_2_io_deq_bits_last; // @[Decoupled.scala 314:19:boom.system.TestHarness.MegaBoomConfig.fir@330073.4 Decoupled.scala 315:14:boom.system.TestHarness.MegaBoomConfig.fir@330074.4]
  assign _T_467 = _T_425_bits_last == 1'h0; // @[Fragmenter.scala 176:31:boom.system.TestHarness.MegaBoomConfig.fir@330138.4]
  assign _T_468 = _T_466 | _T_467; // @[Fragmenter.scala 176:28:boom.system.TestHarness.MegaBoomConfig.fir@330139.4]
  assign _T_469 = _T_468 | _T_448; // @[Fragmenter.scala 176:47:boom.system.TestHarness.MegaBoomConfig.fir@330140.4]
  assign _T_471 = _T_469 | reset; // @[Fragmenter.scala 176:14:boom.system.TestHarness.MegaBoomConfig.fir@330142.4]
  assign _T_472 = _T_471 == 1'h0; // @[Fragmenter.scala 176:14:boom.system.TestHarness.MegaBoomConfig.fir@330143.4]
  assign _T_477 = auto_out_b_bits_user == 1'h0; // @[Fragmenter.scala 188:36:boom.system.TestHarness.MegaBoomConfig.fir@330156.4]
  assign _T_478 = auto_in_b_ready | _T_477; // @[Fragmenter.scala 188:33:boom.system.TestHarness.MegaBoomConfig.fir@330157.4]
  assign _GEN_13 = 4'h1 == auto_out_b_bits_id ? _T_537_1 : _T_537_0; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_14 = 4'h2 == auto_out_b_bits_id ? _T_537_2 : _GEN_13; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_15 = 4'h3 == auto_out_b_bits_id ? _T_537_3 : _GEN_14; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_16 = 4'h4 == auto_out_b_bits_id ? _T_537_4 : _GEN_15; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_17 = 4'h5 == auto_out_b_bits_id ? _T_537_5 : _GEN_16; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_18 = 4'h6 == auto_out_b_bits_id ? _T_537_6 : _GEN_17; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_19 = 4'h7 == auto_out_b_bits_id ? _T_537_7 : _GEN_18; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_20 = 4'h8 == auto_out_b_bits_id ? _T_537_8 : _GEN_19; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_21 = 4'h9 == auto_out_b_bits_id ? _T_537_9 : _GEN_20; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_22 = 4'ha == auto_out_b_bits_id ? _T_537_10 : _GEN_21; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_23 = 4'hb == auto_out_b_bits_id ? _T_537_11 : _GEN_22; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_24 = 4'hc == auto_out_b_bits_id ? _T_537_12 : _GEN_23; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_25 = 4'hd == auto_out_b_bits_id ? _T_537_13 : _GEN_24; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_26 = 4'he == auto_out_b_bits_id ? _T_537_14 : _GEN_25; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _GEN_27 = 4'hf == auto_out_b_bits_id ? _T_537_15 : _GEN_26; // @[Fragmenter.scala 193:41:boom.system.TestHarness.MegaBoomConfig.fir@330178.4]
  assign _T_595 = 16'h1 << auto_out_b_bits_id; // @[OneHot.scala 52:12:boom.system.TestHarness.MegaBoomConfig.fir@330181.4]
  assign _T_597 = _T_595[0]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330183.4]
  assign _T_598 = _T_595[1]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330184.4]
  assign _T_599 = _T_595[2]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330185.4]
  assign _T_600 = _T_595[3]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330186.4]
  assign _T_601 = _T_595[4]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330187.4]
  assign _T_602 = _T_595[5]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330188.4]
  assign _T_603 = _T_595[6]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330189.4]
  assign _T_604 = _T_595[7]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330190.4]
  assign _T_605 = _T_595[8]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330191.4]
  assign _T_606 = _T_595[9]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330192.4]
  assign _T_607 = _T_595[10]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330193.4]
  assign _T_608 = _T_595[11]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330194.4]
  assign _T_609 = _T_595[12]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330195.4]
  assign _T_610 = _T_595[13]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330196.4]
  assign _T_611 = _T_595[14]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330197.4]
  assign _T_612 = _T_595[15]; // @[Fragmenter.scala 194:63:boom.system.TestHarness.MegaBoomConfig.fir@330198.4]
  assign _T_613 = _T_478 & auto_out_b_valid; // @[Decoupled.scala 37:37:boom.system.TestHarness.MegaBoomConfig.fir@330199.4]
  assign _T_614 = _T_597 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330200.4]
  assign _T_615 = _T_537_0 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330202.6]
  assign _T_618 = _T_598 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330207.4]
  assign _T_619 = _T_537_1 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330209.6]
  assign _T_622 = _T_599 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330214.4]
  assign _T_623 = _T_537_2 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330216.6]
  assign _T_626 = _T_600 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330221.4]
  assign _T_627 = _T_537_3 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330223.6]
  assign _T_630 = _T_601 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330228.4]
  assign _T_631 = _T_537_4 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330230.6]
  assign _T_634 = _T_602 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330235.4]
  assign _T_635 = _T_537_5 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330237.6]
  assign _T_638 = _T_603 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330242.4]
  assign _T_639 = _T_537_6 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330244.6]
  assign _T_642 = _T_604 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330249.4]
  assign _T_643 = _T_537_7 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330251.6]
  assign _T_646 = _T_605 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330256.4]
  assign _T_647 = _T_537_8 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330258.6]
  assign _T_650 = _T_606 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330263.4]
  assign _T_651 = _T_537_9 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330265.6]
  assign _T_654 = _T_607 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330270.4]
  assign _T_655 = _T_537_10 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330272.6]
  assign _T_658 = _T_608 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330277.4]
  assign _T_659 = _T_537_11 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330279.6]
  assign _T_662 = _T_609 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330284.4]
  assign _T_663 = _T_537_12 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330286.6]
  assign _T_666 = _T_610 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330291.4]
  assign _T_667 = _T_537_13 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330293.6]
  assign _T_670 = _T_611 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330298.4]
  assign _T_671 = _T_537_14 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330300.6]
  assign _T_674 = _T_612 & _T_613; // @[Fragmenter.scala 195:19:boom.system.TestHarness.MegaBoomConfig.fir@330305.4]
  assign _T_675 = _T_537_15 | auto_out_b_bits_resp; // @[Fragmenter.scala 195:70:boom.system.TestHarness.MegaBoomConfig.fir@330307.6]
  assign auto_in_aw_ready = Queue_1_io_enq_ready; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_w_ready = Queue_2_io_enq_ready; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_b_valid = auto_out_b_valid & auto_out_b_bits_user; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_b_bits_id = auto_out_b_bits_id; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_b_bits_resp = auto_out_b_bits_resp | _GEN_27; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_ar_ready = Queue_io_enq_ready; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_r_valid = auto_out_r_valid; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_r_bits_id = auto_out_r_bits_id; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_r_bits_data = auto_out_r_bits_data; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_r_bits_resp = auto_out_r_bits_resp; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_in_r_bits_last = auto_out_r_bits_last & auto_out_r_bits_user; // @[LazyModule.scala 173:31:boom.system.TestHarness.MegaBoomConfig.fir@329804.4]
  assign auto_out_aw_valid = _T_325_valid & _T_439; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_aw_bits_id = Queue_1_io_deq_bits_id; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_aw_bits_addr = ~ _T_414; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_aw_bits_user = 8'h0 == _T_339; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_w_valid = _T_425_valid & _T_461; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_w_bits_data = Queue_2_io_deq_bits_data; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_w_bits_strb = Queue_2_io_deq_bits_strb; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_w_bits_last = _T_447 == 9'h1; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_b_ready = auto_in_b_ready | _T_477; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_ar_valid = Queue_io_deq_valid; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_ar_bits_id = Queue_io_deq_bits_id; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_ar_bits_addr = ~ _T_314; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_ar_bits_user = 8'h0 == _T_239; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign auto_out_r_ready = auto_in_r_ready; // @[LazyModule.scala 173:49:boom.system.TestHarness.MegaBoomConfig.fir@329803.4]
  assign Queue_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329806.4]
  assign Queue_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329807.4]
  assign Queue_io_enq_valid = auto_in_ar_valid; // @[Decoupled.scala 294:22:boom.system.TestHarness.MegaBoomConfig.fir@329808.4]
  assign Queue_io_enq_bits_id = auto_in_ar_bits_id; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329817.4]
  assign Queue_io_enq_bits_addr = auto_in_ar_bits_addr; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329816.4]
  assign Queue_io_enq_bits_len = auto_in_ar_bits_len; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329815.4]
  assign Queue_io_enq_bits_size = auto_in_ar_bits_size; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329814.4]
  assign Queue_io_enq_bits_burst = auto_in_ar_bits_burst; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329813.4]
  assign Queue_io_deq_ready = auto_out_ar_ready & _T_307; // @[Decoupled.scala 317:15:boom.system.TestHarness.MegaBoomConfig.fir@329830.4]
  assign Queue_1_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329936.4]
  assign Queue_1_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@329937.4]
  assign Queue_1_io_enq_valid = auto_in_aw_valid; // @[Decoupled.scala 294:22:boom.system.TestHarness.MegaBoomConfig.fir@329938.4]
  assign Queue_1_io_enq_bits_id = auto_in_aw_bits_id; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329947.4]
  assign Queue_1_io_enq_bits_addr = auto_in_aw_bits_addr; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329946.4]
  assign Queue_1_io_enq_bits_len = auto_in_aw_bits_len; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329945.4]
  assign Queue_1_io_enq_bits_size = auto_in_aw_bits_size; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329944.4]
  assign Queue_1_io_enq_bits_burst = auto_in_aw_bits_burst; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@329943.4]
  assign Queue_1_io_deq_ready = _T_440 & _T_407; // @[Decoupled.scala 317:15:boom.system.TestHarness.MegaBoomConfig.fir@329960.4]
  assign Queue_2_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@330066.4]
  assign Queue_2_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@330067.4]
  assign Queue_2_io_enq_valid = auto_in_w_valid; // @[Decoupled.scala 294:22:boom.system.TestHarness.MegaBoomConfig.fir@330068.4]
  assign Queue_2_io_enq_bits_data = auto_in_w_bits_data; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@330071.4]
  assign Queue_2_io_enq_bits_strb = auto_in_w_bits_strb; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@330070.4]
  assign Queue_2_io_enq_bits_last = auto_in_w_bits_last; // @[Decoupled.scala 295:21:boom.system.TestHarness.MegaBoomConfig.fir@330069.4]
  assign Queue_2_io_deq_ready = auto_out_w_ready & _T_461; // @[Decoupled.scala 317:15:boom.system.TestHarness.MegaBoomConfig.fir@330078.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  _T_234 = _RAND_0[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  _T_236 = _RAND_1[27:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  _T_238 = _RAND_2[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  _T_334 = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  _T_336 = _RAND_4[27:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  _T_338 = _RAND_5[7:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  _T_444 = _RAND_6[8:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  _T_430 = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  _T_537_0 = _RAND_8[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  _T_537_1 = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  _T_537_2 = _RAND_10[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  _T_537_3 = _RAND_11[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  _T_537_4 = _RAND_12[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  _T_537_5 = _RAND_13[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  _T_537_6 = _RAND_14[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  _T_537_7 = _RAND_15[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  _T_537_8 = _RAND_16[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  _T_537_9 = _RAND_17[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  _T_537_10 = _RAND_18[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_19 = {1{`RANDOM}};
  _T_537_11 = _RAND_19[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_20 = {1{`RANDOM}};
  _T_537_12 = _RAND_20[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_21 = {1{`RANDOM}};
  _T_537_13 = _RAND_21[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_22 = {1{`RANDOM}};
  _T_537_14 = _RAND_22[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_23 = {1{`RANDOM}};
  _T_537_15 = _RAND_23[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      _T_234 <= 1'h0;
    end else begin
      if (_T_316) begin
        _T_234 <= _T_317;
      end
    end
    if (_T_316) begin
      if (_T_283) begin
        _T_236 <= _T_225_bits_addr;
      end else begin
        if (_T_300) begin
          _T_236 <= _T_305;
        end else begin
          _T_236 <= _T_294;
        end
      end
    end
    _T_238 <= _GEN_4[7:0];
    if (reset) begin
      _T_334 <= 1'h0;
    end else begin
      if (_T_416) begin
        _T_334 <= _T_417;
      end
    end
    if (_T_416) begin
      if (_T_383) begin
        _T_336 <= _T_325_bits_addr;
      end else begin
        if (_T_400) begin
          _T_336 <= _T_405;
        end else begin
          _T_336 <= _T_394;
        end
      end
    end
    _T_338 <= _GEN_9[7:0];
    if (reset) begin
      _T_444 <= 9'h0;
    end else begin
      _T_444 <= _T_452;
    end
    if (reset) begin
      _T_430 <= 1'h0;
    end else begin
      if (_T_436) begin
        _T_430 <= 1'h0;
      end else begin
        if (_T_435) begin
          _T_430 <= 1'h1;
        end
      end
    end
    if (reset) begin
      _T_537_0 <= 2'h0;
    end else begin
      if (_T_614) begin
        if (auto_out_b_bits_user) begin
          _T_537_0 <= 2'h0;
        end else begin
          _T_537_0 <= _T_615;
        end
      end
    end
    if (reset) begin
      _T_537_1 <= 2'h0;
    end else begin
      if (_T_618) begin
        if (auto_out_b_bits_user) begin
          _T_537_1 <= 2'h0;
        end else begin
          _T_537_1 <= _T_619;
        end
      end
    end
    if (reset) begin
      _T_537_2 <= 2'h0;
    end else begin
      if (_T_622) begin
        if (auto_out_b_bits_user) begin
          _T_537_2 <= 2'h0;
        end else begin
          _T_537_2 <= _T_623;
        end
      end
    end
    if (reset) begin
      _T_537_3 <= 2'h0;
    end else begin
      if (_T_626) begin
        if (auto_out_b_bits_user) begin
          _T_537_3 <= 2'h0;
        end else begin
          _T_537_3 <= _T_627;
        end
      end
    end
    if (reset) begin
      _T_537_4 <= 2'h0;
    end else begin
      if (_T_630) begin
        if (auto_out_b_bits_user) begin
          _T_537_4 <= 2'h0;
        end else begin
          _T_537_4 <= _T_631;
        end
      end
    end
    if (reset) begin
      _T_537_5 <= 2'h0;
    end else begin
      if (_T_634) begin
        if (auto_out_b_bits_user) begin
          _T_537_5 <= 2'h0;
        end else begin
          _T_537_5 <= _T_635;
        end
      end
    end
    if (reset) begin
      _T_537_6 <= 2'h0;
    end else begin
      if (_T_638) begin
        if (auto_out_b_bits_user) begin
          _T_537_6 <= 2'h0;
        end else begin
          _T_537_6 <= _T_639;
        end
      end
    end
    if (reset) begin
      _T_537_7 <= 2'h0;
    end else begin
      if (_T_642) begin
        if (auto_out_b_bits_user) begin
          _T_537_7 <= 2'h0;
        end else begin
          _T_537_7 <= _T_643;
        end
      end
    end
    if (reset) begin
      _T_537_8 <= 2'h0;
    end else begin
      if (_T_646) begin
        if (auto_out_b_bits_user) begin
          _T_537_8 <= 2'h0;
        end else begin
          _T_537_8 <= _T_647;
        end
      end
    end
    if (reset) begin
      _T_537_9 <= 2'h0;
    end else begin
      if (_T_650) begin
        if (auto_out_b_bits_user) begin
          _T_537_9 <= 2'h0;
        end else begin
          _T_537_9 <= _T_651;
        end
      end
    end
    if (reset) begin
      _T_537_10 <= 2'h0;
    end else begin
      if (_T_654) begin
        if (auto_out_b_bits_user) begin
          _T_537_10 <= 2'h0;
        end else begin
          _T_537_10 <= _T_655;
        end
      end
    end
    if (reset) begin
      _T_537_11 <= 2'h0;
    end else begin
      if (_T_658) begin
        if (auto_out_b_bits_user) begin
          _T_537_11 <= 2'h0;
        end else begin
          _T_537_11 <= _T_659;
        end
      end
    end
    if (reset) begin
      _T_537_12 <= 2'h0;
    end else begin
      if (_T_662) begin
        if (auto_out_b_bits_user) begin
          _T_537_12 <= 2'h0;
        end else begin
          _T_537_12 <= _T_663;
        end
      end
    end
    if (reset) begin
      _T_537_13 <= 2'h0;
    end else begin
      if (_T_666) begin
        if (auto_out_b_bits_user) begin
          _T_537_13 <= 2'h0;
        end else begin
          _T_537_13 <= _T_667;
        end
      end
    end
    if (reset) begin
      _T_537_14 <= 2'h0;
    end else begin
      if (_T_670) begin
        if (auto_out_b_bits_user) begin
          _T_537_14 <= 2'h0;
        end else begin
          _T_537_14 <= _T_671;
        end
      end
    end
    if (reset) begin
      _T_537_15 <= 2'h0;
    end else begin
      if (_T_674) begin
        if (auto_out_b_bits_user) begin
          _T_537_15 <= 2'h0;
        end else begin
          _T_537_15 <= _T_675;
        end
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_459) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:167 assert (!out.w.fire() || w_todo =/= UInt(0)) // underflow impossible\n"); // @[Fragmenter.scala 167:14:boom.system.TestHarness.MegaBoomConfig.fir@330123.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_459) begin
          $fatal; // @[Fragmenter.scala 167:14:boom.system.TestHarness.MegaBoomConfig.fir@330124.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (_T_472) begin
          $fwrite(32'h80000002,"Assertion failed\n    at Fragmenter.scala:176 assert (!out.w.valid || !in_w.bits.last || w_last)\n"); // @[Fragmenter.scala 176:14:boom.system.TestHarness.MegaBoomConfig.fir@330145.6]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (_T_472) begin
          $fatal; // @[Fragmenter.scala 176:14:boom.system.TestHarness.MegaBoomConfig.fir@330146.6]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module SimAXIMem( // @[:boom.system.TestHarness.MegaBoomConfig.fir@330312.2]
  input         clock, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330313.4]
  input         reset, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330314.4]
  output        io_axi4_0_aw_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input         io_axi4_0_aw_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [3:0]  io_axi4_0_aw_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [27:0] io_axi4_0_aw_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [7:0]  io_axi4_0_aw_bits_len, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [2:0]  io_axi4_0_aw_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [1:0]  io_axi4_0_aw_bits_burst, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output        io_axi4_0_w_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input         io_axi4_0_w_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [63:0] io_axi4_0_w_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [7:0]  io_axi4_0_w_bits_strb, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input         io_axi4_0_w_bits_last, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input         io_axi4_0_b_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output        io_axi4_0_b_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output [3:0]  io_axi4_0_b_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output [1:0]  io_axi4_0_b_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output        io_axi4_0_ar_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input         io_axi4_0_ar_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [3:0]  io_axi4_0_ar_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [27:0] io_axi4_0_ar_bits_addr, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [7:0]  io_axi4_0_ar_bits_len, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [2:0]  io_axi4_0_ar_bits_size, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input  [1:0]  io_axi4_0_ar_bits_burst, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  input         io_axi4_0_r_ready, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output        io_axi4_0_r_valid, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output [3:0]  io_axi4_0_r_bits_id, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output [63:0] io_axi4_0_r_bits_data, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output [1:0]  io_axi4_0_r_bits_resp, // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
  output        io_axi4_0_r_bits_last // @[:boom.system.TestHarness.MegaBoomConfig.fir@330316.4]
);
  wire  sram_clock; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_reset; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_aw_ready; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_aw_valid; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [3:0] sram_auto_in_aw_bits_id; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [27:0] sram_auto_in_aw_bits_addr; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_aw_bits_user; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_w_ready; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_w_valid; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [63:0] sram_auto_in_w_bits_data; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [7:0] sram_auto_in_w_bits_strb; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_b_ready; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_b_valid; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [3:0] sram_auto_in_b_bits_id; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [1:0] sram_auto_in_b_bits_resp; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_b_bits_user; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_ar_ready; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_ar_valid; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [3:0] sram_auto_in_ar_bits_id; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [27:0] sram_auto_in_ar_bits_addr; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_ar_bits_user; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_r_ready; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_r_valid; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [3:0] sram_auto_in_r_bits_id; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [63:0] sram_auto_in_r_bits_data; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire [1:0] sram_auto_in_r_bits_resp; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  sram_auto_in_r_bits_user; // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
  wire  axi4buf_clock; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_reset; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_aw_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_aw_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [3:0] axi4buf_auto_in_aw_bits_id; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [27:0] axi4buf_auto_in_aw_bits_addr; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_aw_bits_user; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_w_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_w_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [63:0] axi4buf_auto_in_w_bits_data; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [7:0] axi4buf_auto_in_w_bits_strb; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_w_bits_last; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_b_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_b_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [3:0] axi4buf_auto_in_b_bits_id; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [1:0] axi4buf_auto_in_b_bits_resp; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_b_bits_user; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_ar_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_ar_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [3:0] axi4buf_auto_in_ar_bits_id; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [27:0] axi4buf_auto_in_ar_bits_addr; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_ar_bits_user; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_r_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_r_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [3:0] axi4buf_auto_in_r_bits_id; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [63:0] axi4buf_auto_in_r_bits_data; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [1:0] axi4buf_auto_in_r_bits_resp; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_r_bits_user; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_in_r_bits_last; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_aw_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_aw_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [3:0] axi4buf_auto_out_aw_bits_id; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [27:0] axi4buf_auto_out_aw_bits_addr; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_aw_bits_user; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_w_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_w_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [63:0] axi4buf_auto_out_w_bits_data; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [7:0] axi4buf_auto_out_w_bits_strb; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_b_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_b_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [3:0] axi4buf_auto_out_b_bits_id; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [1:0] axi4buf_auto_out_b_bits_resp; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_b_bits_user; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_ar_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_ar_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [3:0] axi4buf_auto_out_ar_bits_id; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [27:0] axi4buf_auto_out_ar_bits_addr; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_ar_bits_user; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_r_ready; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_r_valid; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [3:0] axi4buf_auto_out_r_bits_id; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [63:0] axi4buf_auto_out_r_bits_data; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire [1:0] axi4buf_auto_out_r_bits_resp; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4buf_auto_out_r_bits_user; // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
  wire  axi4frag_clock; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_reset; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_aw_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_aw_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [3:0] axi4frag_auto_in_aw_bits_id; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [27:0] axi4frag_auto_in_aw_bits_addr; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [7:0] axi4frag_auto_in_aw_bits_len; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [2:0] axi4frag_auto_in_aw_bits_size; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [1:0] axi4frag_auto_in_aw_bits_burst; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_w_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_w_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [63:0] axi4frag_auto_in_w_bits_data; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [7:0] axi4frag_auto_in_w_bits_strb; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_w_bits_last; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_b_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_b_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [3:0] axi4frag_auto_in_b_bits_id; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [1:0] axi4frag_auto_in_b_bits_resp; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_ar_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_ar_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [3:0] axi4frag_auto_in_ar_bits_id; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [27:0] axi4frag_auto_in_ar_bits_addr; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [7:0] axi4frag_auto_in_ar_bits_len; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [2:0] axi4frag_auto_in_ar_bits_size; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [1:0] axi4frag_auto_in_ar_bits_burst; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_r_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_r_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [3:0] axi4frag_auto_in_r_bits_id; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [63:0] axi4frag_auto_in_r_bits_data; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [1:0] axi4frag_auto_in_r_bits_resp; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_in_r_bits_last; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_aw_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_aw_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [3:0] axi4frag_auto_out_aw_bits_id; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [27:0] axi4frag_auto_out_aw_bits_addr; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_aw_bits_user; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_w_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_w_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [63:0] axi4frag_auto_out_w_bits_data; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [7:0] axi4frag_auto_out_w_bits_strb; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_w_bits_last; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_b_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_b_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [3:0] axi4frag_auto_out_b_bits_id; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [1:0] axi4frag_auto_out_b_bits_resp; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_b_bits_user; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_ar_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_ar_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [3:0] axi4frag_auto_out_ar_bits_id; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [27:0] axi4frag_auto_out_ar_bits_addr; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_ar_bits_user; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_r_ready; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_r_valid; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [3:0] axi4frag_auto_out_r_bits_id; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [63:0] axi4frag_auto_out_r_bits_data; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire [1:0] axi4frag_auto_out_r_bits_resp; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_r_bits_user; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  wire  axi4frag_auto_out_r_bits_last; // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
  AXI4RAM sram ( // @[Ports.scala 221:24:boom.system.TestHarness.MegaBoomConfig.fir@330322.4]
    .clock(sram_clock),
    .reset(sram_reset),
    .auto_in_aw_ready(sram_auto_in_aw_ready),
    .auto_in_aw_valid(sram_auto_in_aw_valid),
    .auto_in_aw_bits_id(sram_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(sram_auto_in_aw_bits_addr),
    .auto_in_aw_bits_user(sram_auto_in_aw_bits_user),
    .auto_in_w_ready(sram_auto_in_w_ready),
    .auto_in_w_valid(sram_auto_in_w_valid),
    .auto_in_w_bits_data(sram_auto_in_w_bits_data),
    .auto_in_w_bits_strb(sram_auto_in_w_bits_strb),
    .auto_in_b_ready(sram_auto_in_b_ready),
    .auto_in_b_valid(sram_auto_in_b_valid),
    .auto_in_b_bits_id(sram_auto_in_b_bits_id),
    .auto_in_b_bits_resp(sram_auto_in_b_bits_resp),
    .auto_in_b_bits_user(sram_auto_in_b_bits_user),
    .auto_in_ar_ready(sram_auto_in_ar_ready),
    .auto_in_ar_valid(sram_auto_in_ar_valid),
    .auto_in_ar_bits_id(sram_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(sram_auto_in_ar_bits_addr),
    .auto_in_ar_bits_user(sram_auto_in_ar_bits_user),
    .auto_in_r_ready(sram_auto_in_r_ready),
    .auto_in_r_valid(sram_auto_in_r_valid),
    .auto_in_r_bits_id(sram_auto_in_r_bits_id),
    .auto_in_r_bits_data(sram_auto_in_r_bits_data),
    .auto_in_r_bits_resp(sram_auto_in_r_bits_resp),
    .auto_in_r_bits_user(sram_auto_in_r_bits_user)
  );
  AXI4Buffer_1 axi4buf ( // @[Buffer.scala 58:29:boom.system.TestHarness.MegaBoomConfig.fir@330328.4]
    .clock(axi4buf_clock),
    .reset(axi4buf_reset),
    .auto_in_aw_ready(axi4buf_auto_in_aw_ready),
    .auto_in_aw_valid(axi4buf_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4buf_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4buf_auto_in_aw_bits_addr),
    .auto_in_aw_bits_user(axi4buf_auto_in_aw_bits_user),
    .auto_in_w_ready(axi4buf_auto_in_w_ready),
    .auto_in_w_valid(axi4buf_auto_in_w_valid),
    .auto_in_w_bits_data(axi4buf_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4buf_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4buf_auto_in_w_bits_last),
    .auto_in_b_ready(axi4buf_auto_in_b_ready),
    .auto_in_b_valid(axi4buf_auto_in_b_valid),
    .auto_in_b_bits_id(axi4buf_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4buf_auto_in_b_bits_resp),
    .auto_in_b_bits_user(axi4buf_auto_in_b_bits_user),
    .auto_in_ar_ready(axi4buf_auto_in_ar_ready),
    .auto_in_ar_valid(axi4buf_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4buf_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4buf_auto_in_ar_bits_addr),
    .auto_in_ar_bits_user(axi4buf_auto_in_ar_bits_user),
    .auto_in_r_ready(axi4buf_auto_in_r_ready),
    .auto_in_r_valid(axi4buf_auto_in_r_valid),
    .auto_in_r_bits_id(axi4buf_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4buf_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4buf_auto_in_r_bits_resp),
    .auto_in_r_bits_user(axi4buf_auto_in_r_bits_user),
    .auto_in_r_bits_last(axi4buf_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4buf_auto_out_aw_ready),
    .auto_out_aw_valid(axi4buf_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4buf_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4buf_auto_out_aw_bits_addr),
    .auto_out_aw_bits_user(axi4buf_auto_out_aw_bits_user),
    .auto_out_w_ready(axi4buf_auto_out_w_ready),
    .auto_out_w_valid(axi4buf_auto_out_w_valid),
    .auto_out_w_bits_data(axi4buf_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4buf_auto_out_w_bits_strb),
    .auto_out_b_ready(axi4buf_auto_out_b_ready),
    .auto_out_b_valid(axi4buf_auto_out_b_valid),
    .auto_out_b_bits_id(axi4buf_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4buf_auto_out_b_bits_resp),
    .auto_out_b_bits_user(axi4buf_auto_out_b_bits_user),
    .auto_out_ar_ready(axi4buf_auto_out_ar_ready),
    .auto_out_ar_valid(axi4buf_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4buf_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4buf_auto_out_ar_bits_addr),
    .auto_out_ar_bits_user(axi4buf_auto_out_ar_bits_user),
    .auto_out_r_ready(axi4buf_auto_out_r_ready),
    .auto_out_r_valid(axi4buf_auto_out_r_valid),
    .auto_out_r_bits_id(axi4buf_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4buf_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4buf_auto_out_r_bits_resp),
    .auto_out_r_bits_user(axi4buf_auto_out_r_bits_user)
  );
  AXI4Fragmenter_1 axi4frag ( // @[Fragmenter.scala 205:30:boom.system.TestHarness.MegaBoomConfig.fir@330334.4]
    .clock(axi4frag_clock),
    .reset(axi4frag_reset),
    .auto_in_aw_ready(axi4frag_auto_in_aw_ready),
    .auto_in_aw_valid(axi4frag_auto_in_aw_valid),
    .auto_in_aw_bits_id(axi4frag_auto_in_aw_bits_id),
    .auto_in_aw_bits_addr(axi4frag_auto_in_aw_bits_addr),
    .auto_in_aw_bits_len(axi4frag_auto_in_aw_bits_len),
    .auto_in_aw_bits_size(axi4frag_auto_in_aw_bits_size),
    .auto_in_aw_bits_burst(axi4frag_auto_in_aw_bits_burst),
    .auto_in_w_ready(axi4frag_auto_in_w_ready),
    .auto_in_w_valid(axi4frag_auto_in_w_valid),
    .auto_in_w_bits_data(axi4frag_auto_in_w_bits_data),
    .auto_in_w_bits_strb(axi4frag_auto_in_w_bits_strb),
    .auto_in_w_bits_last(axi4frag_auto_in_w_bits_last),
    .auto_in_b_ready(axi4frag_auto_in_b_ready),
    .auto_in_b_valid(axi4frag_auto_in_b_valid),
    .auto_in_b_bits_id(axi4frag_auto_in_b_bits_id),
    .auto_in_b_bits_resp(axi4frag_auto_in_b_bits_resp),
    .auto_in_ar_ready(axi4frag_auto_in_ar_ready),
    .auto_in_ar_valid(axi4frag_auto_in_ar_valid),
    .auto_in_ar_bits_id(axi4frag_auto_in_ar_bits_id),
    .auto_in_ar_bits_addr(axi4frag_auto_in_ar_bits_addr),
    .auto_in_ar_bits_len(axi4frag_auto_in_ar_bits_len),
    .auto_in_ar_bits_size(axi4frag_auto_in_ar_bits_size),
    .auto_in_ar_bits_burst(axi4frag_auto_in_ar_bits_burst),
    .auto_in_r_ready(axi4frag_auto_in_r_ready),
    .auto_in_r_valid(axi4frag_auto_in_r_valid),
    .auto_in_r_bits_id(axi4frag_auto_in_r_bits_id),
    .auto_in_r_bits_data(axi4frag_auto_in_r_bits_data),
    .auto_in_r_bits_resp(axi4frag_auto_in_r_bits_resp),
    .auto_in_r_bits_last(axi4frag_auto_in_r_bits_last),
    .auto_out_aw_ready(axi4frag_auto_out_aw_ready),
    .auto_out_aw_valid(axi4frag_auto_out_aw_valid),
    .auto_out_aw_bits_id(axi4frag_auto_out_aw_bits_id),
    .auto_out_aw_bits_addr(axi4frag_auto_out_aw_bits_addr),
    .auto_out_aw_bits_user(axi4frag_auto_out_aw_bits_user),
    .auto_out_w_ready(axi4frag_auto_out_w_ready),
    .auto_out_w_valid(axi4frag_auto_out_w_valid),
    .auto_out_w_bits_data(axi4frag_auto_out_w_bits_data),
    .auto_out_w_bits_strb(axi4frag_auto_out_w_bits_strb),
    .auto_out_w_bits_last(axi4frag_auto_out_w_bits_last),
    .auto_out_b_ready(axi4frag_auto_out_b_ready),
    .auto_out_b_valid(axi4frag_auto_out_b_valid),
    .auto_out_b_bits_id(axi4frag_auto_out_b_bits_id),
    .auto_out_b_bits_resp(axi4frag_auto_out_b_bits_resp),
    .auto_out_b_bits_user(axi4frag_auto_out_b_bits_user),
    .auto_out_ar_ready(axi4frag_auto_out_ar_ready),
    .auto_out_ar_valid(axi4frag_auto_out_ar_valid),
    .auto_out_ar_bits_id(axi4frag_auto_out_ar_bits_id),
    .auto_out_ar_bits_addr(axi4frag_auto_out_ar_bits_addr),
    .auto_out_ar_bits_user(axi4frag_auto_out_ar_bits_user),
    .auto_out_r_ready(axi4frag_auto_out_r_ready),
    .auto_out_r_valid(axi4frag_auto_out_r_valid),
    .auto_out_r_bits_id(axi4frag_auto_out_r_bits_id),
    .auto_out_r_bits_data(axi4frag_auto_out_r_bits_data),
    .auto_out_r_bits_resp(axi4frag_auto_out_r_bits_resp),
    .auto_out_r_bits_user(axi4frag_auto_out_r_bits_user),
    .auto_out_r_bits_last(axi4frag_auto_out_r_bits_last)
  );
  assign io_axi4_0_aw_ready = axi4frag_auto_in_aw_ready; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_w_ready = axi4frag_auto_in_w_ready; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_b_valid = axi4frag_auto_in_b_valid; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_b_bits_id = axi4frag_auto_in_b_bits_id; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_b_bits_resp = axi4frag_auto_in_b_bits_resp; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_ar_ready = axi4frag_auto_in_ar_ready; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_r_valid = axi4frag_auto_in_r_valid; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_r_bits_id = axi4frag_auto_in_r_bits_id; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_r_bits_data = axi4frag_auto_in_r_bits_data; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_r_bits_resp = axi4frag_auto_in_r_bits_resp; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign io_axi4_0_r_bits_last = axi4frag_auto_in_r_bits_last; // @[Ports.scala 226:71:boom.system.TestHarness.MegaBoomConfig.fir@330345.4]
  assign sram_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@330326.4]
  assign sram_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@330327.4]
  assign sram_auto_in_aw_valid = axi4buf_auto_out_aw_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_aw_bits_id = axi4buf_auto_out_aw_bits_id; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_aw_bits_addr = axi4buf_auto_out_aw_bits_addr; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_aw_bits_user = axi4buf_auto_out_aw_bits_user; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_w_valid = axi4buf_auto_out_w_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_w_bits_data = axi4buf_auto_out_w_bits_data; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_w_bits_strb = axi4buf_auto_out_w_bits_strb; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_b_ready = axi4buf_auto_out_b_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_ar_valid = axi4buf_auto_out_ar_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_ar_bits_id = axi4buf_auto_out_ar_bits_id; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_ar_bits_addr = axi4buf_auto_out_ar_bits_addr; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_ar_bits_user = axi4buf_auto_out_ar_bits_user; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign sram_auto_in_r_ready = axi4buf_auto_out_r_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@330332.4]
  assign axi4buf_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@330333.4]
  assign axi4buf_auto_in_aw_valid = axi4frag_auto_out_aw_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_aw_bits_id = axi4frag_auto_out_aw_bits_id; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_aw_bits_addr = axi4frag_auto_out_aw_bits_addr; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_aw_bits_user = axi4frag_auto_out_aw_bits_user; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_w_valid = axi4frag_auto_out_w_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_w_bits_data = axi4frag_auto_out_w_bits_data; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_w_bits_strb = axi4frag_auto_out_w_bits_strb; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_w_bits_last = axi4frag_auto_out_w_bits_last; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_b_ready = axi4frag_auto_out_b_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_ar_valid = axi4frag_auto_out_ar_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_ar_bits_id = axi4frag_auto_out_ar_bits_id; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_ar_bits_addr = axi4frag_auto_out_ar_bits_addr; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_ar_bits_user = axi4frag_auto_out_ar_bits_user; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_in_r_ready = axi4frag_auto_out_r_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4buf_auto_out_aw_ready = sram_auto_in_aw_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_w_ready = sram_auto_in_w_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_b_valid = sram_auto_in_b_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_b_bits_id = sram_auto_in_b_bits_id; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_b_bits_resp = sram_auto_in_b_bits_resp; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_b_bits_user = sram_auto_in_b_bits_user; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_ar_ready = sram_auto_in_ar_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_r_valid = sram_auto_in_r_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_r_bits_id = sram_auto_in_r_bits_id; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_r_bits_data = sram_auto_in_r_bits_data; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_r_bits_resp = sram_auto_in_r_bits_resp; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4buf_auto_out_r_bits_user = sram_auto_in_r_bits_user; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330343.4]
  assign axi4frag_clock = clock; // @[:boom.system.TestHarness.MegaBoomConfig.fir@330338.4]
  assign axi4frag_reset = reset; // @[:boom.system.TestHarness.MegaBoomConfig.fir@330339.4]
  assign axi4frag_auto_in_aw_valid = io_axi4_0_aw_valid; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_aw_bits_id = io_axi4_0_aw_bits_id; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_aw_bits_addr = io_axi4_0_aw_bits_addr; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_aw_bits_len = io_axi4_0_aw_bits_len; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_aw_bits_size = io_axi4_0_aw_bits_size; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_aw_bits_burst = io_axi4_0_aw_bits_burst; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_w_valid = io_axi4_0_w_valid; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_w_bits_data = io_axi4_0_w_bits_data; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_w_bits_strb = io_axi4_0_w_bits_strb; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_w_bits_last = io_axi4_0_w_bits_last; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_b_ready = io_axi4_0_b_ready; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_ar_valid = io_axi4_0_ar_valid; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_ar_bits_id = io_axi4_0_ar_bits_id; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_ar_bits_addr = io_axi4_0_ar_bits_addr; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_ar_bits_len = io_axi4_0_ar_bits_len; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_ar_bits_size = io_axi4_0_ar_bits_size; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_ar_bits_burst = io_axi4_0_ar_bits_burst; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_in_r_ready = io_axi4_0_r_ready; // @[LazyModule.scala 167:57:boom.system.TestHarness.MegaBoomConfig.fir@330342.4]
  assign axi4frag_auto_out_aw_ready = axi4buf_auto_in_aw_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_w_ready = axi4buf_auto_in_w_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_b_valid = axi4buf_auto_in_b_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_b_bits_id = axi4buf_auto_in_b_bits_id; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_b_bits_resp = axi4buf_auto_in_b_bits_resp; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_b_bits_user = axi4buf_auto_in_b_bits_user; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_ar_ready = axi4buf_auto_in_ar_ready; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_r_valid = axi4buf_auto_in_r_valid; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_r_bits_id = axi4buf_auto_in_r_bits_id; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_r_bits_data = axi4buf_auto_in_r_bits_data; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_r_bits_resp = axi4buf_auto_in_r_bits_resp; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_r_bits_user = axi4buf_auto_in_r_bits_user; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
  assign axi4frag_auto_out_r_bits_last = axi4buf_auto_in_r_bits_last; // @[LazyModule.scala 167:31:boom.system.TestHarness.MegaBoomConfig.fir@330344.4]
endmodule
