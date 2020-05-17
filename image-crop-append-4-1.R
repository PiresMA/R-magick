library(magick)

part1 <- image_read("stacked-frequency-index4.png")
part2 <- image_read("stacked-frequency-index5.png")
part3 <- image_read("stacked-frequency-index6.png")
part4 <- image_read("stacked-frequency-index7.png")

img_app1 = image_append( c(part1,part2) )
img_app2 = image_append( c(part3,part4) )

img_crp1 = image_crop(img_app1, "0x0+0-30")
img_crp2 = image_crop(img_app2, "0x0+0-30")

img_app3 = image_append(c(img_crp1,img_crp1) , stack = TRUE )

image_write( img_app3, path = "image-crop-4-1.pdf", format = "pdf")

