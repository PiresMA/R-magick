# First lets export a blank page
namewhite = 'white.png'
png(namewhite,width = 900, height = 500 )
plot(1:2,1:2,type='n',axes=F, ann=F) 
dev.off()


# Now lets do the magick
library(magick)


part1 = image_read("stacked-frequency-index4.png")
part1=image_annotate(part1, "(a)", size=20, degrees=0, location="+200+38")

part2 = image_read("stacked-frequency-index5.png")
part2=image_annotate(part2, "(b)", size=20, degrees=0, location="+200+38")

part3 = image_read("stacked-frequency-index6.png")
part3=image_annotate(part3, "(c)", size=20, degrees=0, location="+200+40")

img_app   = image_append( c(part1,part2) )

blankpage = image_read(namewhite)
blankpage = image_scale(blankpage, "1000")

img_comp1 = image_composite(blankpage, img_app, offset = "+30+0")
img_comp2 = image_composite(blankpage,   part2, offset = "+300+0")

img_app2  = image_append(c(img_comp1,img_comp2) , stack=TRUE) 

image_write(img_app2, path = "fig-3-1.pdf", format = "pdf")

Sys.sleep(3)
if (file.exists(namewhite)) 
  #Delete file if it exists
  file.remove(namewhite)

