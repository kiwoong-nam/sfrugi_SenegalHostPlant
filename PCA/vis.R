library("ggplot2")

v=read.table('/home/kiwoong/Projects/sfrugi_SenegalHostPlant/PCA/table.txt')

v$group=factor(v$V1,levels=c("Senegalese","sfC","sfR","Hybrid"))

p=ggplot(v,aes(x=V4,y=V5,col=group))+geom_point(size=1)+theme_bw()+xlab("PC1, 17.94%")+ylab("PC2, 10.56%")

pdf('/home/kiwoong/Projects/sfrugi_SenegalHostPlant/PCA/PCA.pdf',width=4.5*1.5,height=3.5*1.5)
p
dev.off()



