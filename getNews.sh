#!/bin/bash
echo test

news="rssfeed.txt"

wget -O $news https://www.nasa.gov/rss/dyn/breaking_news.rss


titles=($(sed -e 's/.*<title>\(.*\)<\/title>.*/\1\ .p0t4t0./I;t;d' "$news"))

links=($(sed -e 's/.*<link>\(.*\)<\/link>.*/\1/I;t;d' "$news"))


titles_fixed=""
index=0

for M in "${titles[@]}"
do
	if [ $M == ".p0t4t0." ]; then
		echo "${titles_fixed[index]}" >> nasaNews.txt
		echo "${links[index]}" >> nasaNews.txt
		echo " "  >> nasaNews.txt
		index=$[$index +1]
	else 
		titles_fixed[index]="${titles_fixed[index]} $M"
	fi
done



