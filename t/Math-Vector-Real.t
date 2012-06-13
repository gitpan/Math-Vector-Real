#!/usr/bin/perl

use Test::More tests => 18;

use Math::Vector::Real;


my $PI = 3.14159_26535_89793_23846_26433_83279;

my $u = V(1, 0, 0);
my $v = V(0, 1, 0);
my $w = V(0, 0, 1);

my $r = V(1, 1, 1);

is (abs($_), 1) for ($u, $v, $w);
is (abs($u + $w), sqrt(2));
ok (cos(atan2($u, $v)) < 1e-4);
ok ($u + $v == [1, 1, 0]);
ok ($u + $w != [1, 1, 1]);
ok ($u - $v == [1, -1, 0]);
ok (-$v - $w * 2 == [0, -1, -2]);
ok (-2 * $v - $w == [0, -2, -1]);
is ($u * $v, 0);
is (($u + $v) * $v, 1);
ok ($u x $v == $w);

ok (abs($u->rotate_3d($PI/2, $v) - $w) < 0.0001);
ok (abs($v->rotate_3d($PI/2, $w) - $u) < 0.0001);
ok (abs($w->rotate_3d($PI/2, $v) - (-$u)) < 0.0001);

my ($b1, $b2, $b3) = $r->rotation_base_3d;
ok (abs($b1 * $r * $b1 - $r) < 0.0001);
ok (abs($b1 x $b2 - $b3) < 0.0001);
