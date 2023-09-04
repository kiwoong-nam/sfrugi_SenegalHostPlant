#!/bin/bash

#Bowtie 2 version 2.4.4

FQD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq_2/mapping/fq/filtered'
REF='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/ref/OGS7.0'
OUTD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq_2/mapping/bam'

samples=('MORT2_MM2' 'MORT2-MP' 'MORT2-MR' 'MORT2_MM1')

for s in "${samples[@]}"; do
	bowtie2 --threads 8 --very-sensitive -x $REF -U $FQD/$s.truncated.gz | samtools sort -o $OUTD/$s.sorted.bam
done 











