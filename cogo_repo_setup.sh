#!/bin/bash

CHECK_MARK="\033[1;32m\xE2\x9C\x94\033[0m"
repo=(cogo-ml cogo-product front-saas cogoport-back) #athena packages-utils

cd ~/Desktop &&

for ((i = 0; i < ${#repo[*]}; i++))
do
    FILE=${repo[i]}

    if [ ! -d "$FILE" ]; then
        echo -ne "\033[1;31m\xE2\x9D\x8C\033[0m $FILE does not exist on Desktop. Press y to clone it? "
        read clone_response
        echo ''

        if [ "$clone_response" == "y" ] ; then
            echo "Cloning $FILE...."
            git clone git@github.com:Cogoport/${repo[i]}.git
            echo -e "\r${CHECK_MARK} Cloned $FILE"
        fi
    else
        echo "" &&
        echo "#####-----${repo[i]}-----#####" &&
        echo "" &&

        cd ${repo[i]} &&
        git pull &&
        cd ..

        echo "" &&
        echo -e "${CHECK_MARK} ${repo[i]} updated " &&
        echo "" &&
        sleep 0.1
    fi
done

echo 'Made with ❤️  From Harshosale'
