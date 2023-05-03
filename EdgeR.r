
Count_matrix1<- read.table("combine_a.txt")
colname1= read.table("colname1")
rowname = read.table("isoform")
Count_matrix1=data.frame(Count_matrix1)
coname1=unlist(colname1)
colnames(Count_matrix1)=coname1
Count_matrix1=as.matrix(Count_matrix1)
rownames(Count_matrix1)=rowname$V1  
dimnames=list(rownames(Count_matrix1),colnames(Count_matrix1))
data1=matrix(as.numeric(as.matrix(Count_matrix1)),nrow=nrow(Count_matrix1),dimnames=dimnames)
data1=avereps(data1)

Count_matrix2<- read.table("combine_b.txt")
colname2= read.table("colname2")
rowname = read.table("isoform")
Count_matrix2=data.frame(Count_matrix2)
coname1=unlist(colname2)
colnames(Count_matrix2)=coname1
Count_matrix2=as.matrix(Count_matrix2)
rownames(Count_matrix2)=rowname$V1  
dimnames=list(rownames(Count_matrix2),colnames(Count_matrix2))
data2=matrix(as.numeric(as.matrix(Count_matrix2)),nrow=nrow(Count_matrix2),dimnames=dimnames)
data2=avereps(data2)
p=dim(data1)
n_samples1=p[2]
p=dim(data2)
n_samples2=p[2]

#if needed to trim 
library(dplyr)
data1<- data1 %>% replace(is.na(.), 0)
data2<- data2 %>% replace(is.na(.), 0)

data=cbind(data1,data2)
library(edgeR)
dge <- DGEList(counts=data, group=factor(c(rep("condition1",n_samples1),rep("other",n_samples2)))
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
loc = match(row.names(data),row.names(DEG))#
loc=!is.na(loc)
data_final=data[loc,]
AA=DEG$table
write.table(AA,'DEG_table.txt,sep='\t')