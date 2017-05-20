#!/usr/bin/env perl

### File: DBM.pm
### Descript: Role of Entity，about DB Operats
### Author: zby
### Date: 2017-05-19 fri

package SIP::DBM;

use strict;
use warnings;
use utf8::all;

use Moose::Role;
use SIP::DB;

requires 'set_table','set_schema';


my $db_source = {
  datasource => "dbi:SQLite:dbname=database.db",
  usrname => '',
  pwd => '',
  attr => {PrintError=>1,AutoCommit=>1},
  tbname => ,
  schema => ,
};

my $db;


sub save {
  my $self = shift;
  $db_source->{tbname} = $self->set_table;
  $db_source->{schema} = $self->set_schema;
  #print $db_source->{tbname},"\n";
  $db = SIP::DB->new($db_source);
  my @keys = sort $self->meta()->get_attribute_list;
  #print @keys,"\n";
  my $hr = {};
  foreach my $k (@keys){
    $hr->{$k} = $self->$k;
    #print $k," =>\t";
    #print $hr->{$k},"\n";
    
  }
  delete $hr->{set_table};
    delete $hr->{set_schema};
  $db->insrt($hr);

}

sub get {
  my ($self,$ref_filt) = @_;
  my $reslt = $db->fetch($ref_filt) if $db;
  
  

}
1;
