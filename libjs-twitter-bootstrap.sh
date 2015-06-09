#!/bin/bash

rm -rf build
if [ -d "bootstrap" ]; then
  cd bootstrap
  git pull
else
  git clone git@github.com:twbs/bootstrap.git
  cd bootstrap
fi

npm install
npm run build
npm run dist

if [ -e "../build" ]; then
  BUILD=`cat  ../build | perl -ne 'chomp; print join(".", splice(@{[split/\./,$_]}, 0, -1), map {++$_} pop @{[split/\./,$_]}), "\n";'`
else
  BUILD="1";
fi
echo $BUILD > ../build
VERSION=`cat _config.yml | grep current_version | awk '{ print $2 }'`
#CHANGES=`cat CHANGELOG.md | awk -vRS="##" 'NR<=2' ORS="##" | grep -v "##"`
#tar -czf ~/Projects/Packaging/libjs-twitter-bootstrap/libjs-twitter-bootstrap_$VERSION.orig.tar.gz .
#dch -v $VERSION-1 --package libjs-twitter-bootstrap $CHANGES
cd ..

dch -v $VERSION-$BUILD --package libjs-twitter-bootstrap 

debuild -i -us -uc -b

cd ..
#~/bin/publish-deb-packages.sh
