#!/bin/bash

vcfF=/home/knam/work/sfrugi_SenegalHostPlant/vcf/Senegal.SNP.filtered.recode.vcf.gz

cd /home/knam/work/sfrugi_SenegalHostPlant/P450/CYP321B4

/home/knam/save/programs/htslib-1.9/tabix -h $vcfF HiC_scaffold_14:12451546-12453036 > CYP321B4.vcf


