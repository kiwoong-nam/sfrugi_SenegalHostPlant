#!/bin/bash

module load bioinfo/tabix-0.2.5
module load bioinfo/vcftools-0.1.15

cd /lustre/namk/processing_fq/Senegal/vcf/SNP

/storage/simple/projects/faw_adaptation/programs/vcftools_0.1.13/bin/vcf-concat *.SNP.filtered.recode.vcf.gz | /home/knam/save/programs/htslib-1.9/bgzip > ../Senegal.SNP.filtered.recode.vcf.gz

/home/knam/save/programs/htslib-1.9/tabix -p vcf ../Senegal.SNP.filtered.recode.vcf.gz



