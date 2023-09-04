#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/sequencing/FQ/FL/raw

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337154/ERR2337154.fastq.gz --basename ../filtered/B15C --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337155/ERR2337155.fastq.gz --basename ../filtered/B16C --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337158/ERR2337158.fastq.gz --basename ../filtered/B19C --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337159/ERR2337159.fastq.gz --basename ../filtered/B1J --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337161/ERR2337161.fastq.gz --basename ../filtered/B2J --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337162/ERR2337162.fastq.gz --basename ../filtered/B3J --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12

