use v6;

my $listen = IO::Socket::INET.new(:listen, :localport(3333));
my $conn_counter;
loop {
    my $conn = $listen.accept;
    $conn_counter++;
    while my $buf = $conn.recv() {
        $conn.print: "you are visitor $conn_counter: $buf";
        say "$conn_counter: $buf";
    }
    $conn.close;
}
