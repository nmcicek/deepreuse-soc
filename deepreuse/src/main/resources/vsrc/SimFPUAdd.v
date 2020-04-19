import "DPI-C" function void SimFPUAdd
(
  input int     s_axis_a_tdata,
  input bit 	  s_axis_a_tvalid,
  input int     s_axis_b_tdata,
  input bit 	  s_axis_b_tvalid,
  output bit  	m_axis_result_tvalid,
  output int    m_axis_result_tdata
);

module FPUAdd(
    input aclk,
    input [31:0] s_axis_a_tdata,
    input s_axis_a_tvalid,
    input [31:0] s_axis_b_tdata,
    input s_axis_b_tvalid,
    output m_axis_result_tvalid,
    output [31:0] m_axis_result_tdata
);

  // input connections
  wire #0.1 __s_axis_b_tvalid = s_axis_b_tvalid;
  wire #0.1 __s_axis_a_tvalid = s_axis_a_tvalid;
  wire [31:0] #0.1 __s_axis_b_tdata = s_axis_b_tdata;
  wire [31:0] #0.1 __s_axis_a_tdata = s_axis_a_tdata;

  // output connections
  bit __m_axis_result_tvalid;
  int __m_axis_result_tdata;

  assign #0.1 m_axis_result_tvalid = __m_axis_result_tvalid;
  assign #0.1 m_axis_result_tdata  = __m_axis_result_tdata[31:0];

  always @(posedge aclk)
  begin
      SimFPUAdd(
        __s_axis_a_tdata,
        __s_axis_a_tvalid,
        __s_axis_b_tdata,
        __s_axis_b_tvalid,
        __m_axis_result_tvalid,
        __m_axis_result_tdata
      );
  end
endmodule