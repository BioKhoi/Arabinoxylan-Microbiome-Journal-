library(ggplot2)

data(mpg, package="ggplot2")

mpg <- read.csv("template_Sig_taxa.csv")

Percent = mpg$Absolute.Change
Response = as.factor(mpg$Type)

p = ggplot(mpg, aes(Sample,Taxa, color=Response, shape=Response, fill=Response)) +
  geom_point(aes(size=Percent)) +
  scale_color_manual(values = c("black", "red","black")) +
  scale_shape_manual(values = c(21,21,4)) +
  scale_fill_manual (values = c("black", "orangered","black")) +
  scale_size(range = c(0.01, 12)) +
  theme_bw() +
  theme(panel.grid.major=element_line(linetype=3,color="white"), 
       
        axis.text.y = element_text(size = 14),
        axis.text.x = element_text(size = 12), 
        legend.text = element_text(size = 18),
        legend.position = "bottom")
plot(p)
