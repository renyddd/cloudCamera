#!/bin/bash
# To create the wx files.
# $1 the file name to create.
# $2 the file url.

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
