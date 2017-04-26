#!/bin/bash

let itemsCount=$(xmllint --xpath 'count(//resources/string)' weathericons.xml)

for (( i=1; i <= $itemsCount; i++ )); do 
    name=$(xmllint --xpath '//string['$i']/@name' weathericons.xml | sed 's/"//g' | sed 's/name=//g')
    unicode=$(printf "\U$(xmllint --xpath '//string['$i']/text()' weathericons.xml | sed 's/&#x//g'| sed 's/;//g')")
    echo $name $unicode
#   convert -background none -fill black -font weathericons-regular-webfont.ttf -pointsize 18 -size 24x24 label:$unicode $name.png
   convert -background white -fill black -font weathericons-regular-webfont.ttf -pointsize 18 -size 24x24 -type bilevel -alpha off -depth 1 -colors 2 label:$unicode $name.mono
done

