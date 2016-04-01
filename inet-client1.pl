use v6;

my $conn = IO::Socket::INET.new(:host<127.0.0.1>, :port(3333));
$conn.print: 'Hello, Perl 6';
$conn.print: 'Hello, Perl 6';
my $x;
$x.say while $x = $conn.recv ;
$conn.close;
