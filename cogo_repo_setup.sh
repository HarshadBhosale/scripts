#!/bin/bash

CHECK_MARK="\033[1;32m\xE2\x9C\x94\033[0m"
repo=(cogo-ml front-saas cogo-product cogoport-back)
repo_need_yarn=(front-saas cogo-product)
END_MESSAGE='Made with ❤️  From Harshosale'

function checkForYarn {
    if [[ "${repo_need_yarn[*]}" =~ "$1" ]]; then
        yarn
    fi
}

cd ~/Desktop &&

for ((i = 0; i < ${#repo[*]}; i++))
do
    FILE=${repo[i]}

    if [ ! -d "$FILE" ]; then
        echo -ne "\033[1;31m\xE2\x9D\x8C\033[0m $FILE does not exist on Desktop. Press y to clone it? "
        read clone_response
        echo

        if [ "$clone_response" == "y" ] ; then
            echo "Cloning $FILE...."
            git clone git@github.com:Cogoport/$FILE.git
            echo -e "\r${CHECK_MARK} Cloned $FILE"

            cd $FILE &&
            checkForYarn $FILE
        fi
    else
        echo &&
        echo "#####-----$FILE-----#####" &&
        echo &&

        cd $FILE &&
        git pull &&

        checkForYarn $FILE

        cd ..

        echo &&
        echo -e "${CHECK_MARK} $FILE updated " &&
        echo &&
        sleep 0.1
    fi
done

echo $END_MESSAGE



