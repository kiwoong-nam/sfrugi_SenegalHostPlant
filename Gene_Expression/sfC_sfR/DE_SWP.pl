use strict;

my $DEF='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/DE/SWP/expression.txt';
my $SWPF='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/DE/SWP/psgenes.txt';

my $output='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/DE/SWP/swp_hostplantgene.txt';

my %GT;
my $i=0;
my $j=0;
open my $fd,$DEF;
while(<$fd>)
{
	$_=~s/\n//;
	my @single=split("\t",$_);

	if($single[2]>0 and $single[6]<0.05 and $single[6] ne 'NA')
	{
		$GT{$single[0]}='DE';
		$i++;
	}
	else {$j++}
}
close $fd;

print "$i $j\n";

my $res;
open my $fd,$SWPF;
while(<$fd>)
{
	$_=~s/\n//;
	my @single=split("\t",$_);
	print "$GT{$single[4]}\n";
	if($GT{$single[4]} ne '') {$res.="$_\n"}
}
close $fd;

open my $fd,">$output";
print $fd $res;
close $fd;

