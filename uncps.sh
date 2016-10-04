#!/bin/bash
# Unzip seed files by days
# Author: Mijian Xu @ Nanjing University
#
# History: 2016-10-04: Init Codes
#
if [ $# == 2 ];then
    idir=$1
    ddir=$2
elif [ $# == 1 ];then
    idir=$1
    ddir=./
else
    echo "Wrong arguments"
    exit 1
fi

if [ ! -d $ddir ];then
    mkdir $ddir
fi

ls -1 $idir/*.seed > ttt
while read seedfile
do
    odir=`echo $seedfile|awk -F"/" '{split($NF,a,/[_|.]/);print a[2]"."a[3]"."a[4]}'`
    mkdir $ddir/$odir
    rdseed -df -q $seedfile $ddir/$odir
    rdseed -pf -q $seedfile $ddir/$odir
done< ttt

rm ttt
