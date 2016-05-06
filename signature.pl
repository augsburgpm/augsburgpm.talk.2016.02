use v6;

# positional
sub pos($x, $y) { say "x=$x y=$y" }
pos(4, 5);                          # x=4 y=5

# named
sub named(:$x, :$y) { say "x=$x y=$y" }
named( y => 5, x => 4);             # x=4 y=5

# named, but parameter name differs from variable name
sub named2 (:official($private)) { say "Official business!" if $private }
named2 :official;
