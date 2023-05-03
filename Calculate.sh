for i in `cat $1`;
do 
cat $i.txt|sed 1d |sort -k 4|cut -f 7 >  ${i}_FeatureCounts.txt;
done
cat ${i}.txt|sed 1d |sort -k 4|cut -f 1 >isoform
> combine_1.txt
for file in `cat $1`;
do paste combine_1.txt ${file}_FeatureCounts.txt > combine_a.txt; 
cat combine_a.txt > combine_1.txt
done
cat $1| sed 's/[.]/\t/g'|cut -f 1 > colname1
for i in `cat $2`;
do 
cat $i.txt|sed 1d |sort -k 4|cut -f 7 >  ${i}_FeatureCounts.txt;
done
cat ${i}.txt|sed 1d |sort -k 4|cut -f 1 >isoform
> combine_2.txt
for file in `cat $2`;
do paste combine_2.txt ${file}_FeatureCounts.txt > combine_b.txt; 
cat combine_b.txt > combine_2.txt
done
cat $2| sed 's/[.]/\t/g'|cut -f 1 > colname2
Rscript ./EdgeR.r