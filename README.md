# EgedR_DEG_analysis
To calculate differential expressed genes between two groups by using R package EdgeR

# Requirements
#### STAR 2.7.10a
#### Subread v1.6.4
#### EdgeR Limma dplyr in R
#### sra toolkit
## Download  Genome assembly in FASTA format and The corresponding annotation file in GTF/GFF3 format
`wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_39/gencode.v39.annotation.gtf.gz`

`wget https://ftp.ebi.ac.uk/pub/databases/gencode/Gencode_human/release_39/GRCh38.primary_assembly.genome.fa.gz`
## Download the SRR data using command from the sra toolkit
in this case we want to conduct DEG analysis comparing sample_num1 to sample_num2

`while read line; 
do
    prefetch${line}
    fasterq-dump ${line}
    echo ${line}.fast >>sample1;
done < sample_num1`

`while read line; 
do
    prefetch${line}
    fasterq-dump ${line}
    echo ${line}.fast >>sample2; 
done < sample_num2`

## Generation of genome idex, alignment, feature count 
`bash ./Script.sh <directory of idex> <diretory of reference genome> <diroctory of gtf file> <directory of fastq file> <name of fastq file>`
## DEG analysis by EdgeR 
This command line would output the table with 3 columns: isoform names; Fold Change (absolute value bigger than 1.5); FDR (smaller than 0.05)

`bash ./Calculate.sh <sample1> <sample2>` 
