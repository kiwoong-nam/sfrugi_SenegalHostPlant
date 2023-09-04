use strict;

my $B=100000;

my $input='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/DE/RandomizedTest/DE_174902.txt';
my $output='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/DE/RandomizedTest/res.txt';

my @N;
open my $fd,$input;
while(<$fd>)
{
	$_=~s/\n$//;
	$_=~/\d+$/;
	push @N,$&;
}
close $fd;

my $p=0;
my $bs;
for(my $b=0;$b<$B;$b++)
{
	my $rb=$N[int rand $#N];
	if($rb>=2) {$p++}
	$bs+=$rb;
}

$p=$p/$B;
$bs=$bs/$B;

my $res
="
p value = $p
random mean = $bs 

";

open my $fd,">$output";
print $fd $res;
close $fd;
