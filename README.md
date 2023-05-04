# EgedR_DEG_analysis


# Requirements
#### STAR 2.7.10a
#### Subread v1.6.4
#### EdgeR Limma dplyr in R
#### Genome assembly in FASTA format and the corresponding annotation file in GTF/GFF3 format
## Download  Genome assembly in FASTA format and The corresponding annotation file in GTF/GFF3 format
`wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_39/gencode.v39.annotation.gtf.gz`

`wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_39/GRCh38.primary_assembly.genome.fa.gz`

## Generation of genome idex, alignment, feature count 
`bash ./Script.sh <directory of idex> <diretory of reference genome> <diroctory of gtf file> <directory of fastq file> <name of fastq file>`
## DEG analysis by EdgeR 
This command line would output the table with 3 columns: isoform names; Fold Change (absolute value bigger than 1.5); FDR (smaller than 0.05)

`bash ./Calculate.sh <list of sample1 names> <list of sample2 names>` 
