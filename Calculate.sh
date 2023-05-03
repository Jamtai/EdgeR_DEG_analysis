cat $1 >filename1
for i in `cat filename1`;
do 
cat $i.txt|sed 1d |sort -k 4|cut -f 7 >  ${i}_FeatureCounts.txt;
done
cat ${i}_FeatureCounts.txt|sed 1d |sort -k 4|cut -f 1 >isoform
> combine_1.txt
for file in `cat filename1`;
do paste combine_1.txt ${i}_FeatureCounts.txt > combine_a.txt; 
cat combine_a.txt > combine_1.txt
done
cat filename1| sed 's/[.]/\t/g'|cut -f 1 > colname1


cat $2 >filename2
for i in `cat filename2`;
do 
cat $i.txt|sed 1d |sort -k 4|cut -f 7 >  ${i}_FeatureCounts.txt;
done
cat ${i}_FeatureCounts.txt|sed 1d |sort -k 4|cut -f 1 >isoform
> combine_2.txt
for file in `cat filename2`;
do paste combine_2.txt ${i}_FeatureCounts.txt > combine_b.txt; 
cat combine_b.txt > combine_2.txt
done
cat filename2| sed 's/[.]/\t/g'|cut -f 1 > colname2

Rscript EdegR.sh