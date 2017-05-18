#!/usr/bin/perl -w

package SIP::DBM::Orgnizations;
use File::Basename;
use File::Spec;
use Moose::Role;
use Storable qw( store retrieve);
use Data::Dumper;


my $file = File::Spec->rel2abs(__FILE__);
print "file: ",$file ,"\n";

my $dir = dirname($file);

print "dir is ",$dir,"\n";
my $DB_PATH = $dir.'/org.db';
#print $DB_PATH,"\n";

my %orgs;

sub save {
  my $self = shift;
  print $self->{dwbm},"\n";
  if ($self) {
    print 'save data to ',$DB_PATH, " !\n";
    #my %orgs;
	$orgs{$self->{dwbm}} = $self;
#	print Dumper(\%orgs)."\n"x2;
	store \%orgs , $DB_PATH; 
	
  }else{
    die "You do not have the instance of ",$self->SUPPER," !\n";
  }
  
  #print "save() is over!\n"; 
}

sub get {
    my $class = shift;
    my $hashref = retrieve($DB_PATH);
    %orgs = %$hashref;
    return %orgs;


}

1;
