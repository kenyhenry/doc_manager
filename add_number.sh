#!/bin/sh

dir="."

folders=$dir/*

declare -i num=0
for result in $folders
do
    filename=${result##*/}
    # if folder already get number do nothing
    if [[ ! ${filename} == [0-9][0-9]"_"* ]]
    then
        basename=${result//$filename}
        # add 2 digit if inferior of 10 ex: 01, 02, 03 ... 10
        if [ $num -lt 10 ]
        then
            mv $result "${basename}"0"$num"_"${result##*/}"
        else
            mv $result "${basename}$num"_"${result##*/}"
        fi
        num=$num+1
    fi
done
