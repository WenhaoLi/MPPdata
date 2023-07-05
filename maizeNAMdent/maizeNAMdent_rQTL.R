library(qtl)

# read cross files
maizeNAMdent.cross <- read.cross("csvs", ".", "maizeNAMdent_geno_4rQTL.csv", "maizeNAMdent_pheno_4rQTL.csv",
                                 crosstype = 'dh')
summary(maizeNAMdent.cross)

# explore data
plotPheno(maizeNAMdent.cross,pheno.col = 'Mons_DMY')
plot.map(maizeNAMdent.cross)

# QTL mapping (single QTL model)
maizeNAMdent.cross <- calc.genoprob(maizeNAMdent.cross)

out.em.scanone <- scanone(maizeNAMdent.cross, method="em",pheno.col = 'Mons_DMY')
plot(out.em.scanone)

# QTL mapping (composite intervel mapping)
out.em.cim <- cim(maizeNAMdent.cross, method="em",pheno.col = 'Mons_DMY')
plot(out.em.cim)

plot(out.em.scanone, out.em.cim, col=c("blue", "red"),ylab="LOD score",lty=c(1,2),main='QTL mapping for Mons_DMY')
