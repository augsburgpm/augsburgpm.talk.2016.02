use v6;

sub add (Int $x, Int $y) {
    return $x + $y;
}

say add(4,5);

my $add3 = &add.assuming(3);
say $add3(5);



