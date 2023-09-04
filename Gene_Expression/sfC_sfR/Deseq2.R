library(DESeq2)

counts_data=read.table("counts_tr.txt")
colData=read.table("sample.txt")

####################
all(colnames(counts_data) %in% rownames(colData))
#TRUE

all(colnames(counts_data) == rownames(colData))
#TRUE


####################
dds=DESeqDataSetFromMatrix(countData=counts_data,colData=colData,design = ~ strain)
keep = rowSums(counts(dds)) >=100
dds=dds[keep,]

dds$strain=relevel(dds$strain,ref='rice')
dds=DESeq(dds)
res=results(dds)
res0.05=results(dds,alpha=0.05)

####################
pdf("../DE.pdf",height=6,width=10)
plotMA(res0.05)
dev.off()

write.table(res0.05,"../SWP/expression.txt",quote=F,sep="\t")




