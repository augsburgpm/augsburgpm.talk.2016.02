use v6;

my @tests = ('5',
             '6.5',
             'hallo',
             '7g',
             '2e3',
             '0xaa',
            );
for @tests -> $t {
                  say $t, ' ', val($t), val($t).WHAT;
                  }
