#!/bin/bash

#LOC4    HiC_scaffold_14 12469140        12470798        SFRUCORN70000026004     Similar to cyp-13A3: Putative cytochrome P450 CYP13A3 (Caenorhabditis elegans OX%3D6239)
#LOC4    HiC_scaffold_14 12456908        12458395        SFRUCORN70000026001     Similar to CYP6B6: Cytochrome P450 6B6 (Helicoverpa armigera OX%3D29058)

vcfF=/home/knam/work/sfrugi_SenegalHostPlant/vcf/Senegal.SNP.filtered.recode.vcf.gz

cd /home/knam/work/sfrugi_SenegalHostPlant/P450/vcf

/home/knam/save/programs/htslib-1.9/tabix -h $vcfF HiC_scaffold_14:12469140-12470798 > SFRUCORN70000026004.vcf

/home/knam/save/programs/htslib-1.9/tabix -h $vcfF HiC_scaffold_14:12456908-12458395 > SFRUCORN70000026001.vcf




