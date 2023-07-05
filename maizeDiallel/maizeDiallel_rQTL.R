library(qtl)

# read cross files (as if it were BCs by default)
maizeDiallel.cross <- read.cross("csvs", ".", "maizeDiallel_geno_4rQTL.csv", "maizeDiallel_pheno_4rQTL.csv")
summary(maizeDiallel.cross)
# convert to RILs
maizeDiallel.cross <- convert2riself(maizeDiallel.cross)

# explore data
plot(maizeDiallel.cross)

# QTL mapping (single QTL model)
maizeDiallel.cross <- calc.genoprob(maizeDiallel.cross)

out.em.scanone <- scanone(maizeDiallel.cross, method="em",pheno.col = 'GDDTA_summer')
plot(out.em.scanone)

# QTL mapping (composite intervel mapping)
out.em.cim <- cim(maizeDiallel.cross, method="em",pheno.col = 'GDDTA_summer')
plot(out.em.cim)

plot(out.em.scanone, out.em.cim, col=c("blue", "red"),ylab="LOD score",main='QTL mapping for GDDTA_summer')
