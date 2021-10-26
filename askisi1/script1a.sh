filename='WebsitesToCheck'
source saved.sh
n=1

if [ -e saved.sh ]; then		#check file existance
	echo "loaded file"
	source saved.sh
else
	declare -A arr
fi

while read url; do
#echo "#${url:1:${#url}-1}"
#echo $url
if [[ $url == "#${url:1:${#url}-1}" ]]; then
	continue
fi

wget -O index1.html $url
id="$(md5sum index1.html)"
id=${id:0:32}

#echo ${arr[$url]}
if [ -v arr[$url] ]; then
	if [ ${arr[$url]} != $id ]; then
		arr[$url]=$id
		echo "$url"
	fi
fi


if [ ! -v arr[$url] ]; then
	arr[$url]=$id
	echo "$url INIT"
fi



#echo $id
#md5sum index1.html

#echo "Url No. $n : $url"
n=$((n+1))
done < $filename


declare -p arr > saved.sh
