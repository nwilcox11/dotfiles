#!/bin/bash
HEX=$(printf "%s" "$1" | awk '{print toupper($0)}')
printf '{ "Red Component" : "%s", ' $(echo "ibase=16; $(echo $HEX | cut -c 2-3) / FF" | bc -l)
printf '"Color Space": "sRGB",'
printf '"Green Component" : "%s", ' $(echo "ibase=16; $(echo $HEX | cut -c 4-5) / FF" | bc -l)
printf '"Blue Component" : "%s" }' $(echo "ibase=16; $(echo $HEX | cut -c 6-7) / FF" | bc -l)

