use v6;
use Bench;
use Inline::Perl5;
use Fibonacci5:from<Perl5>;
use Memoize:from<Perl5>;

sub fibonacci (Int:D $index) {

    return 0 if $index == 0;
    return 1 if $index == 1;

    return fibonacci( $index - 1 ) + fibonacci( $index - 2 );
}
my &fibonacci3 = memoize(&fibonacci2);

sub fibonacci2 (Int:D $index) {
    return (0, 1, *+* ... *)[$index];
}

my $b = Bench.new();

$b.timethis(100, sub{fibonacci(20)});
$b.timethis(100, sub{Fibonacci5::fibonacci(20)});
$b.timethis(100, sub{fibonacci2(20)});
$b.timethis(100, sub{fibonacci3(20)});

