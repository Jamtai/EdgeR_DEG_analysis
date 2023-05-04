# EgedR_DEG_analysis
This packges are for calculating two samples DEG
# 1.Prequest 
STAR  2.7.10a
Subread   v1.6.4
EdgeR 
Genome assembly in FASTA format and the corresponding annotation file in GTF/GFF3 format
## Download  Genome assembly in FASTA format and The corresponding annotation file in GTF/GFF3 format
`wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_39/gencode.v39.annotation.gtf.gz`

`wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_39/GRCh38.primary_assembly.genome.fa.gz`
## Uncompress files and get rid of alternative chromosome and mitochondria chromosome information
`gunzip *.gz`

## Generation of genome idex, alignment, feature count 
`bash ./Script.sh <directory of idex> <diretory of reference genome> <diroctory of gtf file> <directory of fastq file> <name of fastq file>`
## DEG analysis by EdgeR 
`bash ./Calculate.sh <list of sample1 names> <list of sample2 names>` 
