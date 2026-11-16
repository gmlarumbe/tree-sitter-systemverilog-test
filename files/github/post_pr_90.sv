// PR #90 uncovered a missing seq() in $._incomplete_class_scoped_type rule.
// This file adds tests on the next commit after the PR.

typedef logic [AW-1:0]      addr_t;
typedef axi_pkg::burst_t    burst_t;
typedef axi_test::axi_driver #(
    .AW(AW), .DW(DW), .IW(IW), .UW(UW), .TA(TA), .TT(TT)
) axi_driver_t;
