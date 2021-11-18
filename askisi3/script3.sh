#cat test.txt | tr 'A-Z' 'a-z' | sed 's/--/ /g' | sed 's/[^a-z ]//g' | tr -s '[[:space:]]' '\n' | sort | uniq -c | sort -n | tail -n1
#tr -c '[:alnum:]' '[\n*]' < test.txt | sort | uniq -c | sort -nr | head  -10

parse=false
filename="tmp.txt"

while read line; do

if [[ $line == *"*** END OF THIS PROJECT GUTENBERG"* ]]; then
  break
fi



if [ $parse = true ]; then
  echo $line >> $filename
fi

if [[ $line == *"*** START OF THIS PROJECT GUTENBERG"* ]]; then
  parse=true
fi

done < $1

sed -e 's/[^[:alpha:]]/ /g' $filename | tr '\n' " " |  tr -s " " | tr " " '\n'| tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | nl | head -n $2

rm $filename
