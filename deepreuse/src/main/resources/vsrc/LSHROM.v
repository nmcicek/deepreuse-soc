
module LSHROM(
  input clock,
  input me,
  input [21:0] address,
  output [79:0] q
);
  reg [79:0] out;
  reg [79:0] rom [0: 4095999];
  initial begin: init_and_load
    integer i;
    // 256 is the maximum length of $readmemh filename supported by Verilator
    reg [255*8-1:0] path;
    path = "/home/ozcan/nmcicek/deepreuse-soc/../deepreuse-software/bin/cifarnet/int8/LSH_layer_1.bin";
    $readmemb(path, rom);
  end : init_and_load
  always @(posedge clock) begin
    if (me) begin
      out <= rom[address];
    end
  end
  assign q = out;
endmodule
    