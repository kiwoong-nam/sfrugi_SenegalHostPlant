#!/bin/bash

module load bioinfo/tabix-0.2.5
module load bioinfo/vcftools-0.1.16

vcf=CYP337B5.vcf

cd /home/knam/work/sfrugi_SenegalHostPlant/P450/CYP337B5

vcftools --vcf $vcf --keep ../fst/invasive --site-pi --out CYP337B5_inv
vcftools --vcf $vcf --keep ../fst/native --site-pi --out CYP337B5_nat



