#!/bin/bash


function yda() {
    cd
    cd /home/zach/Music
    youtube-dl -f 140 $1
}

function yd() {
    cd
    cd /home/zach/Videos
    youtube-dl $1
}

function sox_trim() {
    sox $1 $2 silence -l 1 0.1 1% -1 0.3 1%
}

function ypod() {
    # download a podcast, remove the silent bits, and move to the Downloads/Podcast dir
    cd /home/zach/Downloads/Podcast/tmp
    wget $1
    for i in `find /home/zach/Downloads/Podcast/tmp -name '*.mp3'`;
    do
	# Searches the folder to get the name of the file
	echo $i ;
	NAME="$(basename -- $i)"
	sox $i test.mp3 silence -l 1 0.1 1% -1 0.3 1% ;
	mv /home/zach/Downloads/Podcast/tmp/test.mp3 /home/zach/Downloads/Podcast/$NAME ;
	rm $i
    done
    
}
