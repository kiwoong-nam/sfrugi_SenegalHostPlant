#!/bin/bash
#SBATCH --partition=dgimi-eha


cd /lustre/namk/processing_fq/Senegal/Senegal_raw

/nfs/work/faw_adaptation/programs/adapterremoval-2.1.7/build/AdapterRemoval --file1 /lustre/namk/processing_fq/Senegal/Senegal_raw/$1_1.fq.gz --file2 /lustre/namk/processing_fq/Senegal/Senegal_raw/$1_2.fq.gz --basename /lustre/namk/processing_fq/Senegal/Senegal_raw/$1 --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 32
#/nfs/work/faw_adaptation/programs/adapterremoval-2.1.7/build/AdapterRemoval --file1 /lustre/namk/processing_fq/sfrugi_CAS/raw_fq/D1/$1_1.fq.gz --file2 /lustre/namk/processing_fq/sfrugi_CAS/raw_fq/D1/$1_2.fq.gz --basename /lustre/durandk/Gui/FQ_truncated/$1 --trimns --trimqualities --minquality 20  --adapter1 AAGTCGGAGGCCAAGCGGTCTTAGGAAGACAA --adapter2 AAGTCGGATCGTAGCCATGTCGTTCTGTGAGCCAAGGAGTTG --gzip --gzip-level 9 --threads 32


#cutadapt -a AAGTCGGAGGCCAAGCGGTCTTAGGAAGACAA -A AAGTCGGATCGTAGCCATGTCGTTCTGTGAGCCAAGGAGTTG

