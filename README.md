# EgedR_DEG_analysis
This packges are for calculating two samples DEG
# Prequest 
STAR  and bulit STAR index
Subread 
EdgeR (R)
# Example
## Alignment and feature count
bash ./Script.sh <directory of idex> <diretory of reference genome> <diroctory of gtf file> <directory of fastq file> <name of fastq file>
##  Combine two samples as one matrix in order to be input of EdgeR 
bash ./Combine.sh <list of sample num1> <list of sample num2> 
##  DEG analysis by EdgeR 
R script Edge.R 
