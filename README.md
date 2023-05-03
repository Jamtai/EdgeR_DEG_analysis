# EgedR_DEG_analysis
This packges are for calculating two samples DEG
# Prequest 
STAR  and bulit STAR index
Subread 
EdgeR package(R)
Genome assembly in FASTA format and the corresponding annotation file in GTF/GFF3 format
# Example
## Alignment and feature count
bash ./Script.sh <directory of idex> <diretory of Genome assembly in FASTA format> <diroctory of corresponding annotation file in GTF/GFF3 forma> <directory of fastq file> <name of fastq file>
## DEG analysis by EdgeR 
bash ./Calculate.sh <list of sample num1> <list of sample num2>
