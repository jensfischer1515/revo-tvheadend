# Docker Container for TVHeadend

Running TVHeadend inside Docker on my dedicated Linux server "Revo". 
It is tailored to my specific network and hardware configuration.

This project was inspired by rothgar/docker-tvheadend on GitHub.

## Build

	docker build -t "jensfischerhh/revo-tvheadend:stable" .

## Run

    docker run -d --name=tvheadend -p 9981:9981 -p 9982:9982 -v ${pwd}/config:/config -v ${pwd}/recordings:/recordings jensfischerhh/revo-tvheadend:stable

    docker run -it --rm=true --name=tvheadend --device=/dev/bus/usb/001/004 -p 9981:9981 -p 9982:9982 -v ${pwd}/config:/config -v ${pwd}/recordings:/recordings jensfischerhh/revo-tvheadend:stable /bin/bash

    docker run -d --name=tvheadend --privileged -p 9981:9981 -p 9982:9982 -v /dev/bus/usb:/dev/bus/usb -v /var/local/tvheadend/config:/config -v /var/local/tvheadend/recordings:/recordings jensfischerhh/revo-tvheadend:stable
