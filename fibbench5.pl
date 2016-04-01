use v5.10.1;
use strict;
use warnings;
use Fibonacci5;
use Benchmark qw(:all);


timethis(100, sub{Fibonacci5::fibonacci(20)});

#say "F($ARGV[0]) is ", fibonacci($ARGV[0]);
