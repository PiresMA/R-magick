# Now lets do the magick
library(magick)

img <- image_read("siasd.png")
print(img)
image_write(img, path = "siasd.pdf", format = "pdf")

