module m;
  localparam int P = $bits(a)'(1);
  assign b = $bits(c)'(d);
  assign e = $clog2(N)'(f);
  assign g = h(i)'(j);
  assign k = l.m(i)'(j);
  assign n = o(i)'(j) + 1;
endmodule

module m;
  assign a = W[0]'(b);
  assign c = W[i]'(d);
  assign e = W[N-1:0]'(f);
  assign g = W[i+:2]'(h);
  assign j = W[0][1]'(k);
endmodule

module m;
  assign a = W'(b);
  assign c = int'(d);
  assign e = signed'(f);
  assign g = h(i);
  assign j = k[0];
endmodule
