#!/bin/bash
echo test

news="rssfeed.txt"

wget -O $news https://www.nasa.gov/rss/dyn/breaking_news.rss

#cat rssfeed.txt | grep "<title>"
#cat rssfeed.txt | grep "<link>"

#sed '\%<item></item>%p' rssfeed.txt

#sed -e 's:.*<item>\(.*\)</item>.*:\1:p' rssfeed.txt

#cat rssfeed.txt | grep -oP "<title>"

#list=$(sed -e 's/.*<title>\(.*\)<\/title>.*/\1/' rssfeed.txt)


titles=($(sed -e 's/.*<title>\(.*\)<\/title>.*/\1./I;t;d' "$news"))

links=($(sed -e 's/.*<link>\(.*\)<\/link>.*/\1/I;t;d' "$news"))

for T in "${links[@]}"
do
        echo "$T"
done


echo "numero de noticias+1: " ${#links[@]} #numero de noticias+1
echo ${#titles[@]} # me da el numero de elementos
#echo ${links[2]}
