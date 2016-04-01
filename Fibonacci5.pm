package Fibonacci5;

use v5.10.1;
use strict;
use warnings;

sub fibonacci {
    my $index = shift;

    return 0 if $index == 0;
    return 1 if $index == 1;

    return fibonacci( $index - 1 ) + fibonacci( $index - 2 );
}

1;
