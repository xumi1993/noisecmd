#!/bin/bash

idir=$1
ddir=$2
if [ ! -d $ddir ];then
    mkdir $ddir
fi

ls -1 $idir/*.seed > ttt
while read seedfile
do
    odir=`echo $seedfile|awk -F"/" '{split($NF,a,/[_|.]/);print a[2]"."a[3]"."a[4]}'`
    mkdir $ddir/$odir
    rdseed -df -q $seedfile $ddir/$odir
done< ttt
