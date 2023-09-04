#!/bin/bash

#Bowtie 2 version 2.4.4

FQD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/sequencing/FQ/Senegal/filtered'
REF='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/ref/OGS7.0'
OUTD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/bam'

samples=('A3' 'A4' 'A5' 'B3' 'B4' 'B5')

for s in "${samples[@]}"; do
	bowtie2 --threads 8 --very-sensitive -x $REF -1 $FQD/$s.pair1.truncated.gz -2 $FQD/$s.pair2.truncated.gz | samtools sort -o $OUTD/$s.sorted.bam
done 

