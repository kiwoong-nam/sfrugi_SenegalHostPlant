#!/bin/bash

cd /home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq_2/mapping/fq/raw

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337168.fastq.gz --basename ../filtered/MORT2_MM2 --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337169.fastq.gz --basename ../filtered/MORT2-MP --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337170.fastq.gz --basename ../filtered/MORT2-MR --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12

~/bioinformatics/adapterremoval-2.1.7/build/AdapterRemoval --file1 ERR2337167.fastq.gz --basename ../filtered/MORT2_MM1 --trimns --trimqualities --minquality 20 --gzip --gzip-level 9 --threads 12



