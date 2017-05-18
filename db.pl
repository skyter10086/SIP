#!/usr/bin/env perl

use DBI;
use utf8::all;
use strict;
use warnings;

{

  my $dbh, $dbs;

  sub new {
    my $class = shift;
    my $self ;
    my ( $data_source, $usrname, $pwd, $attr, $schema ) = @_;
    $self->{'data_source'} = $data_source;
    $self->{'usrname'} = $usrname;
    $self->{'pwd'} = $pwd;
    $self->{'attr'} = $attr;
    $self->{'schema'} = $schema;
    bless $self, $class;
    return $self; 
  }

  sub conn {
    my $self = shift;
    $dbh = DBI->connect($data_source, $usrname, $pwd, $attr) or  die " DBI::errstr \n" ;
  }
  sub constr_tab {
    my $tab_name = shift;
    my $struc = $schema->{tab}->{$tab_name};
    $dbh->execute($struc) if $dbh;

  }
  sub constr_db {
    my $db_name = shift;
    my $struc = $schema->{db}->{$db_name};
    ?

  }

}
  
1;















}

