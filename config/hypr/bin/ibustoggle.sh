#!/bin/bash


#engine=$(ibus engine)
#if [ "$engine" == "xkb:us::eng" ]; then
#ibus engine OpenBangla - OpenBangla Keyboard
#else
#ibus engine xkb:us::eng - English
#fi


engine=$(ibus engine)
path=$HOME/.cache/ibus-layout

if [ ! -f $path ]; then
  touch $path
fi

if [ "$engine" == "xkb:us::eng" ]; then
  ibus engine OpenBangla - OpenBangla Keyboard 
  echo "BN" > $path
else
  ibus engine xkb:us::eng - English
  echo "EN" > $path
fi
