#Construct index of STAR
STAR --runMode genomeGenerate --genomeDir $1 --genomeFastaFiles $2 --sjdbGTFfile $3 --runThreadN 10
#Algin  with STAR
STAR --genomeDir $1 --runThreadN 10 --readFilesIn $4/$5 --outFileNamePrefix $4/$5 --outSAMtype BAM SortedByCoordinate --outSAMunmapped Within --outSAMattributes Standard
#Assigns mapped sequencing reads to genomic features with FeatureCount
featureCounts -T 16 -t exon -g gene_id -Q 30 -F GTF -a $3 -o $4/$5.txt $4/${5}Aligned.sortedByCoord.out.bam


