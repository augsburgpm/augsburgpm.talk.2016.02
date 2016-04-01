use v6;

react {
    my $conn_counter = 0;
    whenever IO::Socket::Async.listen('127.0.0.1', 3333)
        -> $conn {
                  $conn_counter++;
                  whenever $conn.Supply(:bin) -> $buf {
                                                       say "conn $conn_counter";
                                                       $conn.write: $buf;
                                                       sleep 2;
                                                       say "$conn_counter again";
                                                       $conn.print: "again";
                                                       sleep 2;
                                                       say "$conn_counter and again";
                                                       $conn.print: "and again";
                                                       $conn.close;
                                                      }
                 }
    };
