require(ggplot2)

grades.values.1 <-c(200,250,300)
grades.fill=c("grey60","grey75","grey90")
junk<-data.frame(values=c(grades.values.1[1],diff(grades.values.1)),fill=grades.fill)

#ggplot(junk)+geom_bar(aes(x=1,y=values,fill=fill),width=0.2)+
#  geom_bar(aes(x=1,y=275),fill="black",width=0.1)+
#  geom_hline(aes(yintercept=260))+
#     scale_fill_identity()+
#     theme_bw() +
#     scale_x_continuous(name="Revenue 2005 YTD\n (US $ in thousands)",breaks=c(2))+
#     scale_y_continuous(breaks=0:6*50,expand=c(0,0)) +
#     coord_flip() +
#    opts(legend.position="none",aspect.ratio=0.10,
#                panel.border = theme_blank(),
#                panel.background = theme_blank(),
#                panel.grid.major = theme_blank(),
#                axis.text.y =theme_blank(),
#                axis.title.y = theme_text(angle=0,size=10))


bulleChartHor3<-function(grades,title,target) {
  grades.fill=c("grey60","grey75","grey90")
  grades.bars=c(grades[1],diff(grades))
  chart.grades<-data.frame(values=grades.bars,fill=grades.fill)

 p<-ggplot(chart.grades) +
   geom_bar(aes(x=1,y=values,fill=fill),width=0.2)+
     geom_bar(aes_string(x=1,y=275),fill="black",width=0.1)+
       geom_hline(aes_string(yintercept=target))+
         scale_fill_identity()+
           theme_bw() +
             scale_x_continuous(name=title,breaks=c(2))+
     scale_y_continuous(breaks=0:6*50,expand=c(0,0)) +
       coord_flip() +
    opts(legend.position="none",aspect.ratio=0.10,
         panel.border = theme_blank(),
         panel.background = theme_blank(),
         panel.grid.major = theme_blank(),
         axis.text.y =theme_blank(),
         axis.title.y = theme_text(angle=0,size=10))
  
  p
}

print(bulleChartHor3(c(200,250,300),title="test",target=250))
