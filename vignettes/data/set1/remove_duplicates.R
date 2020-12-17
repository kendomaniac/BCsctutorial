
#removing duplicated cell with inconsistent association to cell type
tmp <- read.table("VandE_set2.csv" , sep=",", header=T, row.names = 1)
tmp.n <- sapply(strsplit(names(tmp),"_"), function(x)x[1])
tmp.nd <- tmp.n[which(duplicated(tmp.n))]
tmp.ndall <- which(tmp.n %in% tmp.nd)
tmp <- tmp[, setdiff(seq(1, dim(tmp)[2]), tmp.ndall)]#544
write.table(tmp, "VandE_set2_dedup.csv", sep=",", col.names=NA)
