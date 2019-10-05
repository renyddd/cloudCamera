#!/bin/bash
# To create the wx files.
# $1 the file name to create.
# $2 the file url.
# Done!
# yidongren, 2019100521:27
# Run this in the right directory!

cd /f/someRrpositories/cloudCamera/miniprogram/ 

mkdir $1
cd $1

jsonfile=$1".json"
touch $jsonfile
echo {} > $jsonfile

jsfile=$1".js"
touch $jsfile
cat > $jsfile << EOF
Page({
  onLoad: function (options) {
    
  }
})
EOF

wxmlfile=$1".wxml"
touch $wxmlfile
cat > $wxmlfile << EOF
<web-view src="$2" />
EOF

# How to get the PATHNAME? 
filename=$1".html"
# Just need the right path of HTML files.
navishow=`sed -n "/title/p" /f/someRrpositories/MFActive-Administrator/$filename |awk -v FS='>' '{print $2}' |awk -v FS='<' '{print $1}'`
# Right action, just need to change the FILEPATH to var.

# manipulate the index.wxml and the app.json files, and change to the right directory.
cd ../
sed -i "/foundMe/i <navigator url=\"/$1/$1?title=$1\" hover-class=\"navigator-hover\" class=\".page-body-form-item\">$navishow</navigator> \n" index/index.wxml
# Try with the right dir.
# Don't forget to write the right name.

echo finished the index.wxml

sed -i "/],/i ,\"$1/$1\"" app.json

echo finished the app.json
exit 0
