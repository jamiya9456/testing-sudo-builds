#!/bin/bash

# called by Travis CI
sudo /usr/bin/php7.2 -dphar.readonly=0 ./utils/make-phar.php easyengine.phar --quite  > /dev/null
sudo /usr/bin/php7.2 easyengine.phar cli info