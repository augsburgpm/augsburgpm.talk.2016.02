use v6;
sub MAIN (Int $age, Str $name, Str $dings?) {
#sub MAIN (Int :$age, Str :$name, Str :$dings?) {
    say "age: $age; name: $name";
    say "dings: $dings" if $dings;
}
