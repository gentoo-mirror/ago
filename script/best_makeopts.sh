#!/bin/bash

PACKAGE="kde-base/kdelibs"

DISTDIR="/tmp/" emerge -f ${PACKAGE}

for i in {1..10}
do
	echo 1 > /proc/sys/vm/drop_caches
	time DISTDIR="/tmp" MAKEOPTS="-j${i}" emerge -q1OB ${PACKAGE}
	echo -ne "\n\n\n"
done
