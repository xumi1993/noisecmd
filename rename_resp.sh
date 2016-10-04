#!/bin/bash

ddir=$1
ls -1l $ddir|grep "^d"|awk '{print $NF}' > ttt
while read folder
do
    mkdir $ddir/$folder/raw_data
    ls -1 $ddir/$folder/SAC_*|awk -F"/" '{split($NF,a,"_");print "mv "$0" '$ddir'/'$folder'/"a[1]"_"a[2]"_"a[3]"_"a[4]"_"a[5]"_"a[6]}'|sh
    mv $ddir/$folder/SAC_* $ddir/$folder/raw_data/
    mv $ddir/$folder/*.SAC $ddir/$folder/raw_data/
done< ttt
rm ttt
