library(qtl)

# read cross files
tomatoMAGIC.cross <- read.cross("csvs", ".", "tomatoMAGIC_geno_4rQTL.csv", "tomatoMAGIC_pheno_4rQTL.csv",
                                 crosstype = 'f4')
summary(tomatoMAGIC.cross)

# explore data
plotPheno(tomatoMAGIC.cross,pheno.col = 'FW_locA')
plot.map(tomatoMAGIC.cross)

# QTL mapping (single QTL model)
tomatoMAGIC.cross <- calc.genoprob(tomatoMAGIC.cross)

out.em.scanone <- scanone(tomatoMAGIC.cross, method="em",pheno.col = 'FW_locA')
plot(out.em.scanone)

# QTL mapping (composite intervel mapping)
out.em.cim <- cim(tomatoMAGIC.cross, method="em",pheno.col = 'FW_locA')
plot(out.em.cim)

plot(out.em.scanone, out.em.cim, col=c("blue", "red"),ylab="LOD score",lty=c(1,2),main='QTL mapping for FW_locA')
