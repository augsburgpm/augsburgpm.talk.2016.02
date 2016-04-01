# "casting" #

```
sub a_Int (Int $i) {
    say "Int: $i ", $i.WHAT;
}
my $int = 4;
my $rat = 4.5;

a_Int($int);
 --> Int: 4 (Int)

a_Int($rat);
 --> Type check failed in binding $i; expected Int but got Rat
```
---

# Solution #

```
a_Int($rat.Int);
```
.right[casting.pl]
--
Toll?

--
naja...

---
# multi-dispatch #
* gleicher Name, andere Signatur

```
multi f (Int $i) { say "i: $i" }
multi f (Rat $r) { say "f for rat"; f($r.Int) }

f(4);
f(4.5);
```
.right[multi.pl]

---
# Benchmarks #

Großartige Idee: 100 mal Fibbonacci(20)
.right[fibbench5.pl vs fibbench6.pl]

--
   * Perl 5   ==> ~ 150/s

--
   * Perl 6   ==> ~ 16/s

--
   * ähhh

---
# Fibonacci in Perl 6

```
sub fibonacci2 (Int:D $index) {
    return (0, 1, *+* ... *)[$index];
}
```
* Sequence
* Whatever


---
# Sequenzen
* Sequenz-Operator ...
* links: initiale Elemente
* rechts: Ende-Element
* Sequenz-Operator ...^ enthält das Ende-Element nicht

--
* (0 ... 3) (0, 1, 2, 3)
* (0 ...^ 3) (0, 1, 2)
* (0,1 ... 3) (0, 1, 2, 3)
* (0,2 ... 6) (0, 2, 4, 6))
leitet den Generator aus den initialen Elementen ab

---
# Sequenzen
Der Generator kann auch selbst programmiert werden

```(0, -> $el {$el + 2 } ... 8)```

* (0 2 4 6 8)
* Liste startet mit 0
* das jeweils nächste Element wird mit dem Block {$el +2} berechnet
* der Block erhält durch -> $el das vorige Element als Parameter

--
das selbe, nur mit zwei Parametern

```(0,1, -> $el1, $el2 {$el1 + $el2 } ... 8)```

es müssen mindestens 2 initiale Elemente angegeben werden


---

# Whatever  #

```*```
* als allgemeiner Platzhalter

--
Auch möglich:
```
(0, *+2 ... 6)

