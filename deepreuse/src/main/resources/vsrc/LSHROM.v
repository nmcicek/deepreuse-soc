
module LSHROM(
  input clock,
  input me,
  input [23:0] address,
  output [87:0] q
);
  reg [87:0] out;
  reg [87:0] rom [0: 9622799];
  initial begin: init_and_load
    integer i;
    // 256 is the maximum length of $readmemh filename supported by Verilator
    reg [255*8-1:0] path;
    path = "/home/ozcan/nmcicek/deepreuse-soc/../deepreuse-software/bin/alexnet/int8/LSH_layer_0.bin";
    $readmemb(path, rom);
  end : init_and_load
  always @(posedge clock) begin
    if (me) begin
      out <= rom[address];
    end
  end
  assign q = out;
endmodule
    