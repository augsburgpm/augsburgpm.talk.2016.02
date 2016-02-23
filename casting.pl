use v6;

sub a_Int (Int $i) {
    say "Int: $i ", $i.WHAT;
}


my $int = 4;
my $rat = 4.5;
a_Int($int);
try {
    a_Int($rat);
};
say $!;
a_Int($rat.Int);

