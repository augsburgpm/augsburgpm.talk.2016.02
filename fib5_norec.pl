use strict;
use warnings;
use v5.10.1;
use Benchmark qw(:all);

sub fib_my {
    my ($n) = @_;
    my $fibs = [0, 1];
    for ($#$fibs + 1 .. $n) {
        push @$fibs, $fibs->[$_ - 1] + $fibs->[$_ - 2];
    }
    return $fibs->[$n] ;
}

sub fib_state {
    my ($n) = @_;
    state $fibs = [0, 1];
    for ($#$fibs + 1 .. $n) {
        push @$fibs, $fibs->[$_ - 1] + $fibs->[$_ - 2];
    }
    return $fibs->[$n] ;
}

timethese(100000,
          { fib_my => sub {fib_my(20)},
            fib_state => sub {fib_state(20)},
          });
# for my $i (1, 2, 5, 8, 7) {
#     say "$i: ", fib($i);
# }
