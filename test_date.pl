#!/usr/bin/perl

use strict;
use warnings;
use DateTime;

my $dt = DateTime->today(time_zone=>'UTC');
my $born = DateTime->new(
	year => 1957,
	month => 10,
	day => 10,
	time_zone => "UTC",
);
my $dur = $dt->subtract_datetime($born);
print $dur->in_units('years'),"\n";
