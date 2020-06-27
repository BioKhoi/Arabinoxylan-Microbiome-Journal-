


library(ggplot2)
library(ggridges)
library(ggExtra)
library(ggpubr)

Cause <- read.table("BIG_micro_SCFA_clinic_AX_Github.txt", header=TRUE, sep="\t")

#------------------------------------------------------------------------
PPlot = ggscatter(Cause, 
                  x = "CARG1.W1_BL", 
                  y = "Propionate.W6_BL",
                  add = "reg.line",                                          
                  conf.int = TRUE, fullrange = FALSE,                      
                  color = "Propionate.W6_BL", 
                  add.params = list(color = "#030303",fill = "#FFB6C1"),
                  size = "Propionate.W6_BL",
                  alpha = 0.7) +
                  scale_size(range = c(3, 10)) + 
                  gradient_color(c("#9F79EE", "#FF34B3", "#FF0000"))
ggpar(PPlot, ylim = c(-40, 75), legend = "bottom") +  
ggpubr::font("xy.text", size = 22, color = "#1A1A1A")


#------------------------------------------------------------------------
PPlot = ggscatter(Cause, 
                  x = "All.OTU.BL_PC1",
                  y = "Propionate.W6_BL",
                  add = "reg.line",                                           
                  conf.int = TRUE, fullrange = FALSE,                        
                  color = "Propionate.W6_BL", 
                  add.params = list(color = "#030303", fill = "#FFB6C1"),
                  size = "Propionate.W6_BL",
                  alpha = 0.6) +
                  scale_size(range = c(3, 10)) + 
                  gradient_color(c("#9F79EE", "#FF34B3", "#FF0000"))
ggpar(PPlot, ylim = c(-40, 75), legend = "bottom") +  
ggpubr::font("xy.text", size = 22, color = "#1A1A1A")


#------------------------------------------------------------------------
PPlot = ggscatter(Cause, 
                  x = "CARG1.W6_BL", 
                  y = "Propionate.W6_BL",
                  add = "reg.line",
                  conf.int = TRUE, fullrange = FALSE,                         
                  color = "Propionate.W6_BL", 
                  add.params = list(color = "#030303",fill = "#FFB6C1"),
                  size = "Propionate.W6_BL",
                  alpha = 0.7) +
                  scale_size(range = c(3, 10)) + 
                  gradient_color(c("#9F79EE", "#FF34B3", "#FF0000"))
ggpar(PPlot, ylim = c(-40, 75),legend = "bottom") +  
ggpubr::font("xy.text", size = 22, color = "black")



