#!/bin/bash

#Bowtie 2 version 2.4.4

FQD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/sequencing/FQ/FL/filtered'
REF='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/ref/OGS7.0'
OUTD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/bam'

samples=('B15C' 'B16C' 'B19C' 'B1J' 'B2J' 'B3J')

for s in "${samples[@]}"; do
	bowtie2 --threads 8 --very-sensitive -x $REF -U $FQD/$s.truncated.gz | samtools sort -o $OUTD/$s.sorted.bam
done 






