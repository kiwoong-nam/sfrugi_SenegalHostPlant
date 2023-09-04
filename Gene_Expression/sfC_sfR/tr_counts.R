v=read.table("/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/DE/input/counts.txt",h=T)
vs=v[c(2:7)]
row.names(vs)=v$ID

write.table(vs,"/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq/DE/input/counts_tr.txt",quote=F)


