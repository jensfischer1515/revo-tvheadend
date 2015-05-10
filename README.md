# Docker Container for TVHeadend

Running TVHeadend inside Docker on my dedicated Linux server "Revo". 
It is tailored to my specific network and hardware configuration.

This project was inspired by rothgar/docker-tvheadend on GitHub.

## Build

	docker build -t "jensfischerhh/revo-tvheadend:0.0.1" .

## Run

    docker run -d --name=tvheadend -p 9981:9981 -p 9982:9982 -v ${pwd}/config:/config -v ${pwd}/recordings:/recordings jensfischerhh/revo-tvheadend:0.0.1

    docker run -it --rm=true --name=tvheadend --privileged --device=/dev/bus/usb/001/001 --device=/dev/bus/usb/001/002 -p 9981:9981 -p 9982:9982 -v ${pwd}/config:/config -v ${pwd}/recordings:/recordings jensfischerhh/revo-tvheadend:0.0.1 /bin/bash
