import "DPI-C" function void SimIntToFloat
(
  input int     s_axis_a_tdata,
  input bit 	  s_axis_a_tvalid,
  output int    m_axis_result_tdata,
  output bit  	m_axis_result_tvalid,
);

module IntToFloat(
    input aclk,
    input [31:0] s_axis_a_tdata,
    input s_axis_a_tvalid,
    output m_axis_result_tvalid,
    output [31:0] m_axis_result_tdata
);

  // input connections
  wire #0.1 __s_axis_a_tvalid = s_axis_a_tvalid;
  wire [31:0] #0.1 __s_axis_a_tdata = s_axis_a_tdata;

  // output connections
  bit __m_axis_result_tvalid;
  int __m_axis_result_tdata;

  assign #0.1 m_axis_result_tvalid = __m_axis_result_tvalid;
  assign #0.1 m_axis_result_tdata  = __m_axis_result_tdata[31:0];

  always @(posedge aclk)
  begin
      SimIntToFloat(
        __s_axis_a_tdata,
        __s_axis_a_tvalid,
        __m_axis_result_tdata,
        __m_axis_result_tvalid
      );
  end
endmodule