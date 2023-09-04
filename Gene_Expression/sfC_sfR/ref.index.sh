#:/bin/bash

cd /home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/mapping/ref

samtools faidx OGS7.0_20190530_transcripts.fa
bowtie2-build OGS7.0_20190530_transcripts.fa OGS7.0

