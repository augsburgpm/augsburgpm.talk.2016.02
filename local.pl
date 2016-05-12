use v5.10.1;

our $x = 5;

sub xx {say $x}

xx();
do {
    local $x = 6;
    xx();
};
xx();
