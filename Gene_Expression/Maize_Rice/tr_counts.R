v=read.table("/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq_2/DE/input/counts.txt",h=T)

vp=v[c(5,2,4)]
row.names(vp)=v$ID

vr=v[c(5,2,3)]
row.names(vr)=v$ID

write.table(vp,"/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq_2/DE/input/counts_p.txt",quote=F)
write.table(vr,"/home/kiwoong/Projects/sfrugi_SenegalHostPlant/RNA_seq_2/DE/input/counts_r.txt",quote=F)


