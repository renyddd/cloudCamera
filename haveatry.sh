#!/bin/bash
# How to get the PATHNAME? 
# Just need the right path of HTML files.
echo this is $1
echo this is ${1:0:5}
filepath=$1".html"
htmlpath=`sed -n "/title/p" /f/someRrpositories/MFActive-Administrator/$filepath |awk -v FS='>' '{print $2}' |awk -v FS='<' '{print $1}'`
# Right action, just need to change the FILEPATH to var.
echo $htmlpath
