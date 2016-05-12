use v6;

my $c = Channel.new;

my $receiver = start {
    my $msg;
    while ($msg = $c.receive) {
        say $msg;
    }
};

my @senders = (^5).map: {start {
    for (1..4) -> $x {
                      my $time = 3.rand;
                      $c.send("sender $_; position $x; sleep [$time]");
                      sleep($time);
                     }
}};

await @senders, $receiver;
