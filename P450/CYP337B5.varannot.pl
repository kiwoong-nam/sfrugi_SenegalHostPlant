use strict;

my $gene='SFRUCORN70000026009';

my $refF="/home/knam/work/sfrugi_SenegalHostPlant/P450/annot/sfC.ver7.fa";
my $vcfF="/home/knam/work/sfrugi_SenegalHostPlant/P450/CYP337B5/CYP337B5.vcf";
my $gffF="/home/knam/work/sfrugi_SenegalHostPlant/P450/CYP337B5/$gene.gff";
my $output="/home/knam/work/sfrugi_SenegalHostPlant/P450/CYP337B5/varannot.$gene.txt";

my $refseq;
open my $fd,$refF;
my @seqF=<$fd>;
for(my $i=0;$i<=$#seqF;$i+=2)
{
	if($seqF[$i]=~/_14$/)
	{
		$refseq=$seqF[$i+1];
		$refseq=~s/\n//;
	}
}

my @dt;
open my $fd,$gffF;
while(<$fd>)
{
	if($_=~/#/) {next}
	$_=~s/\n//;
	my @single=split("\t",$_);	
	shift @single;
	push @dt,"$single[1]\t$single[2]\t$single[3]\t$single[5]";
}
close $fd;
varannot($gene,\@dt);

sub varannot
{
	(my $gn,my $dta)=(@_);
	
	my %genic;
	foreach my $line (@$dta)
	{
		my @single=split("\t",$line);
		if($single[0] eq 'gene')
		{
			for(my $i=$single[1];$i<=$single[2];$i++){$genic{$i}="intronic"}
		}
	}
	foreach my $line (@$dta)
	{
		my @single=split("\t",$line);
		if($single[0] eq 'exon')
		{
			for(my $i=$single[1];$i<=$single[2];$i++){$genic{$i}="noncoding"}
		}
	}
	
	my @refS=split('',$refseq);

	my @cdsP;
	my $strand;
	foreach my $line (@$dta)
	{
		my @single=split("\t",$line);
		if($single[0] eq 'CDS')
		{
			for(my $i=$single[1];$i<=$single[2];$i++)
			{
					$genic{$i}="coding";
					push @cdsP,$i;
			}
			$strand="$single[3]";
		}
	}

	my $ptnREF=CDS(\@cdsP,$strand,\@refS);
	my $res="chr\tposition\tref\talt\tannot\n";

	my @vcfdata;
	open my $fd,$vcfF;
	while(<$fd>)
	{
		if($_=~/#/) {next}
		push @vcfdata,$_;
	}
	close $fd;
	
	my $nr=0;
	foreach my $line (@vcfdata)
	{	
		my @v=split("\t",$line);
		$v[4]=~s/\*//g;
		$v[4]=~s/,//g;
		my @alt=split('',$v[4]);
		my $at=join(',',@alt);

		my $va=$genic{$v[1]};

		my $sres;
		if($va eq 'coding')
		{
			my $cdsvarannot;
			foreach my $nt (@alt)
			{
				my @newNTs=@refS;
				$newNTs[($v[1]-1)]=$nt;
				my $ptnalt=CDS(\@cdsP,$strand,\@newNTs);
				if($ptnREF eq $ptnalt) {$cdsvarannot.='syn,'}
				else
				{
					my @RP=split('',$ptnREF);
					my @AP=split('',$ptnalt);
					
					L:for(my $i=0;$i<=$#RP;$i++)
					{
						if($RP[$i] ne $AP[$i])
						{
							$cdsvarannot.="nonsyn($RP[$i]->$AP[$i]),";
							last L;
						}
					}							

				}
			}
			$sres="$v[0]\t$v[1]\t$v[3]\t$at\t$cdsvarannot\n";

		}
		else {$sres="$v[0]\t$v[1]\t$v[3]\t$at\t$va\n";}
		$nr++;
		print ("$nr out of ",($#vcfdata+1),": $sres");
		$res.=$sres;
	}

	open my $fd,">$output";
	print $fd $res;
	close $fd;
}

sub CDS
{
	(my $positions,my $str,my $NT)=(@_);

	my @psts=@$positions;

	if($str eq '-')
	{
		@psts=sort @psts;
		@psts=reverse @psts;
	}

	my $cdseq;
	foreach my $p (@psts)
	{
		$cdseq.=$$NT[$p-2];
	}

	if($str eq '-')	{$cdseq=~tr/AGCT/TCGA/;}

	my $aaseq=translate($cdseq);
	return $aaseq;
}	

sub translate
{
	(my $DNA)=(@_);
	 
	my $protein='';
	for(my $i=0;$i<(length($DNA)-2);$i+=3)
	{
		my $codon=substr($DNA,$i,3);
		$protein.=codon2aa($codon);
	}
	return $protein;
}


sub codon2aa
{
	my($cd)=@_;
	$cd=uc $cd;
	my(%g)=('TCA'=>'S','TCC'=>'S','TCG'=>'S','TCT'=>'S','TTC'=>'F','TTT'=>'F','TTA'=>'L','TTG'=>'L','TAC'=>'Y','TAT'=>'Y','TAA'=>'*','TAG'=>'*','TGC'=>'C','TGT'=>'C','TGA'=>'*','TGG'=>'W','CTA'=>'L','CTC'=>'L','CTG'=>'L','CTT'=>'L','CCA'=>'P','CCC'=>'P','CCG'=>'P','CCT'=>'P','CAC'=>'H','CAT'=>'H','CAA'=>'Q','CAG'=>'Q','CGA'=>'R','CGC'=>'R','CGG'=>'R','CGT'=>'R','ATA'=>'I','ATC'=>'I','ATT'=>'I','ATG'=>'M','ACA'=>'T','ACC'=>'T','ACG'=>'T','ACT'=>'T','AAC'=>'N','AAT'=>'N','AAA'=>'K','AAG'=>'K','AGC'=>'S','AGT'=>'S','AGA'=>'R','AGG'=>'R','GTA'=>'V','GTC'=>'V','GTG'=>'V','GTT'=>'V','GCA'=>'A','GCC'=>'A','GCG'=>'A','GCT'=>'A','GAC'=>'D','GAT'=>'D','GAA'=>'E','GAG'=>'E','GGA'=>'G','GGC'=>'G','GGG'=>'G','GGT'=>'G');

	if(exists $g{$cd}) {return $g{$cd}}
	else
	{
		print STDERR "Bad codon \"$cd\"!!\n";exit;
	}
}
                                           
