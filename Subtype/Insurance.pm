#!/usr/bin/perl -w
#这是保险子类型
package SIP::Subtype::Insurance;
use Moose;
has 'id' => (is => 'ro',isa => 'Int',); #保险序列号
has 'insur' => (
	is => 'rw',
	isa => 'Str',
);#保险名称

has 'desp' => (
       is => 'rw',
       isa => 'Str',
);#保险描述

has 'rate_org' => (
	is => 'rw',
	isa => 'Num',
);#单位比例

has 'rate_person' => (
	is => 'rw',
	isa => 'Num',
);#个人比例

1;

