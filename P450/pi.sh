#!/bin/bash

module load bioinfo/tabix-0.2.5
module load bioinfo/vcftools-0.1.16

vcf1=/home/knam/work/sfrugi_SenegalHostPlant/P450/vcf/SFRUCORN70000026001.vcf
vcf2=/home/knam/work/sfrugi_SenegalHostPlant/P450/vcf/SFRUCORN70000026004.vcf

cd /home/knam/work/sfrugi_SenegalHostPlant/P450/fst

vcftools --vcf $vcf1 --keep invasive --site-pi --out SFRUCORN70000026001_inv
vcftools --vcf $vcf2 --keep invasive --site-pi --out SFRUCORN70000026004_inv

vcftools --vcf $vcf1 --keep native --site-pi --out SFRUCORN70000026001_native
vcftools --vcf $vcf2 --keep native --site-pi --out SFRUCORN70000026004_native


