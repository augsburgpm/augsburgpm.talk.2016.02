use v6;

say "hi1";
my $x = start {sleep 0.5; for (1..10) -> $i {say "x: $i";sleep 1}};
my $y = start {for (1..10) -> $i {say "y: $i";sleep 1}};
say "hi2: ", $x.WHAT;

await Promise.anyof($x, $y, Promise.in(1));
say "awaited";
sleep 3;
say "end x";
$x.break;
sleep 3;
