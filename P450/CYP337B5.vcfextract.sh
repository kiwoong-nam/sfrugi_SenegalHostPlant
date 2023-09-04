#!/bin/bash

vcfF=/home/knam/work/sfrugi_SenegalHostPlant/vcf/Senegal.SNP.filtered.recode.vcf.gz

cd /home/knam/work/sfrugi_SenegalHostPlant/P450/CYP337B5

/home/knam/save/programs/htslib-1.9/tabix -h $vcfF HiC_scaffold_14:12544725-12549060 > CYP337B5.vcf








