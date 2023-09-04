sfC_sfR
	fl.fqfilter.sh: removing adapter sequences and low-quality bases in raw reads from natural populations in Florida
	ref.index.sh: indexing the gene annotation
	mapping.FL.sh: performing mapping of the reads from Florida samples against the gene annotation
	mapping.Senegal.sh: performing mapping the reads from Senegalize samples against the gene annotation
	counts.sh: counting the mapping result using salmon
	prepcounts.pl:  parsing the counting result
	tr_counts.R: transposing the counting result
	Deseq2.R: running DESeq2 to identify genes overexpressed in sfC compared with sfR
	DE_SWP.pl: finding overexpressed genes in sfC within selectively swept loci
	RandomTest.pl: performing randomization test to test if the number of host-plant genes within selectively swept loci can be explained by chance
	
Maize_Rice
	fq_filtering.sh: removing adapter sequences and low-quality bases in raw reads from lab strain
	mapping.sh: performing mapping the reads against the gene annotation
	counts.sh: counting the mapping result using salmon
	prepcounts.pl:  parsing the counting result
	tr_counts.R: transposing the counting result
	Deseq2_r.R: running DESeq2 to identify genes overexpressed on maize or rice
	DE_swp.pl: finding overexpressed genes on maize within selectively swept loci
	

