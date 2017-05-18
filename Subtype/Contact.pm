#!/usr/bin/perl -w

package SIP::Subtype::Contact;
use Moose;

has 'contactor' => (
	is => 'rw',
	isa => 'Str',
);

has 'phone' => (
	is => 'rw',
	isa => 'Str',
);

1;


