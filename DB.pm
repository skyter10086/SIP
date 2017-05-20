#!/usr/bin/env perl
package SIP::DB;
use DBI qw(:sql_types);
use utf8::all;
use strict;
use warnings;
use Data::Dumper;



  my ($dbh, $sth,$tbn,$tb_schema);
  sub init_tab;
  sub new {
    my $class = shift;
    my $self = shift ;
    #print ref $self ;
    #print "\n";
    $tbn = $self->{tbname};
    $tb_schema = $self->{schema};
    #print "$tbn \n";
    #print $tb_schema,"\n";
    #print $self->{datasource},"\n";
    $dbh = DBI->connect($self->{datasource}, $self->{usrname},
           $self->{pwd}, $self->{attr}) or  die " connecting interrupt by DBI::errstr \n" ;
    init_tab($tb_schema) unless my @names = $dbh->tables('', 'main', "\%$tbn\%",'TABLE');
    #print @names,"\n" if @names;
     #my $rc = $sth->fetchall_hashref or die "not find table!\n";
    #while (my ($k,$v) = each %$rc){
	#	print "$k    :     $v\n";
		
	#	}
    bless $self, $class ;
    print "loading new instance over...\n";
    return $self;
  }

  sub insrt {
    my ($self, $hash) = @_ ;
    
    my $kstr = join(",", keys %$hash);
    my @vals = values %$hash;
    my @params ;
    my @places;
    for (0..$#vals) {
		push @places, "?";
		if (ref $vals[$_] ~~ 'DateTime'){
		    push @params, [$_+1,$vals[$_],undef];
	      }else{
			  push @params,[$_+1,$vals[$_],{TYPE =>SQL_DATETIME}];
	      }
	      #print @{$params[$_]},"\n";
		}
    my $ststr = sprintf("INSERT INTO %s (%s) VALUES (",$tbn,$kstr);
    my $str = join(",", @places);
    $ststr = $ststr . $str .")";
    print "$ststr \n";
    $sth = $dbh->prepare($ststr);
    for (0..$#params){
		
		$sth->bind_param(@{$params[$_]});
		
		}
    $sth->execute or die "Can not insert values to table!\n$sth->errstr\n";
    $sth = undef;
    return 1; 
  
}  

sub fetch {
	my ($self, $id) = @_ ;
	$sth = $dbh->prepare(qq{SELECT * FROM ? WHERE id_num = ?}) ;
	my $rv=$sth->excute($tbn,$id) or die "Fetch data exception: $sth->errstr \n";
	

}

sub init_tab {
  my $schema = shift;
  $sth=$dbh->do("DROP TABLE IF EXISTS $tbn ;");
  print "Droped the unexpected table...if exists!\n";
  $sth=$dbh->prepare($schema) ; 
  my $rv=$sth->execute() or die "$sth->errstr \n";



}
  
















1;

