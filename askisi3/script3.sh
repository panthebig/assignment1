#cat test.txt | tr 'A-Z' 'a-z' | sed 's/--/ /g' | sed 's/[^a-z ]//g' | tr -s '[[:space:]]' '\n' | sort | uniq -c | sort -n | tail -n1
#tr -c '[:alnum:]' '[\n*]' < test.txt | sort | uniq -c | sort -nr | head  -10

parse=false
filename="tmp.txt"

if [ $1 == "--help" ] || [ $1 == "-h" ] ; then
	echo "Two arguments are given as input."
	echo "The name of the file and the most N frequent words to be printed"
	echo "bash screipt3a.sh < filename > < N >"
	exit
fi

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
