#pca play
library(GEOquery)
gse = getGEO("GSE103512")[[1]]
library(SummarizedExperiment)
se = as(gse, "SummarizedExperiment")
library(SummarizedExperiment)
se = as(gse, "SummarizedExperiment")
sds = apply(assays(se)[[1]], 1, sd)
hist(sds)
se2 = se[sds>1, ]
se2
pc = prcomp(t(assays(se2)[[1]]))
summary(pc)
names(pc)
str(pc)
pc$x[1:5,1:5]
t(pc$x[1:5,1:5])
colData(se2)
barplot(pc$x[,1] ~ colData(se2)[['cancer.type.ch1']])
boxplot(pc$x[,1] ~ colData(se2)[['cancer.type.ch1']])
boxplot(pc$x[,2] ~ colData(se2)[['cancer.type.ch1']])
boxplot(pc$x[,2] ~ colData(se2)[['batch.i.ii.ch1']])
boxplot(pc$x[,1] ~ colData(se2)[['batch.i.ii.ch1']])
boxplot(pc$x[,1] ~ colData(se2)[['normal.ch1']])
boxplot(pc$x[,2] ~ colData(se2)[['normal.ch1']])
boxplot(pc$x[,3] ~ colData(se2)[['normal.ch1']])
boxplot(pc$x[,4] ~ colData(se2)[['normal.ch1']])
