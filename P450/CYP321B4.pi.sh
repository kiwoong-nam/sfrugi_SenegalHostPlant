#!/bin/bash

module load bioinfo/tabix-0.2.5
module load bioinfo/vcftools-0.1.16

vcf=CYP321B4.vcf

cd /home/knam/work/sfrugi_SenegalHostPlant/P450/CYP321B4

vcftools --vcf $vcf --keep ../fst/invasive --site-pi --out CYP321B4_inv
vcftools --vcf $vcf --keep ../fst/native --site-pi --out CYP321B4_nat



