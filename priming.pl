use v6;

sub add (Int :$x, Int :$y)  returns Int:D {
    return $x + $y;
}

say add(:x(4),:y(5));

my $add3 = &add.assuming(:x(3));
say $add3(:y(5));

my $add4 = &add.assuming(:y(6));
say $add4(:x(17));

