#! /usr/bin/perl -w

package SIP::Entity::Orgnization;

use strict;
use Moose;
use SIP::Subtype::Contact;
use SIP::Subtype::Insurance;


has 'name' => (
  is => 'rw',
  isa => 'Str',
  required => 1,

);

has 'dwbm' => (
  is => 'rw',
  isa => 'Str',
  required => 1,

);

has 'dwxz' => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);

has 'zjqd' => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);

has 'insur_base_num' => (
  is => 'rw',
  isa => 'Int',
  required => 1,
);

has 'dwfl' => (
  is => 'rw',
  isa => 'Str',
  required => 1,

);

has 'contactor' => (
  is => 'rw',
  isa => 'SIP::Subtype::Contact',
);

has 'insur_detail' => (
  is => 'rw',
  isa => 'SIP::Subtype::Insurance',
  required => 1,
);

with 'SIP::DBM::Orgnizations';

1;
