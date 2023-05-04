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

## Alignment and feature count
`bash ./Script.sh `
## DEG analysis by EdgeR 
`bash ./Calculate.sh ` 
