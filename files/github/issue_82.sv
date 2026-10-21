module m;
  wire y = a[0][b[1][3:2]];     // ERROR
  logic [7:0] victim;           // gone from the tree
endmodule

module m;
  wire y = a[i][b[1][3:2]];
  wire y = a[b[1][3:2]];
  wire y = a[0][b[11:2]];
  wire y = a[0][b[1][2]];
  wire y = a[0][(b[1][3:2])];
  wire y = a[0][b[1][3:2]].c;
  wire y = a[0][b[j][3:2]];
  wire y = a[0][x.y[1][3:2]];
  // wire y = a[3:0][b[1][3:2]]; // Should be detected as an ERROR
  // wire y = a[0][b[3:2][1]];   // Should be detected as an ERROR
endmodule
