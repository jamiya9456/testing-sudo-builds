sudo /usr/bin/php7.2 easyengine.phar site list
wget -qO ee rt.cx/ee4beta && sudo bash ee
sudo ee cli info
sudo ee site list
sudo ee site create test.test --debug
curl -XGET -IL test.test
curl test.test