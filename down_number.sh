#!/bin/sh

dir="."

folders=$dir/*

if [[ ! -f "${1}" ]] && [[ ! -d "${1}" ]]
then
    echo "file or folder does not exist"
else
    filename=${1##*/}
    basename=${1//$filename}

    # if first arg as number set
    if [[ $filename == [0-9][0-9]"_"* ]]
    then
        declare -i num=${filename::2}
        echo $num
        # search folder before num
        for result in $folders
        do
            filename_up=${result##*/}
            if [[ $filename_up == [0-9][0-9]"_"* ]]
            then
                declare -i num_up=${filename_up::2}
                # set number before num + 1
                if (( $num_up == $num+1 ))
                then
                    filename_up=${filename_up:2}
                    # add new number
                    if [ $num_up -lt 10 ]
                    then
                        mv  $result "${basename}"0"$num${filename_up}"
                    else
                        mv $result "${basename}$num${filename_up}"
                    fi
                    # set arg file num -1
                    filename=${filename:2}
                    num=$num+1
                    if [ $num -lt 10 ]
                    then
                        mv  ${1} "${basename}"0"$num${filename}"
                    else
                        mv $result "${basename}$num${filename}"
                    fi
                fi
            fi
        done
    fi
fi
