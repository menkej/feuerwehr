#!/bin/sh
#

startdir=`pwd`
scriptsource=$startdir/bin
scripttarget=$HOME/bin
# links zu den Skripten anlegen

if [ -d $scripttarget ] ; then
	cd bin
	for script in * ; do
		cd $scripttarget
		ln -sf $scriptsource/$script
	done
else
	echo "Verzeichnis \"$scripttarget\" anlegen"
	mkdir -p $scripttarget

fi
cd $startdir
