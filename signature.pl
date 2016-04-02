use v6;

# positional
sub pos($x, $y) { "x=$x y=$y" }
pos(4, 5);                          # x=4 y=5

# named
sub named(:$x, :$y) { "x=$x y=$y" }
named( y => 5, x => 4);             # x=4 y=5

# named, but parameter name differs from variable name
sub named(:official($private) { "Official business!" if $private }
named :official;
