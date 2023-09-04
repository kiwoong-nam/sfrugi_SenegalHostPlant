use strict;

my $gN='CYP337B5';
my $ID='SFRUCORN70000026009';

my $WD="/home/knam/work/sfrugi_SenegalHostPlant/P450/$gN";
my $piNF="$WD/$gN"."_nat.sites.pi";
my $piIF="$WD/$gN"."_inv.sites.pi";
my $annoF="$WD/varannot.$ID.txt";
my $output="$WD/PS.sites";

my %AN;
open my $fd,$annoF;
while(<$fd>)
{
	unless($_=~/nonsyn/) {next}
	my $nv;
	while($_=~/,/g){$nv++}
	if($nv>1) {next}
	my @s=split("\t",$_);
	$AN{$s[1]}=$s[3];
}
close $fd;

my %N;
open my $fd,$piNF;
while(<$fd>)
{
	if($_=~/CHROM/){next}
	$_=~s/\n//;
	my @s=split("\t",$_);
	$N{$s[1]}=$s[2];
}
close $fd;

my $res="pos\tpi.N\tpi.I\talt\tPS\n";
open my $fd,$piIF;
while(<$fd>)
{
	if($_=~/CHROM/){next}
	$_=~s/\n//;
	my @s=split("\t",$_);

	if($AN{$s[1]} eq '') {next}
	if($s[2] ==0 and $N{$s[1]} ==0) {next}
	my $ps;
	if($s[2] ==0 and $N{$s[1]} >0) {$ps='ps'}
	else {$ps='not'}
	$res.="$s[1]\t$N{$s[1]}\t$s[2]\t$AN{$s[1]}\t$ps\n";
}
close $fd;

open my $fd,">$output";
print $fd $res;
close $fd;
