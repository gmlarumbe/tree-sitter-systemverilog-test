`define foo (A) "foo_A"

// Not incorrect syntax but pontentially wrong:
// - Detects 'foo' as the macro identifier and the rest as 'macro_text'
//   instead of 'foo(A)' as a macro identifier with a list of arguments.
