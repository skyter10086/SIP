#!/usr/bin/perl -w

package SIP::Entity::Person;
use strict;
use Moose;
#use SIP::DBM;
use SIP::Entity::Orgnization;
#use SIP::Subtype::Folk; ##废弃不用，貌似把type约束写在别的模块里不行
use Moose::Util::TypeConstraints;
use DateTime;
use utf8::all;  #因为FOLK有汉字，不使用会乱码



#our ($table_name , $table_schema);

has 'id_num' => (
  is => 'rw' ,
  isa => 'Str' ,
  required => 1,
);
 
 has 'name' => (
   is => 'rw',
   isa => 'Str',
   required => 1,
 );
 
has 'scbh' => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);

has 'aac001' => (
  is => 'rw',
  isa => 'Str',
  
);

has 'aab001' => (
  is => 'rw',
  isa => 'Str',
);

has 'sex' => (
  is => 'rw',
  isa => 'Str',
  required => 1,
);
enum 'FOLK', [qw( 汉 )];
has 'folk' => (
  is => 'rw',
  isa => 'FOLK',
  required => 1,
);

# 又一个subtype在本模块内才能实现
subtype 'DWBM',
    as 'Str',
    where {my %hash = SIP::Entity::Orgnization->get(); exists $hash{$_}};#相当于filter做validate验证用
    

has 'dwbm' => (is =>'rw' , isa => 'DWBM', required => 1);

has 'birth_date' => (
  is => 'rw',
  isa =>  'DateTime',
  required => 1,
  trigger => sub{
	  my $self =shift; 
	  $self->age($self->calc_age);
	  },
);

has 'hire_date' => (
  is => 'rw',
  isa => 'DateTime',
);

has 'tire_date' => (
  is => 'rw',
  isa => 'DateTime',
);

has 'is_insured' => (
  is => 'rw',
  isa => 'Bool',
  required => 1,
);

has 'is_existed' => (
  is => 'rw',
  isa => 'Bool',
  required => 1,
);

has 'insur_base_num' => (
  is => 'rw',
  isa => 'Int',
  required => 1,
);

has 'photo ' => (
  is => 'rw',
  isa => 'Str',
);

has 'phone' => (
  is => 'rw',
  isa => 'Str',
);

has 'is_married' => (
  is => 'rw',
  isa => 'Bool',
);

has 'couple_id' => (
  is => 'rw',
  isa => 'Str',
);

sub calc_age {
  my $self = shift;
  my $birth = $self->birth_date;
  my $dt = DateTime->today(time_zone=>'UTC');
  my $age = $dt->subtract_datetime($birth);
  return $age->in_units('years');
}
has 'set_table' => (
  default => 'person',
  is => 'ro',
  isa => 'Str',
);

has 'set_schema' => (

  default => qq{
     CREATE TABLE person (
       id_num CHAR(18) PRIMARY KEY NOT NULL ,
       name TEXT NOT NULL,
       scbh CHAR(11) NOT NULL ,
       aac001 CHAR(14) ,
       aab001 CHAR(14) ,
       sex CHAR(4) ,
       folk TEXT NOT NULL ,
       dwbm CHAR(5) NOT NULL,
       birth_date DATE ,
       hire_date DATE ,
       tire_date DATE ,
       is_insured INT NOT NULL,
       is_existed INT NOT NULL,
       insur_base_num NUM NOT NULL,
       photo TEXT ,
       phone  TEXT ,
       is_married INT NOT NULL,
       couple_id CHAR(18) ,
       age INT NOT NULL

     )

  },
  is => 'ro',
  isa => 'Str',
#SIP::Entity::Person->set_table;
#SIP::Entity::Person->set_schema;

);

has 'age' => (
  is => 'rw',
  isa => 'Int',
  lazy => 1, #超级重要，因果关系
  default => sub { 
    my $self = shift;
    return $self->calc_age;  
  } ,
  

);
with 'SIP::DBM';
1;
