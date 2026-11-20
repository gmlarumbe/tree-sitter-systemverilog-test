`define M v
`define F(x) x
`define W 8
`define S $display("s");

module m;
  assign a = `M[3];
  assign b = `F(x)(y);
  localparam P = `M[3];
  initial `M[3] = 1;
  initial foreach (`M[i]) x = 1;
endmodule

module m;
  assign a = c + `M[3];
  assign b = `F(c)[0];
  assign d = `M[3:0];
  assign e = `M[1][2];
  assign f = `M[3].x;
  assign g = `M.x;
  assign h = !`M;
  assign i = !`M[3];
  assign j = ~`F(c);
  assign k = e & ~`F(c);
  assign l = -`__LINE__;
  assign n = !`__FILE__;
  assign o = `W'(y);
  assign p = `F(2)'(d);
  localparam int Q = -`M;
  localparam int R = `M;
  initial begin
    `F(a);
    `M = 1;
    `M[0] <= 1;
  end
  initial begin
    `S
    `M[3] = 1;
  end
endmodule
