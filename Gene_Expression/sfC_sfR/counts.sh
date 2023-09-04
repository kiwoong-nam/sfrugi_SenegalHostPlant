#!/bin/bash

BAMD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/bam'
OUTD='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/counts'
FA='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/ref/OGS7.0_20190530_transcripts.fa'

samples=('B15C' 'B16C' 'B19C' 'B1J' 'B2J' 'B3J')

for s in "${samples[@]}"; do
	salmon quant -t $FA -l A -a $BAMD/$s.sorted.bam -o $OUTD/$s
done 





