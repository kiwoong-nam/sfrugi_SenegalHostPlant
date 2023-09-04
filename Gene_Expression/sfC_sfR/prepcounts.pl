use strict;

my $ID='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/counts';
my $output='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/DE/input/counts.txt';

opendir my $D,$ID;
my @sd=readdir($D);
close $D;

my %RES;
my $H="ID\t";
foreach my $s (@sd)
{
	unless($s=~/B/) {next}
	$H.="$s\t";
	
	open my $fd,"$ID/$s/quant.sf";
	while(<$fd>)
	{
		if($_=~/EffectiveLength/) {next}
		$_=~s/\n//;
		$_=~s/-RA//;
		my @s=split("\t",$_);
		my $id=shift @s;
		my $count=pop @s;
		$RES{$id}.="$count\t";
	}
	close $fd;
}

$H=~s/\t$/\n/;

my @ids=keys %RES;
foreach my $id (@ids)
{
	my $ct=$RES{$id};
	$ct=~s/\t$/\n/;
	$H.="$id\t$ct";
}

open my $fd,">$output";
print $fd $H;
close $fd;

