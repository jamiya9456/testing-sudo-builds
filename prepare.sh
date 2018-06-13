#!/bin/bash
sudo apt install php7.2-curl php7.2-sqlite3 -y
sudo /usr/bin/php7.2 -dphar.readonly=0 ./utils/make-phar.php easyengine.phar --quite  > /dev/null
sudo /usr/bin/php7.2 easyengine.phar cli info