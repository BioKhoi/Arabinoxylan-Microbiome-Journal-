
library(ggplot2)
library (vegan)
library (gtools)


data <- as.data.frame(read.table("NMDS_input1.txt", header = TRUE, sep="\t"))


metadata <- as.data.frame(read.table("NMDS_input2.txt", header=TRUE, sep="\t"))


samples_in_both <- intersect(data$samples, metadata$samples)
data <- data[data$samples %in% samples_in_both, ]
metadata <- metadata[metadata$samples %in% samples_in_both, ]

metadata <- metadata[match(data$samples, metadata$samples),]
data$samples <- factor(data$samples)
metadata$samples <- factor(metadata$samples)


mds <- metaMDS(data[,-1], distance="euclidean")

mds$points


# plot NMDS using basic plot function and color points by "Country" from metadata
plot(mds$points, col=metadata$Treatment)

# draw dispersion ellipses around data points
ordiellipse(mds, metadata$Treatment, display = "sites", kind = "sd", label = T)


# Now a fancier plot
# Data frame df_ell contains values to show ellipses. 
# It is calculated with function veganCovEllipse which is hidden in vegan package. This function is applied to each level of NMDS (group) and it uses also function cov.wt to calculate covariance matrix.
# Ideas taken from http://stackoverflow.com/questions/13794419/plotting-ordiellipse-function-from-vegan-package-onto-nmds-plot-created-in-ggplo and from Meren's script.
NMDS = data.frame(MDS1 = mds$points[,1], MDS2 = mds$points[,2], group=metadata$Treatment)
NMDS.mean=aggregate(NMDS[,1:2],list(group=metadata$Treatment),mean)

veganCovEllipse<-function (cov, center = c(0, 0), scale = 1, npoints = 100) 
{
  theta <- (0:npoints) * 2 * pi/npoints
  Circle <- cbind(cos(theta), sin(theta))
  t(center + scale * t(Circle %*% chol(cov)))
}

df_ell <- data.frame()
for(g in levels(NMDS$group)){
  df_ell <- rbind(df_ell, cbind(as.data.frame(with(NMDS[NMDS$group==g,],
            veganCovEllipse(cov.wt(cbind(MDS1,MDS2),wt=rep(1/length(MDS1),
            length(MDS1)))$cov,center=c(mean(MDS1),mean(MDS2)))))
            ,group=g))
}

###########################################################################
ggplot(data = NMDS, aes(MDS1, MDS2)) + 
  geom_point(aes(color = group,  shape = group), size = 2, stroke = 1) +
  theme_bw() +
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank()) +
  
  # Both 2 Arms  
  theme(panel.grid.major=element_line(linetype=3,color="white")) +
  scale_color_manual(values = c("purple","deepskyblue","blue", "black", "orange", "red" )) +
  geom_path(data=df_ell, aes(x=MDS1, y=MDS2,colour=group), size= 1., linetype=4) 




###########################################################################
#######################-PERMANOVA-TESTING-#################################
###########################################################################
#----------------------------------------BASELINE--------------------------
rawdata <- as.data.frame(read.table("PERMNOVA_AX.MCC_BL.txt", header=TRUE, sep="\t", row.names = 1))
Avada = c("Treatment")
rawdata_otu = rawdata[,!(names(rawdata) %in% Avada)]
Euclidean_matrix = vegdist(rawdata_otu, method = "euclidean")
set.seed(3107)
Lumos = adonis(Euclidean_matrix ~ Treatment, data= rawdata,permutations = 999)
print(Lumos)

out = capture.output(Lumos)
cat("Results_AX.MCC_Baseline", out, file = "PERMANOVA.beta_Mar13.txt", sep = "\n", append = TRUE)

#----------------------------------------WEEK1----------------------------

rawdata <- as.data.frame(read.table("PERMNOVA_AX.MCC_W1.txt", header=TRUE, sep="\t", row.names = 1))
Avada = c("Treatment")
rawdata_otu = rawdata[,!(names(rawdata) %in% Avada)]
Euclidean_matrix = vegdist(rawdata_otu, method = "euclidean")
set.seed(3107)
Lumos = adonis(Euclidean_matrix ~ Treatment, data= rawdata,permutations = 999)
print(Lumos)

out = capture.output(Lumos)
cat("Results_AX.MCC_Week1", out, file = "PERMANOVA.beta_Mar13.txt", sep = "\n", append = TRUE)

#----------------------------------------WEEK6----------------------------


rawdata <- as.data.frame(read.table("PERMNOVA_AX.MCC_W6.txt", header=TRUE, sep="\t", row.names = 1))
Avada = c("Treatment")
rawdata_otu = rawdata[,!(names(rawdata) %in% Avada)]
Euclidean_matrix = vegdist(rawdata_otu, method = "euclidean")
set.seed(3107)
Lumos = adonis(Euclidean_matrix ~ Treatment, data= rawdata,permutations = 999)
print(Lumos)

out = capture.output(Lumos)
cat("Results_AX.MCC_Week6", out, file = "PERMANOVA.beta_Mar13.txt", sep = "\n", append = TRUE)



