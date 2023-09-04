library('ggplot2')
library(gridExtra)
library(grid)

vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

v.c=read.table('/home/kiwoong/Projects/sfrugi_SenegalHostPlant/SweeD/SweeD_parsedNative.Corn',h=T)
v.g=read.table('/home/kiwoong/Projects/sfrugi_SenegalHostPlant/SweeD/SweeD_parsedSenegal.senegal',h=T)

output='/home/kiwoong/Projects/sfrugi_SenegalHostPlant/SweeD/Sweed.pdf'

#######################################################################
v.c$i=c(1:nrow(v.c))
v.g$i=c(1:nrow(v.g))

v.c$cate='Native population'
v.g$cate='Senegalese population'

v.1=rbind(v.c,v.g)
v.1$cate1=factor(v.1$cate,levels=c('Senegalese population','Native population'))

#######################################################################
## plants
vg1.1=aggregate(v.1$i,by=list(v.1$chrN),min)
vg1.2=aggregate(v.1$i,by=list(v.1$chrN),max)

vg1=merge(vg1.1,vg1.2,by="Group.1")
vg1$center=with(vg1,x.x+x.y)/2
colnames(vg1)[1]='chro'

p0=ggplot(v.1, aes(x=i, y=likelihood,color=as.factor(chrN))) +  geom_point(size = 0.3)+scale_color_manual(values = rep(c("darkslateblue","cadetblue"), nrow(v.1)))+ labs(x = 'Chromosome', y = 'composite likelihood')+ scale_x_continuous(label = vg1$chro,breaks = vg1$center)+theme_bw()+theme(legend.position = "none",panel.grid.major.x = element_blank(), panel.grid.minor.x = element_blank())+facet_grid(cate1~.)+theme(axis.text=element_text(size=14),axis.title=element_text(size=16.5),plot.title = element_text(size=23),strip.text.y = element_text(size = 20))

pdf(output,width=15/1.4,height=4*1.75)
p0
dev.off()

