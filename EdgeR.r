Count_matrix <- read.table("combine.txt")
colname = read.table("colname")
rowname = read.table("isoform")
Count_matrix=data.frame(Count_matrix)
coname1=unlist(colname)
colnames(Count_matrix)=coname1
Count_matrix=as.matrix(Count_matrix)
rownames(Count_matrix)=rowname$V1  
dimnames=list(rownames(Count_matrix),colnames(Count_matrix))
data=matrix(as.numeric(as.matrix(Count_matrix)),nrow=nrow(Count_matrix),dimnames=dimnames)
data=avereps(data)
#if needed to trim 
library(dplyr)
data <- data %>% replace(is.na(.), 0)
data1=data[,1:6]
data2=data[,7:12]
data0=cbind(data1,data2)
library(edgeR)
dge <- DGEList(counts=data0, group=factor(c(rep("condition1",6),rep("other",6)))
dge <- calcNormFactors(dge)
dge <- estimateDisp(dge)
results <- exactTest(dge)
#pvals <- p.adjust(results$table$PValue, method = "BH")#
top_genes <- topTags(results, n=Inf)
f0=abs(top_genes$table$logFC) > 1.5
p0=top_genes$table$PValue < 0.05
overlapping_TRUE = f0&p0
DEG=top_genes[overlapping_TRUE,]
#de_genes <- top_genes$table[pvals < 0.05 & abs(top_genes$table$logFC) > 1.5,]#
loc = match(row.names(data0),row.names(DEG))#
loc=!is.na(loc)
data_final=data0[loc,]
AA=DEG$table
write.table(AA,'DEG_table.txt,sep='\t')