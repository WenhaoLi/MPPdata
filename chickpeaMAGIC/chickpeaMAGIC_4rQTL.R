library(qtl)

# read cross files (as if it were BCs by default)
chickpeaMAGIC <- read.cross("csvs", ".", "chickpeaMAGIC_geno_4rQTL.csv", "chickpeaMAGIC_pheno_4rQTL.csv")

# convert to RILs
chickpeaMAGIC <- convert2riself(chickpeaMAGIC)
summary(chickpeaMAGIC)

# explore data
plotPheno(chickpeaMAGIC,pheno.col = 'x100SDWT2013')
plot.map(chickpeaMAGIC)

# QTL mapping (single QTL model)
chickpeaMAGIC <- calc.genoprob(chickpeaMAGIC)

out.em.scanone <- scanone(chickpeaMAGIC, method="em",pheno.col = 'x100SDWT2013')
plot(out.em.scanone)

# QTL mapping (composite intervel mapping)
out.em.cim <- cim(chickpeaMAGIC, method="em",pheno.col = 'x100SDWT2013')
plot(out.em.cim)

plot(out.em.scanone, out.em.cim, col=c("blue", "red"),ylab="LOD score",main='QTL mapping for x100SDWT2013')
