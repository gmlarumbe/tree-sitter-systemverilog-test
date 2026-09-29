class C;
    rand int a, b;
    constraint c { if (a) { `ifdef X
        b < a;
    `endif } }
endclass
