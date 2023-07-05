library(qtl)

# read cross files
soybeanNAM.cross <- read.cross("csvs", ".", "soybeanNAM_geno_4rQTL.csv", "soybeanNAM_pheno_4rQTL.csv",
                                 crosstype = 'f2')
summary(soybeanNAM.cross)

# explore data
plotPheno(soybeanNAM.cross,pheno.col = 'mean_seedWT')
plot.map(soybeanNAM.cross)

# QTL mapping (single QTL model)
soybeanNAM.cross <- calc.genoprob(soybeanNAM.cross)

out.em.scanone <- scanone(soybeanNAM.cross, method="em",pheno.col = 'mean_seedWT')
plot(out.em.scanone)

# QTL mapping (composite intervel mapping)
out.em.cim <- cim(soybeanNAM.cross, method="em",pheno.col = 'mean_seedWT')
plot(out.em.cim)

plot(out.em.scanone, out.em.cim, col=c("blue", "red"),ylab="LOD score",lty=c(1,2),main='QTL mapping for mean_seedWT')
