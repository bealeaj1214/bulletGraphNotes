require(ggplot2)

#grades.values.1 <-c(200,250,300)
#grades.fill=c("grey60","grey75","grey90")
#junk<-data.frame(values=c(grades.values.1[1],diff(grades.values.1)),fill=grades.fill)

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


bulletChartHor3Exp<-function(grades,title,target,measure,breaks) {
  grades.fill=c("grey60","grey75","grey90")
  grades.bars=c(grades[1],diff(grades))
  chart.grades<-data.frame(values=grades.bars,fill=grades.fill)

 p<-ggplot(chart.grades) +
   geom_bar(aes(x=1,y=values,fill=fill),width=0.2)+
     geom_bar(aes_string(x=1,y=measure),fill="black",width=0.1)+
       geom_hline(aes_string(yintercept=target))+
         scale_fill_identity()+
           theme_bw() +
             scale_x_continuous(name=title,breaks=c(2))
  
  if(missing(breaks)) {
    p<- p+ scale_y_continuous(expand=c(0,0))
  }
  else {
    p<- p+ scale_y_continuous(breaks=breaks,expand=c(0,0)) 
  }
     
  p<- p+   coord_flip() +
    opts(legend.position="none",aspect.ratio=0.10,
         panel.border = theme_blank(),
         panel.background = theme_blank(),
         panel.grid.major = theme_blank(),
         axis.text.y =theme_blank(),
         axis.title.x =theme_blank(),
         axis.title.y = theme_text(angle=0,size=10))
  
  p
}

bulletChartHor3<-function(grades,title,target,measure,breaks,base_font_size=8) {
  grades.fill=c("grey60","grey75","grey90")
  grades.bars=c(grades[1],diff(grades))
  chart.grades<-data.frame(values=grades.bars,fill=grades.fill)

 p<-ggplot(chart.grades) +
   geom_bar(aes(x=1,y=values,fill=fill),width=0.2)+
     geom_bar(aes_string(x=1,y=measure),fill="black",width=0.1)+
       geom_hline(aes_string(yintercept=target))+
         scale_fill_identity()+
           theme_bw(base_size = base_font_size) +
             scale_x_continuous(breaks=c(2))
  
  if(missing(breaks)) {
    p<- p+ scale_y_continuous(expand=c(0,0))
  }
  else {
    p<- p+ scale_y_continuous(breaks=breaks,expand=c(0,0)) 
  }
     
  p<- p+   coord_flip() +
    opts(legend.position="none",aspect.ratio=0.10,
         panel.border = theme_blank(),
         panel.background = theme_blank(),
         panel.grid.major = theme_blank(),
         axis.text.y =theme_blank(),
         axis.title.x =theme_blank(),
         axis.title.y = theme_blank(),
         opts(plot.margin = unit(c(0,.5,0,-0.6), "lines")))
  
  p
}

#print(bulleChartHor3(c(200,250,300),title="test",target=250,measure=270))
