

library(factoextra)
library(FactoMineR)
library(MASS)
library(ggplot2) 
library (vegan)
library(ggridges)
library(ggExtra)
library(ggpubr)
library(dendextend)

# Figure 6: AX group: 100 OTU relative abundance (W6-BL): Propionate Clusters

rawdata <- as.data.frame(read.table("AX_Shift_100_%_Github.txt", header=TRUE, sep="\t", row.names = 1))
rawdata.PCA = rawdata[,5:104]

#-----------------------------------------------------------------------------------
ClrPCA = PCA(rawdata.PCA)
fviz_eig(ClrPCA,addlabels = TRUE, ylim = c(0, 50))
groups = as.factor(rawdata$Cluster_Propionate[1:15])
#-----------------------------------------------------------------------------------

bi.p = fviz_pca_biplot(
  ClrPCA, geom.ind = "point",
  geom.var         = c("arrow","text"),
  axes             = c(1,2),
  repel            = TRUE,
  select.var       = list(cos2 = 5),
  arrowsize        = 0.8, labelsize = 5,
  col.var          = "blue", 
  col.ind          = groups, 
  pointshape       = 16, pointsize = 4,
  palette          = c( "black", "orangered1"),
  addEllipses      = TRUE,
  ellipse.type     = "confidence",
  legend.title     = "Groups",
  mean.point       = FALSE
)

# Figure 6: AX group: 15 OTU relative abundance (W6-BL): Propionate Clusters

rawdata <- as.data.frame(read.table("AX_15_OTU_wk6_BL_%_Github.txt", header=TRUE, sep="\t", row.names = 1))
rawdata.PCA = rawdata[,5:19]

#-----------------------------------------------------------
ClrPCA = PCA(rawdata.PCA)
fviz_eig(ClrPCA,addlabels = TRUE, ylim = c(0, 50))
groups = as.factor(rawdata$Cluster_Propionate[1:15])
#------------------------------------------------------------
  
  bi.p = fviz_pca_biplot(
  ClrPCA, geom.ind = "point",
  geom.var         = c("arrow","text"),
  axes             = c(1,2),
  repel            = TRUE,
  select.var       = list(cos2 = 5),
  arrowsize        = 0.8, labelsize = 5,
  col.var          = "blue", 
  col.ind          = groups, 
  pointshape       = 16, pointsize = 4,
  palette          = c( "black", "orangered1"),
  addEllipses      = TRUE,
  ellipse.type     = "confidence",
  legend.title     = "Groups",
  mean.point       = FALSE

)


# Figure 6: AX group: CARGs relative abundance (W6-BL): Propionate Clusters

rawdata <- as.data.frame(read.table("AX_CARGs_%_W6_BL_Github.txt", header=TRUE, sep="\t", row.names = 1))
rawdata.PCA = rawdata[,5:11]

#---------------------------------------------------------------------
ClrPCA = PCA(rawdata.PCA)
fviz_eig(ClrPCA,addlabels = TRUE, ylim = c(0, 50))
groups = as.factor(rawdata$Cluster_Propionate[1:15])
#---------------------------------------------------------------------

  bi.p = fviz_pca_biplot(
  ClrPCA, 
  geom.ind         = "point",
  geom.var         = c("arrow","text"),
  axes             = c(1,2),
  repel            = TRUE,
  select.var       = list(cos2 = 5),
  arrowsize        = 0.8, labelsize = 5,
  col.var          = "blue", 
  col.ind          = groups, 
  pointshape       = 16, pointsize = 4,
  palette          = c( "black", "orangered1"),
  addEllipses      = TRUE,
  ellipse.type     = "confidence",
  legend.title     = "Groups",
  mean.point       = FALSE
  
)







