use v5.10.1;
use strict;
use warnings;
use Benchmark qw(:all);

sub fibonacci {
    my $index = shift;

    return 0 if $index == 0;
    return 1 if $index == 1;

    return fibonacci( $index - 1 ) + fibonacci( $index - 2 );
}

timethis(100, sub{fibonacci(20)});

#say "F($ARGV[0]) is ", fibonacci($ARGV[0]);
