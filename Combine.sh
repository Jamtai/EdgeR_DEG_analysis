ls *.bam|sed 's/Aligned.sortedByCoord.out.bam//g'|sort |uniq` >filename
for i in `cat filename`;
do 
cat $i.txt|sed 1d |sort -k 4|cut -f 7 >  ${i}_FeatureCounts.txt;
done
cat ${i}_FeatureCounts.txt|sed 1d |sort -k 4|cut -f 1 >isoform
> combine.txt
for file in `cat filename`;
do paste combine.txt ${i}_FeatureCounts.txt > combine1.txt; 
cat combine1.txt > combine.txt
done
cat filename| sed 's/[.]/\t/g'|cut -f 1 > colname