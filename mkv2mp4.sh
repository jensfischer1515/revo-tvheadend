#!/bin/sh

MKV=$1
MP4=$(echo ${MKV} | /bin/sed 's/.mkv$/.mp4/g')

# flush buffers to disk
/bin/sync

# convert to mp4
/usr/bin/avconv -v 0 -i "${MKV}" -c:v mpeg4 -q:v 5 -c:a libvo_aacenc -q:a 100 "${MP4}" </dev/null 2>&1

# remove old file
/bin/rm -f "${MKV}"
