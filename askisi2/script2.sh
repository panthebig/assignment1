filename="tmp"
directory=""

ls * -R > $filename
mkdir assignments > /dev/null 2>&1

#tar -xf test.tar.gz

while read line; do


if [[ $line == "#${line:1:${#line}-1}" ]]; then
	continue
fi

if [[ ":" == "${line:${#line}-1:${#line}-1}" ]]; then
	directory="${line:0:${#line}-1}"	#its a folder
	cd $directory	> /dev/null	#cd folder dir
	#echo "$directory"
	continue
fi


if [[ "" == "$line" ]]; then
	directory=""	#empty line
	cd -	> /dev/null 2>&1	#reverse last cd
	continue
fi

#echo "${line:0:${#line}-4}" #"$line"

if [[ ".txt" == "${line:${#line}-4:${#line}-1}" ]]; then
	#source="${line:0:${#line}-4}"
	while read url; do
	
		if [[ "https:" == "${url:0:6}" ]] && [[ ".git" == "${url:${#url}-4:${#url}-1}" ]]; then
			#echo "inside if"
			cd -	> /dev/null 2>&1
			cd assignments	> /dev/null
			
			if ! git clone -q $url > /dev/null 2>&1
			then
			  echo "$url : Cloning FAILED"
			else
			  echo "$url : Cloning OK"
			fi
			
			
			
			cd -	> /dev/null
			cd $directory	> /dev/null
			#echo "cloned dir: $directory filename: $source"
		fi
			
	done < $line

	continue	#its a file
fi


done < $filename
cd - > /dev/null 2>&1

#change repositories file names and print num of dir-files
#check dir structure  if its ok


