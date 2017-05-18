#!/usr/bin/perl -w

package SIP::DBM::People;
use File::Basename;
use File::Spec;
use Moose::Role;
use Storable qw( store retrieve);
use Data::Dumper;


my $file = File::Spec->rel2abs(__FILE__);
print "file: ",$file ,"\n";

my $dir = dirname($file);

print "dir is ",$dir,"\n";
my $DB_PATH = $dir.'/people.db';
#print $DB_PATH,"\n";

my %people;

sub save {
  my $self = shift;
  print "*",$self->{id_num},"*\n";
  if ($self) {
    print 'save data to ',$DB_PATH, " !\n";
    #my %orgs;
	$people{$self->{id_num}} = $self;
#	print Dumper(\%orgs)."\n"x2;
	store \%people , $DB_PATH; 
	
  }else{
    die "You do not have the instance of ",$self->SUPPER," !\n";
  }
  
  #print "save() is over!\n"; 
}

sub get {
    my $class = shift;
    my $hashref = retrieve($DB_PATH);
    %people = %$hashref;
    return %people;


}

1;
