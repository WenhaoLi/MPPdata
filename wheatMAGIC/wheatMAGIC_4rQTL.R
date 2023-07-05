library(qtl)

# read cross files (as if it were BCs by default)
wheatMAGIC.cross <- read.cross("csvs", ".", "wheatMAGIC_geno_4rQTL.csv", "wheatMAGIC_pheno_4rQTL.csv")
summary(wheatMAGIC.cross)
# convert to RILs
wheatMAGIC.cross <- convert2riself(wheatMAGIC.cross)

# explore data
plot(wheatMAGIC.cross)

# QTL mapping (single QTL model)
wheatMAGIC.cross <- calc.genoprob(wheatMAGIC.cross)

out.em.scanone <- scanone(wheatMAGIC.cross, method="em",pheno.col = 'PH2015')
plot(out.em.scanone)

# QTL mapping (composite intervel mapping)
out.em.cim <- cim(wheatMAGIC.cross, method="em",pheno.col = 'PH2015')
plot(out.em.cim)

plot(out.em.scanone, out.em.cim, col=c("blue", "red"),ylab="LOD score",main='QTL mapping for PH2015')
