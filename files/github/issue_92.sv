module m;
  assign d = !(x = y);
  assign h = !x++;
  assign i = -x--;
  assign j = !a + b;
  assign k = -a ** b;
  assign l = !a ? b : c;
  initial begin
    if (!(a = b)) c = 1;
    d = -(e += 1);
  end
endmodule

module m #(parameter P = !W) ();
  localparam int Q = -C;
  logic [!W:0] a;
  initial case (x) !W: y = 1; endcase
endmodule
