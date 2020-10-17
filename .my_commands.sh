#!/bin/bash


function yda() {
    cd
    cd ~/Music
    youtube-dl -f 140 $1
}

function yd() {
    cd
    cd ~/Videos
    youtube-dl $1
}

function sox_trim() {
    sox $1 $2 silence -l 1 0.1 1% -1 0.3 1%
}

function ypod() {
    # download a podcast, remove the silent bits, and move to the Downloads/Podcast dir
    cd ~/Downloads/Podcast/tmp
    wget $1
    for i in `find ~/Downloads/Podcast/tmp -name '*.mp3'`;
    do
	# Searches the folder to get the name of the file
	echo $i ;
	NAME="$(basename -- $i)"
	sox $i test.mp3 silence -l 1 0.1 1% -1 0.3 1% ;
	mv ~/Downloads/Podcast/tmp/test.mp3 ~/Downloads/Podcast/$NAME ;
	rm $i
    done
    
}

function nproj() {
    # Inputs: name of the project
    #         extension of project
    cd ~/
    new_repo=$(python .git_create_project.py $1 $2)
    # new_repo=$(python ~/Coding/New_Project_Template/git_create_project.py $1 $2)

    code_folder=~/Coding

    cd $code_folder

    echo $new_repo

    sleep 2

    git clone git@github.com:$new_repo.git

    # open script ,in my preferred editor, in the background of bash
    script=$code_folder/$1/$1.$2
    emacs $script </dev/null &>/dev/null &

    cd ~/
}
