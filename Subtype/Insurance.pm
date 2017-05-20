#!/usr/bin/perl -w

package SIP::Subtype::Insurance;
use Moose;
has 'id' => (is => 'ro',isa => 'Int',);
has 'insur' => (
	is => 'rw',
	isa => 'Str',
);

has 'desp' => (
       is => 'rw',
       isa => 'Str',
);

has 'rate_org' => (
	is => 'rw',
	isa => 'Num',
);

has 'rate_person' => (
	is => 'rw',
	isa => 'Num',
);

1;

