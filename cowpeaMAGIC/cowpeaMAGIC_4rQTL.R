library(qtl)

# read cross files (as if it were BCs by default)
cowpeaMAGIC <- read.cross("csvs", ".", "cowpeaMAGIC_geno_4rQTL.csv", "cowpeaMAGIC_pheno_4rQTL.csv")

# convert to RILs
cowpeaMAGIC <- convert2riself(cowpeaMAGIC)
summary(cowpeaMAGIC)

# explore data
plotPheno(cowpeaMAGIC,pheno.col = 'FT_fi_s')
plot.map(cowpeaMAGIC)

# QTL mapping (single QTL model)
cowpeaMAGIC <- calc.genoprob(cowpeaMAGIC)

out.em.scanone <- scanone(cowpeaMAGIC, method="em",pheno.col = 'FT_fi_s')
plot(out.em.scanone)

# QTL mapping (composite intervel mapping)
out.em.cim <- cim(cowpeaMAGIC, method="em",pheno.col = 'FT_fi_s')
plot(out.em.cim)

plot(out.em.scanone, out.em.cim, col=c("blue", "red"),ylab="LOD score",main='QTL mapping for FT_fi_s')
