#!/bin/sh
# Bildschirmschoner aus
xset s off
# Stromsparmodus für den Monitor aus
xset -dpms 

#	xtightvncviewer -fullscreen -viewonly -autopass ff-kl-heidorn
while /bin/true; do
	ssvncviewer -scale $(xrandr|grep '*'|sed 's/^ *//'|cut -d' ' -f1|head -n1) -fullscreen -viewonly -autopass ff-kl-heidorn

	tmpfile=`mktemp -t starteinsatzmonitor.XXXXXX`
	timeout=30
	date >> $tmpfile
	echo "\n" >> $tmpfile
	echo "Netzwerkverbindung wurde unterbrochen. Neuer Versuch nach $timeout Sekunden\n" >> $tmpfile
	ifconfig | grep "inet " >> $tmpfile
	xmessage -center -timeout $timeout -file $tmpfile
	cat $tmpfile
	rm $tmpfile
	# sleep 10
done

