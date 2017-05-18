#!/usr/bin/perl -w

use lib '../';

use SIP::Entity::Orgnization;
use SIP::Entity::Person;
use Data::Dumper;

my %hash = SIP::Entity::Orgnization->get();
print Dumper(\%hash);
print "========================\n\n";
 %hash = SIP::Entity::Person->get();
 print Dumper(\%hash);
print "========================\n\n";

while (my ($k, $v)=each(%hash)) {
    print "[$k]:\n\n";
    while (my ($kk,$vv)=each(%$v)) {
      print "$kk    =>    $vv,\n";
    }
}



print "Done.\n";
