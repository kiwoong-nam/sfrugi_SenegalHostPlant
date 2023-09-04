#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=40G
#SBATCH --partition=dgimi-eha

module load  jre/jre.8_x64

/nfs/work/faw_adaptation/programs/samtools-1.9/samtools index /lustre/namk/processing_fq/Senegal/bam/$1.bam

/nfs/work/faw_adaptation/programs/gatk-4.1.2.0/gatk HaplotypeCaller -R /nfs/work/faw_adaptation/ref/sfC.ver7.fa -I /lustre/namk/processing_fq/Senegal/bam/$1.bam -O /lustre/namk/processing_fq/Senegal/vcf/$1".g.vcf.gz" -ERC GVCF

