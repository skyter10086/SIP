#!/usr/bin/perl -w

use lib '../';
use utf8::all; #不使用会乱码
use SIP::Entity::Person;
use DateTime;

my $p_1 = SIP::Entity::Person->new(
  id_num => '411302198310203835',
  name => '曾理',
  scbh => '08116235311',
  aac001 => '41000039263587',
  aab001 => '410000007340',
  sex => 'male',
  folk => '汉',
  dwbm => 'A_01',
  birth_date => DateTime->new(
	year => 1983,
	month => 10,
	day => 10,
	time_zone => "UTC",),
  hire_date => DateTime->new(
	year => 2006,
	month => 7,
	day => 12,
	time_zone => "UTC",),
  tire_date => DateTime->new(
	year => 2046,
	month => 10,
	day => 10,
	time_zone => "UTC",),
  is_insured => 1,
  is_existed => 1,
  insur_base_num => 5700,
  photo => './photo/411302198310203835.jpg',
  phone => '13683993102',
  is_married => 1,
  couple_id => '121',
  


);

print $p_1->age,"\n";
print $p_1->name,"\n";
print $p_1->folk,"\n";
#$p_1->save;
$p_1->birth_date(DateTime->new(
    year => 1988,
	month => 7,
	day => 12,
	time_zone => "UTC",
));
print $p_1->age,"\n";
$p_1->save;
