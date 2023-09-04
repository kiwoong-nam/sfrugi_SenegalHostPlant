use strict;

my $seqF='/home/knam/work/sfrugi_SenegalHostPlant/P450/SFRUCORN70000026001_alter/seqs.fa';
my $output='/home/knam/work/sfrugi_SenegalHostPlant/P450/SFRUCORN70000026001_alter/PSseq.fa';

open my $fd,$seqF;
my @seq=<$fd>;
close $fd;

foreach my $line (@seq) {$line=~s/\n//g}
shift @seq;
my $ref=shift @seq;

my @R=split('',$ref);
my @alts=split('',$ref);

for(my $i=0;$i<$#seq;$i+=2)
{
	my @aS=split('',$seq[$i+1]);

	for(my $j=0;$j<=$#aS;$j++)
	{
		if($aS[$j] ne $R[$j])
		{
			$alts[$j]=$aS[$j];
		}
	
	}	
}

my $alternat=join('',@alts);

my $res=">reference\n$ref\n>invasive_FAW\n$alternat\n";

open my $fd,">$output";
print $fd $res;
close $fd;
