use v6;

say "start";
my $x = start {for (1..4) -> $i {say "x: $i"; sleep 1}};
my $y = start {for (1..7) -> $i {say "y: $i"; sleep 1}};
say "started all threads";

await Promise.anyof($x, $y, Promise.in(1));
say "awaited any";
sleep 3;
say "end";
