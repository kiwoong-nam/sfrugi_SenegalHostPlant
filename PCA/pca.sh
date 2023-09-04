#!/bin/bash
#SBATCH --partition=dgimi-eha
#SBATCH --mem=20G

vcf=/storage/simple/projects/faw_adaptation/Sudee/Senegal/vcf/Senegal.SNP.filtered.recode.vcf.gz

cd /storage/simple/projects/faw_adaptation/Sudee/Senegal/PCA/wholegenomepca

/storage/simple/projects/faw_adaptation/programs/vcftools_0.1.13/bin/vcftools --gzvcf /storage/simple/projects/faw_adaptation/Sudee/Senegal/vcf/Senegal.SNP.filtered.recode.vcf.gz --plink --out Senegal.invasive

/storage/simple/projects/faw_adaptation/programs/plink1.9/plink --file Senegal.invasive --make-bed --out Senegal.invasive

/storage/simple/projects/faw_adaptation/programs/plink1.9/plink --bfile Senegal.invasive --pca 10 --out Senegal.invasive --mind
