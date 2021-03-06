#https://www.labome.com/method/T-Cell-Markers-and-B-Cell-Markers.html

setwd( "/Users/raffaelecalogero/Desktop/pbmc/pbmc_NextGEM")
v3.1 <- read.table("matrix.csv", sep=",", header=T, row.names=1)
v3.1_ab <- v3.1[setdiff(seq(1:dim(v3.1)[1]), grep("ENSG", rownames(v3.1))),]
hist(log2(unlist(v3.1_ab) + 1))
write.table(v3.1_ab, "v3.1_ab.csv", sep=",", col.names=NA)

cls3.1 <- read.table("/Users/raffaelecalogero/Desktop/pbmc/pbmc_NextGEM/VandE/Results/VandE/10/VandE_clustering.output.csv", sep=",", header=T, row.names=1)

v3.1_ab <- v3.1_ab[,which(names(v3.1_ab)%in%rownames(cls3.1))]#536

#mono classical CD14+ CD16-
cd14 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD14"),]) + 1)
cd16 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD16"),]) + 1)
plot(cd14, cd16, pch=19, cex=0.5)
abline(v=6.5, col="red")
abline(h=4.2, col="red")
v3.1_ab_cd14pc16m.cells <- intersect(names(cd14)[which(cd14 >= 6.5)], names(cd16)[which(cd16 <= 4.2)])#728

v3.1_mono <- v3.1[,which(names(v3.1)%in%v3.1_ab_cd14pc16m.cells)]
names(v3.1_mono) <- paste(names(v3.1_mono), "_M", sep="")


#NK CD56+ CD34-
cd56 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD56"),]) + 1)
cd34 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD34"),]) + 1)
plot(cd56, cd34, pch=19, cex=0.5)
abline(v=5.3, col="red")
abline(h=0.5, col="red")
v3.1_ab_cd56pc34m.cells <- intersect(names(cd56)[which(cd56 >= 5.3)], names(cd34)[which(cd34 <= 0.5)])#198

v3.1_nk <- v3.1[,which(names(v3.1)%in%v3.1_ab_cd56pc34m.cells)]
names(v3.1_nk) <- paste(names(v3.1_nk), "_NK", sep="")

#CD4+CD25+ Treg cd127-
#https://en.wikipedia.org/wiki/Regulatory_T_cell
cd4 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD4"),]) + 1)
cd25 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD25"),]) + 1)
plot(cd4, cd25, pch=19, cex=0.5)
abline(v=8.7, col="red")
abline(h=4, col="red")
v3.1_ab_cd4pc25p.cells <- intersect(names(cd4)[which(cd4 >= 8.7)], names(cd25)[which(cd25 >= 4)])#274

v3.1_tr <- v3.1[,which(names(v3.1)%in%v3.1_ab_cd4pc25p.cells)]
names(v3.1_tr) <- paste(names(v3.1_tr), "_TR", sep="")


#CD4+CD45RO+ccr7+ Tmem  CD197
#https://en.wikipedia.org/wiki/Memory_T_cell
cd4 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD4"),]) + 1)
cd45RO <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD45RO"),]) + 1)
plot(cd4, cd45RO, pch=19, cex=0.5)
abline(v=8.7, col="red")
abline(h=4.5, col="red")
v3.1_ab_cd4pc45rop.cells <- intersect(names(cd4)[which(cd4 >= 8.7)], names(cd45RO)[which(cd45RO >= 4.5)])#890
v3.1_ab_c4pcd45rop <- v3.1_ab[,which(names(v3.1_ab)%in%v3.1_ab_cd4pc45rop.cells)]
cd197 <- log2(unlist(v3.1_ab_c4pcd45rop[which(rownames(v3.1_ab_c4pcd45rop)=="CD197"),]) + 1)
hist(cd197)
v3.1_ab_cd4pcd45ropcd197p.cells <-names(cd197)[which(cd197 >=4)]#79

v3.1_tmem <- v3.1[,which(names(v3.1)%in%v3.1_ab_cd4pcd45ropcd197p.cells)]
names(v3.1_tmem) <- paste(names(v3.1_tmem), "_TM", sep="")


#CD19 B cell
#cd19 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD19"),]) + 1)
#hist(cd19)
#abline(v=7, col="red")
#v3.1_ab_cd19p.cells <- names(cd19)[which(cd19 >= 7)]#337

#CD19+CD20+ B cell
cd19 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD19"),]) + 1)
cd20 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD20"),]) + 1)
plot(cd19, cd20, pch=19, cex=0.5)
abline(v=7, col="red")
abline(h=6, col="red")
v3.1_ab_cd19pcd20.cells <- intersect(names(cd19)[which(cd19 >= 7)], names(cd20)[which(cd20 >= 6)])#332

v3.1_b <- v3.1[,which(names(v3.1)%in%v3.1_ab_cd19pcd20.cells)]
names(v3.1_b) <- paste(names(v3.1_b), "_B", sep="")#332


#cd8+cd45ra+ccr7+ (CD197) naive T
#
cd8 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD8a"),]) + 1)
cd45RA <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD45RA"),]) + 1)
plot(cd8, cd45RA, pch=19, cex=0.5)
abline(v=6.5, col="red")
abline(h=6.5, col="red")
v3.1_ab_cd8pc45rap.cells <- intersect(names(cd4)[which(cd8 >= 6.5)], names(cd45RA)[which(cd45RA >= 6.5)])#169
v3.1_ab_c8pcd45rap <- v3.1_ab[,which(names(v3.1_ab)%in%v3.1_ab_cd8pc45rap.cells)]
cd197 <- log2(unlist(v3.1_ab_c8pcd45rap[which(rownames(v3.1_ab_c8pcd45rap)=="CD197"),]) + 1)
hist(cd197)
v3.1_ab_cd8pcd45rapcd197p.cells <-names(cd197)[which(cd197 >=3)]#125

v3.1_n <- v3.1[,which(names(v3.1)%in%v3.1_ab_cd8pcd45rapcd197p.cells)]
names(v3.1_n) <- paste(names(v3.1_n), "_N", sep="")#

set1 <- data.frame(v3.1_mono[, 1:100], v3.1_nk[,1:100], v3.1_tr[,1:100], v3.1_tmem, v3.1_b[,1:100], v3.1_n[,1:100])
write.table(set1, "set1.csv", sep=",", col.names=NA)

#cd8+cd45ra-ccr7+  central T memory too few
#cd8+cd45ra-ccr7- Teff too few


setwd( "/Users/raffaelecalogero/Desktop/pbmc/pbmc_v3_chemistry")
v3.0 <- read.table("matrix.csv", sep=",", header=T, row.names=1)
v3.0_ab <- v3.0[setdiff(seq(1:dim(v3.0)[1]), grep("ENSG", rownames(v3.0))),]
hist(log2(unlist(v3.0_ab) + 1))
write.table(v3.0_ab, "v3.0_ab.csv", sep=",", col.names=NA)

cls3.0 <- read.table("/Users/raffaelecalogero/Desktop/pbmc/pbmc_v3_chemistry/VandE/Results/VandE/8/VandE_clustering.output.csv", sep=",", header=T, row.names=1)

v3.0_ab <- v3.0_ab[,which(names(v3.0_ab)%in%rownames(cls3.0))]#removing low quality cells

#mono classical CD14+ CD16-
cd14 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD14"),]) + 1)
cd16 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD16"),]) + 1)
plot(cd14, cd16, pch=19, cex=0.5)
abline(v=6.5, col="red")
abline(h=4.2, col="red")
v3.0_ab_cd14pc16m.cells <- intersect(names(cd14)[which(cd14 >= 6.5)], names(cd16)[which(cd16 <= 4.2)])#771

v3.0_mono <- v3.0[,which(names(v3.0)%in%v3.0_ab_cd14pc16m.cells)]
names(v3.0_mono) <- paste(names(v3.0_mono), "_M", sep="")


#NK CD56+ CD34-
cd56 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD56"),]) + 1)
cd34 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD34"),]) + 1)
plot(cd56, cd34, pch=19, cex=0.5)
abline(v=5.3, col="red")
abline(h=0.5, col="red")
v3.0_ab_cd56pc34m.cells <- intersect(names(cd56)[which(cd56 >= 5.3)], names(cd34)[which(cd34 <= 0.5)])#197

v3.0_nk <- v3.0[,which(names(v3.0)%in%v3.0_ab_cd56pc34m.cells)]
names(v3.0_nk) <- paste(names(v3.0_nk), "_NK", sep="")

#CD4+CD25+ Treg cd127-
#https://en.wikipedia.org/wiki/Regulatory_T_cel
cd4 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD4"),]) + 1)
cd25 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD25"),]) + 1)
plot(cd4, cd25, pch=19, cex=0.5)
abline(v=8.7, col="red")
abline(h=4, col="red")
v3.0_ab_cd4pc25p.cells <- intersect(names(cd4)[which(cd4 >= 8.7)], names(cd25)[which(cd25 >= 4)])#264

v3.0_tr <- v3.0[,which(names(v3.0)%in%v3.0_ab_cd4pc25p.cells)]
names(v3.0_tr) <- paste(names(v3.0_tr), "_TR", sep="")


#CD4+CD45RO+ccr7+ Tmem  CD197
#https://en.wikipedia.org/wiki/Memory_T_cell
cd4 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD4"),]) + 1)
cd45RO <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD45RO"),]) + 1)
plot(cd4, cd45RO, pch=19, cex=0.5)
abline(v=8.7, col="red")
abline(h=4.7, col="red")
v3.0_ab_cd4pc45rop.cells <- intersect(names(cd4)[which(cd4 >= 8.7)], names(cd45RO)[which(cd45RO >= 4.7)])#861
v3.0_ab_c4pcd45rop <- v3.0_ab[,which(names(v3.0_ab)%in%v3.0_ab_cd4pc45rop.cells)]
cd197 <- log2(unlist(v3.0_ab_c4pcd45rop[which(rownames(v3.0_ab_c4pcd45rop)=="CD197"),]) + 1)
hist(cd197)
v3.0_ab_cd4pcd45ropcd197p.cells <-names(cd197)[which(cd197 >=4)]#133

v3.0_tmem <- v3.0[,which(names(v3.0)%in%v3.0_ab_cd4pcd45ropcd197p.cells)]
names(v3.0_tmem) <- paste(names(v3.0_tmem), "_TM", sep="")


#CD19 B cell
#cd19 <- log2(unlist(v3.1_ab[which(rownames(v3.1_ab)=="CD19"),]) + 1)
#hist(cd19)
#abline(v=7, col="red")
#v3.1_ab_cd19p.cells <- names(cd19)[which(cd19 >= 7)]#337

#CD19+CD20+ B cell
cd19 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD19"),]) + 1)
cd20 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD20"),]) + 1)
plot(cd19, cd20, pch=19, cex=0.5)
abline(v=7, col="red")
abline(h=6, col="red")
v3.0_ab_cd19pcd20.cells <- intersect(names(cd19)[which(cd19 >= 7)], names(cd20)[which(cd20 >= 6)])#298

v3.0_b <- v3.0[,which(names(v3.0)%in%v3.0_ab_cd19pcd20.cells)]
names(v3.0_b) <- paste(names(v3.0_b), "_B", sep="")#


#cd8+cd45ra+ccr7+ (CD197) naive T
#
cd8 <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD8a"),]) + 1)
cd45RA <- log2(unlist(v3.0_ab[which(rownames(v3.0_ab)=="CD45RA"),]) + 1)
plot(cd8, cd45RA, pch=19, cex=0.5)
abline(v=6.5, col="red")
abline(h=7.8, col="red")
v3.0_ab_cd8pc45rap.cells <- intersect(names(cd4)[which(cd8 >= 6.5)], names(cd45RA)[which(cd45RA >= 7.8)])#125
v3.0_ab_c8pcd45rap <- v3.0_ab[,which(names(v3.0_ab)%in%v3.0_ab_cd8pc45rap.cells)]
cd197 <- log2(unlist(v3.0_ab_c8pcd45rap[which(rownames(v3.0_ab_c8pcd45rap)=="CD197"),]) + 1)
hist(cd197)
v3.0_ab_cd8pcd45rapcd197p.cells <-names(cd197)[which(cd197 >=3)]#107

v3.0_n <- v3.0[,which(names(v3.0)%in%v3.0_ab_cd8pcd45rapcd197p.cells)]
names(v3.0_n) <- paste(names(v3.0_n), "_N", sep="")#

set2 <- data.frame(v3.0_mono[, 1:100], v3.0_nk[,1:100], v3.0_tr[,1:100], v3.0_tmem[,1:100], v3.0_b[,1:100], v3.0_n[,1:100])
write.table(set2, "set2.csv", sep=",", col.names=NA)


#CD4+ T helper
#CD34 HSC
#CD8+ Cytotoxic T
#CD56+ NK
#CD14+ Monocytes
#CD8+/CD45RA+ Naive Cytotoxic T
#CD4+/CD25+ T reg
#CD4+/CD45RA+/CD25- Naive T 