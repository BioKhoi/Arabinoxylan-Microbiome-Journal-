
library("ComplexHeatmap")
library(pheatmap)
library(RColorBrewer)
library(grid)
library(devtools)
library(dendextend)
library(circlize)

  ### Diet & SCFA for both AX and MCC
m<-read.delim("AICC_ms_diet.txt", header = T, row.names = 1, sep = "\t")

Diet       = Heatmap(as.matrix(m), name = "AICc Level (%)", na_col = "grey90",
                   col = colorRamp2(c( 100, 97.5, 95, 92.5, 90),  c("white","lightpink1","hotpink","violetred2","red3"), space = "RGB"),
                   cluster_columns = FALSE,
                   cluster_rows    = FALSE,
                   column_names_side = "top",
                   row_names_side = "right",
                   row_names_gp = gpar(fontsize = 8), 
                   column_names_gp = gpar(fontsize = 8),
                   row_dend_side = "right",
                   border = TRUE,
                  rect_gp = gpar(col = "white", lwd = 1.5)
)

Diet



# Stool consistency AUC  and BM frenquency AUC

m<-read.delim("/Users/Nguyenphuong/Documents/Shanenguyen/MSc_study_R/FYBER/Arabino/LinearMixed/AICC_SCFA_stool.txt", header = T, row.names = 1, sep = "\t")

AUC       = Heatmap(as.matrix(m), name = "AICc Level (%)", na_col = "grey90",
                     col = colorRamp2(c( 100, 97.5, 95, 92.5, 90),  c("white","lightpink1","hotpink","violetred2","red3"), space = "RGB"),
                     cluster_columns = FALSE,
                     cluster_rows    = FALSE,
                     column_names_side = "top",
                     row_names_side = "right",
                     row_names_gp = gpar(fontsize = 8), 
                     column_names_gp = gpar(fontsize = 8),
                     row_dend_side = "right",
                     border = TRUE,
                     rect_gp = gpar(col = "white", lwd = 1.5)
)

AUC


# Propionate heatmap 

m<-read.delim("AICC_ms_final_propi_may6.txt", header = T, row.names = 1, sep = "\t")


Propionate       = Heatmap(as.matrix(m), name = "AICc Level (%)", na_col = "grey90",
                    col = colorRamp2(c( 100, 97, 94, 91, 88),  c("white","lightpink1","hotpink","violetred2","red3"), space = "RGB"),
                    cluster_columns = FALSE,
                    cluster_rows    = FALSE,
                    column_names_side = "top",
                    row_names_side = "right",
                    row_names_gp = gpar(fontsize = 8), 
                    column_names_gp = gpar(fontsize = 8),
                    row_dend_side = "right",
                    border = TRUE,
                    rect_gp = gpar(col = "white", lwd = 1.5)
)

Propionate


# Acetate heatmap 

m<-read.delim("AICC_ms_final_ace_may9.txt", header = T, row.names = 1, sep = "\t")


Acetate       = Heatmap(as.matrix(m), name = "AICc Level (%)", na_col = "grey90",
                      col = colorRamp2(c( 100, 97, 94, 91, 88),  c("white","lightpink1","hotpink","violetred2","red3"), space = "RGB"),
                      cluster_columns = FALSE,
                      cluster_rows    = FALSE,
                      column_names_side = "top",
                      row_names_side = "right",
                      row_names_gp = gpar(fontsize = 8), 
                      column_names_gp = gpar(fontsize = 8),
                      row_dend_side = "right",
                      border = TRUE,
                      rect_gp = gpar(col = "white", lwd = 1.5)
)

Acetate







# Buty heatmap

m<-read.delim("AICC_ms_final_buty_may9.txt", header = T, row.names = 1, sep = "\t")

Butyrate       = Heatmap(as.matrix(m), name = "AICc Level (%)", na_col = "grey90",
                        col = colorRamp2(c( 100, 97, 94, 91, 88),  c("white","lightpink1","hotpink","violetred2","red3"), space = "RGB"),
                        cluster_columns = FALSE,
                        cluster_rows    = FALSE,
                        column_names_side = "top",
                        row_names_side = "right",
                        row_names_gp = gpar(fontsize = 8), 
                        column_names_gp = gpar(fontsize = 8),
                        row_dend_side = "right",
                        border = TRUE,
                        rect_gp = gpar(col = "white", lwd = 1.5)
)

Butyrate

