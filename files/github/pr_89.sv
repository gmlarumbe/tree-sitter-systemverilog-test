`define H(x) or /* a
  b */ #x

`define T """
x // not a comment
y"""

`define A "/*"

`define B x // see /* below

`define C(x) `"x /* y`"

`define D(x) `"a `\`"x`\`" b`"

`define E a / b /c/"s"

`define F a \
  + b

`define G /* one */ y /* two
  lines */ z

`define K """x\"""y"""

`define S "s"""" a
b"""

`define U "unterminated

`define W a /* unterminated

`define V x/

