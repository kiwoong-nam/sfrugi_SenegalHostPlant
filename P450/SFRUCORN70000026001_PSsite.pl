use strict;

my $piNF='/home/knam/work/sfrugi_SenegalHostPlant/P450/fst/SFRUCORN70000026001_native.sites.pi';
my $piIF='/home/knam/work/sfrugi_SenegalHostPlant/P450/fst/SFRUCORN70000026001_inv.sites.pi';
my $annoF='/home/knam/work/sfrugi_SenegalHostPlant/P450/annot/varannot.SFRUCORN70000026001.txt';
my $output='/home/knam/work/sfrugi_SenegalHostPlant/P450/SFRUCORN70000026001_alter/PS.sites';

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
