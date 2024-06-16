#!/usr/bin/env sh

# oclock
one=""
two=""
three=""
four=""
five=""
six=""
seven=""
eight=""
nine=""
ten=""
eleven=""
twelve=""

time=`date +"%I:%M %p"`

oclock=`date +%I`
case "$oclock" in
  01) echo $date $one $time;;
  02) echo $date $two $time;;
  03) echo $date $three $time;;
  04) echo $date $four $time;;
  05) echo $date $five $time;;
  06) echo $date $six $time;;
  07) echo $date $seven $time;;
  08) echo $date $eight $time;;
  09) echo $date $nine $time;;
  10) echo $date $ten $time;;
  11) echo $date $eleven $time;;
  12) echo $date $twelve $time;;
esac
