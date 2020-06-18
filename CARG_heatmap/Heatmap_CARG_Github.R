
# Draw the heatmap
library(pheatmap)
library(RColorBrewer)
library(grid)
library(devtools)
library(dendextend)
library(circlize)
library("ComplexHeatmap")

#--------------------------------SHIFTs 41-OTUs-AX-------------------------------------------------------------#
m<-read.table("CARGs_input.txt", header = T,row.names=1, sep = "\t")
note1 <-read.table("CARGs_note_input.txt", header = T,row.names=1, sep = "\t")



Phyla= note1$Phyla
df1 = data.frame(Phyla) 
koi1 = HeatmapAnnotation(df = df1, col =  list(Phyla = c("Bacteroidetes"   = "deepskyblue1",
                                                    "Firmicutes"      = "palegreen3",
                                                    "Actinobacteria"  = "violetred1",
                                                    "Tenericutes"     = "purple")),
                                                    which = "row", width = unit(0.5, "cm"))
draw(koi1, 1:41)

Group = note1$CARGs
df2 = data.frame(Group) 

koi2 = HeatmapAnnotation(df = df2, col = list(Group = c("CARG1"  = "red", 
                                                               "CARG2"  = "yellow",
                                                               "CARG3"  = "forestgreen",
                                                               "CARG4"  = "cyan",
                                                               "CARG5"  = "yellow4",
                                                               "CARG6" =  "pink",
                                                               "CARG7" =  "blue")),
                                                                which = "row", width = unit(0.5, "cm"))

draw(koi2, 1:41)

m = as.matrix(m)

Roy = Heatmap(m, 
              clustering_distance_columns = "euclidean",       
              clustering_distance_rows   = function(m,y) 1 - cor(m, y, method = "spearman"),
              clustering_method_rows = "complete",
              col = colorRamp2(c(-4, -2, 0, 2, 4), c("deepskyblue","navy","black","firebrick3","red"), space = "RGB"),
              column_names_side = "bottom",
              row_names_side = "right",
              row_names_gp = gpar(fontsize = 6), 
              column_names_gp = gpar(fontsize = 8),
              name ="(W6-BL) CLR",
              row_dend_side = "right"
)
Roy

koi1  + koi2 + Roy


# PERMANOVA---ANAlysis
library(vegan)
# CARG1 and CARG2
rawdata <- as.data.frame(read.table("1_2_input.txt", header=TRUE, sep="\t", row.names = 1))
Avada = c("CARGs")
rawdata_CARG = rawdata[,!(names(rawdata) %in% Avada)]
Euclidean_matrix = vegdist(rawdata_CARG, method = "euclidean")
set.seed(3107)
Lumos = adonis(Euclidean_matrix ~ CARGs, data= rawdata,permutations = 999)
print(Lumos)

# CARG3 and CARG4
rawdata <- as.data.frame(read.table("3_4_input.txt", header=TRUE, sep="\t", row.names = 1))
Avada = c("CARGs")
rawdata_CARG = rawdata[,!(names(rawdata) %in% Avada)]
Euclidean_matrix = vegdist(rawdata_CARG, method = "euclidean")
set.seed(3107)
Lumos = adonis(Euclidean_matrix ~ CARGs, data= rawdata,permutations = 999)
print(Lumos)

# CARG5 and CARG6
rawdata <- as.data.frame(read.table("5_6_input.txt", header=TRUE, sep="\t", row.names = 1))
Avada = c("CARGs")
rawdata_CARG = rawdata[,!(names(rawdata) %in% Avada)]
Euclidean_matrix = vegdist(rawdata_CARG, method = "euclidean")
set.seed(3107)
Lumos = adonis(Euclidean_matrix ~ CARGs, data= rawdata,permutations = 999)
print(Lumos)

# CARG6 and CARG7
rawdata <- as.data.frame(read.table("6_7_input.txt", header=TRUE, sep="\t", row.names = 1))
Avada = c("CARGs")
rawdata_CARG = rawdata[,!(names(rawdata) %in% Avada)]
Euclidean_matrix = vegdist(rawdata_CARG, method = "euclidean")
set.seed(3107)
Lumos = adonis(Euclidean_matrix ~ CARGs, data= rawdata,permutations = 999)
print(Lumos)

