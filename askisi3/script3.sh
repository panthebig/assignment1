#cat test.txt | tr 'A-Z' 'a-z' | sed 's/--/ /g' | sed 's/[^a-z ]//g' | tr -s '[[:space:]]' '\n' | sort | uniq -c | sort -n | tail -n1
#tr -c '[:alnum:]' '[\n*]' < test.txt | sort | uniq -c | sort -nr | head  -10



sed -e 's/[^[:alpha:]]/ /g' $1 | tr '\n' " " |  tr -s " " | tr " " '\n'| tr 'A-Z' 'a-z' | sort | uniq -c | sort -nr | nl | head -n $2
