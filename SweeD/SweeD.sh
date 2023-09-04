#!/bin/bash
#SBATCH --partition=dgimi-eha

vcfF=/storage/simple/projects/faw_adaptation/Sudee/Senegal/vcf/Senegal.SNP.filtered.recode.vcf.gz 
ps=/storage/simple/projects/faw_adaptation/Sudee/Senegal/sampleinfo/Senegalsamples.txt 

cd /storage/simple/projects/faw_adaptation/Sudee/Senegal/SweeD/result 

zcat $vcfF | head -n 1000 | grep '#' > temp.vcf # get just header of vcf file
zcat $vcfF | grep -v '#' | sed 's/HiC_scaffold_//' | grep -v '*' | grep -Pv '\t\.:' >> temp.vcf # remove * and HiC_scaffold_

/storage/simple/projects/faw_adaptation/programs/vcftools_0.1.13/bin/vcftools --vcf temp.vcf --keep $ps -c --recode --chr 1 --chr 2 --chr 3 --chr 4 --chr 5 --chr 6 --chr 7 --chr 8 --chr 9 --chr 10 --chr 11 --chr 12 --chr 13 --chr 14 --chr 15 --chr 16 --chr 17 --chr 18 --chr 19 --chr 20 --chr 21 --chr 22 --chr 23 --chr 24 --chr 25 --chr 26 --chr 27 --chr 28 --chr 29 > senegal.vcf ## extract chr 1 to 29, and extract only senegal

/storage/simple/projects/faw_adaptation/programs/sweed-master/SweeD -name senegal -input senegal.vcf -grid 1000
