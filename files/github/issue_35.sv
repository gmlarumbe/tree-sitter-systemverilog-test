a.a = b[i][A.a()+B.b()-1:0]; // ERROR

// The ones below are OK
a.a = b[i][A()+B()-1:0];
a.a = b[i][A.a+B.b-1:0];
a.a = b[i][A+B-1:0];
