#https://www.r-graph-gallery.com/212-stacked-percent-plot/

#Create data

for( i in 4:7 ){
 set.seed(16)

 png( sprintf("stacked-frequency-index%d.png",i) )

 ncol = i
 nrow = 3
 ntot = ncol*nrow

 data = matrix(sample(0:ntot,ntot) , nrow=nrow, ncol=ncol)

 colnames(data) = seq(0.1,0.1*ncol,by=0.1) - 0.1
 rownames(data) = sprintf("o%d",1:nrow)
 
 #Transform this data in %
 data_percentage=apply(data, 2, function(x){x/sum(x,na.rm=T)})
 
 head(data_percentage)
 
# Make a stacked barplot--> it will be in %!
 vcol = rainbow(nrow)

 barplot(data_percentage, col=vcol, border="white", xlab="Parameter",ylab="Relative Frequency")
 legend( 0.1, 0.99, rownames(data), fill=vcol,ncol=nrow )
 mtext(side=3,cex=1,line=0.1,bquote( index==.(i) ) )

 dev.off()

}
