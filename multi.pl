use v6;

multi f ( Int $i) { say "i: $i" }
multi f (Rat $r ) { say "f for rat"; f($r.Int) }

f(4);
f(4.5);
