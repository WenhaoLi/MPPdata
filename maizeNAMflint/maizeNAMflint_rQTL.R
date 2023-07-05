library(qtl)

# read cross files
maizeNAMflint.cross <- read.cross("csvs", ".", "maizeNAMflint_geno_4rQTL.csv", "maizeNAMflint_pheno_4rQTL.csv",
                                 crosstype = 'dh')
summary(maizeNAMflint.cross)

# explore data
plotPheno(maizeNAMflint.cross,pheno.col = 'DMY_LaCoruna')
plot.map(maizeNAMflint.cross)

# QTL mapping (single QTL model)
maizeNAMflint.cross <- calc.genoprob(maizeNAMflint.cross)

out.em.scanone <- scanone(maizeNAMflint.cross, method="em",pheno.col = 'DMY_LaCoruna')
plot(out.em.scanone)

# QTL mapping (composite intervel mapping)
out.em.cim <- cim(maizeNAMflint.cross, method="em",pheno.col = 'DMY_LaCoruna')
plot(out.em.cim)

plot(out.em.scanone, out.em.cim, col=c("blue", "red"),ylab="LOD score",lty=c(1,2),main='QTL mapping for DMY_LaCoruna')
