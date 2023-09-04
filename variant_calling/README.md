remove_adaptator_senegal.sh
	: Removing adapter sequences and low quality base papers from raw reads

Sf.mapping.Senegal.sh
	: Performing mapping against reference genomes

gatk.Senegal.sh
	: Haplotype Calling using gatk
	
Senegal_merged.sh
	: Merging gvcf files into one
	
variant_calling/j*
	: performing variant calling for each chromosome
	
filtering/j*
	: performing variant filtering for each chromosome

mergeSNPvcf.sh
	: concatenating vcf files into one
