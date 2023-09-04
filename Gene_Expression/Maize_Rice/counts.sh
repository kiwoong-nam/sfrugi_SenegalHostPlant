#!/bin/bash

BAMD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq_2/mapping/bam'
OUTD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq_2/mapping/counts'
FA='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/ref/OGS7.0_20190530_transcripts.fa'

samples=('MORT2_MM1' 'MORT2_MM2' 'MORT2-MP' 'MORT2-MR')

for s in "${samples[@]}"; do
	salmon quant -t $FA -l A -a $BAMD/$s.sorted.bam -o $OUTD/$s
done 



