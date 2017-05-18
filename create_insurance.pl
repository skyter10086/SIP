#!/usr/bin/perl -w

use lib '../';
use SIP::Entity::Orgnization;
use SIP::Subtype::Insurance;
use SIP::Subtype::Contact;
use utf8::all;

my $ins_1 = SIP::Subtype::Insurance->new(
  id => 1,
  insur => '养老',
  desp => '职工',
  rate_org => 0.19,
  rate_person => 0.08,
);

my $ins_2 = SIP::Subtype::Insurance->new(
  id => 2,
  insur => '养老',
  desp => '协解',
  rate_org => 0.0,
  rate_person => 0.20,
);
my $c_1 = SIP::Subtype::Contact->new(contactor=>'周军',phone=>'63830965');
my $dw_1 = SIP::Entity::Orgnization->new(
  name => '物探公司',
  dwbm => 'A_01',
  dwxz => '工程',
  zjqd => '工程',
  insur_base_num => 2988610,
  dwfl => '地球物理公司华北分公司',
  insur_detail => $ins_1,
  contactor =>$c_1,

);
print '单位:  ',$dw_1->name,"\t\n";
print '编码:  ',$dw_1->dwbm,"\t\n";
print '基数:  ',$dw_1->insur_base_num,"\t\n";
print '联系人: ',$dw_1->contactor->{contactor},"\n";
print '联系电话:',$dw_1->contactor->{phone},"\n";
print '全称:  ',$dw_1->dwfl,"\t\n";
print '险种: ',$dw_1->insur_detail->{insur},"\t\n";
print "\n";
print "----Done!----\n";

$dw_1->save();

my $c_2 = SIP::Subtype::Contact->new(contactor=>'朱小波',phone=>'63859187');
my $dw_2 = SIP::Entity::Orgnization->new(
  name => '南阳油区',
  dwbm => 'A_48',
  dwxz => '协解',
  zjqd => '协解',
  insur_base_num => 2908610,
  dwfl => '南阳油区协解职工',
  insur_detail => $ins_2,
  contactor =>$c_2,

);
$dw_2->save;

