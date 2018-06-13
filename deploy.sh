sudo /usr/bin/php7.2 easyengine.phar site list
wget -qO ee rt.cx/ee4beta && sudo bash ee
sudo ee cli info
sudo ee site list
sudo ee site create test.test --debug --dbpass='KsPpAJSeIAJ4'
cd ~/ee-sites/test.test
docker-compose exec --user='www-data' php wp config create --dbuser='wordpress' --dbname='test_test' --dbpass='KsPpAJSeIAJ4' --dbhost='db'  --dbcharset=utf8
curl -XGET -IL test.test
curl test.test