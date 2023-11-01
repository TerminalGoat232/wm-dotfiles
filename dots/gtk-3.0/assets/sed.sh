#!/bin/sh
sed -i \
         -e 's/#ffc45e/rgb(0%,0%,0%)/g' \
         -e 's/#382516/rgb(100%,100%,100%)/g' \
    -e 's/#ffc45b/rgb(50%,0%,0%)/g' \
     -e 's/#ffae36/rgb(0%,50%,0%)/g' \
     -e 's/#ffc45e/rgb(50%,0%,50%)/g' \
     -e 's/#2b1d0a/rgb(0%,0%,50%)/g' \
	"$@"
