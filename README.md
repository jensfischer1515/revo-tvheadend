# Docker Container for TVHeadend

Running TVHeadend inside Docker on my dedicated Linux server "Revo". 
It is tailored to my specific network and hardware configuration.

This project was inspired by rothgar/docker-tvheadend on GitHub.

## Build

	docker build -t "jensfischerhh/revo-tvheadend:unstable" .

## Run

    docker run -d --restart=always --name=tvheadend -p 9981:9981 -p 9982:9982 -v ${pwd}/config:/config -v ${pwd}/recordings:/recordings jensfischerhh/revo-tvheadend:unstable

    docker run -it --rm=true --name=tvheadend --device=/dev/bus/usb/001/004 -p 9981:9981 -p 9982:9982 -v ${pwd}/config:/config -v ${pwd}/recordings:/recordings jensfischerhh/revo-tvheadend:unstable /bin/bash

    docker run -d --restart=always --name=tvheadend --privileged -p 9981:9981 -p 9982:9982 -v /dev/bus/usb:/dev/bus/usb -v /var/local/tvheadend/config:/config -v /var/local/tvheadend/recordings:/recordings jensfischerhh/revo-tvheadend:unstable

## post process recordings

https://tvheadend.org/projects/tvheadend/wiki/Tvheadend_post_recording_scripts

    ffmpeg -v 10 -stats -i ./SRTL-Psych.2015-05-11.20-05.mkv -c:v mpeg4 -q:v 5 -c:a libvo_aacenc -q:a 100 ./SRTL-Psych.2015-05-11.20-05.mp4
