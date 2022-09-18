#!/bin/sh

dir="."

folders=$dir/*

for result in $folders
do
    filename=${result##*/}
    basename=${result//$filename}
    if [[ $filename == [0-9][0-9]"_"* ]]
    then
        mv ${result} "${basename}${filename:3}"
    fi
done
