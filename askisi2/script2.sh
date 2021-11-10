filename="tmp"

ls * -R > $filename


#tar -xf test.tar.gz

while read line; do

if [[ $line == "#${line:1:${#line}-1}" ]]; then
	continue
fi

if [[ ".txt" != "${line:${#line}-4:${#line}-1}" ]]; then
	continue
fi
	
echo "$line"

done < $filename
