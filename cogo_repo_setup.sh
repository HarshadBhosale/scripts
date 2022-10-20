#!/bin/bash

repo=(cogo-ml cogo-product front-saas cogoport-back) #packages-utils

cd ~/Desktop &&

for ((i = 0; i < ${#repo[*]}; i++))
do
    FILE=${repo[i]}

    if [ ! -d "$FILE" ]; then 
        echo "$FILE does not exist on Desktop ----- cloning it"
        git clone git@github.com:Cogoport/${repo[i]}.git
    
    else
        echo "" &&
        echo "#####-----${repo[i]}-----#####" &&
        echo "" &&

        cd ${repo[i]} &&
        git pull &&
        cd ..

        echo "" &&
        echo "#####-----${repo[i]} updated-----#####" &&
        echo "" &&
        sleep 0.2
    fi
done
