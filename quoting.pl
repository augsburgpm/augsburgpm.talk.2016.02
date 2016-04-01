use v6;
my ($x, $y, $z) = (2,3,4);
say "Therefore its volume should be $x * $y * $z = { $x * $y * $z } m³!";

my @neighbors = <Hans Ernst Klaus>;
say "@neighbors.join(', ') and I try our best to coexist peacefully.";

my $twowords = "zwei wörter";
my @qqw = qqw<eins $twowords drei>;
for @qqw -> $x {say $x};

