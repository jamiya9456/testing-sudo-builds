#!/bin/bash

# called by Travis CI
version=$(head -n 1 VERSION)
version="$(echo $version | xargs)"
version+="-nightly"
echo $version > VERSION
cat VERSION
#php -dphar.readonly=0 ./utils/make-phar.php easyengine.phar --quite  > /dev/null
#php easyengine.phar cli info