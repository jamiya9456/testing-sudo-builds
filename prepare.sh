#!/bin/bash
function setup_php_modules {
    php_modules=( pcntl curl sqlite3 )
    if command -v php > /dev/null 2>&1; then
      default_php_version="$(readlink -f /usr/bin/php | gawk -F "php" '{ print $2}')"
      echo "Installed PHP : $default_php_version"
      echo "Checking if required PHP modules are installed..."
      for module in "${php_modules[@]}"; do
        if ! php -m | grep $module > /dev/null 2>&1; then
          echo "$module not installed. Installing..."
          apt install -y php$default_php_version-$module
        else
          echo "$module is already installed"
        fi
      done
    fi
}
setup_php_modules
sudo /usr/bin/php7.2 -dphar.readonly=0 ./utils/make-phar.php easyengine.phar --quite  > /dev/null
sudo /usr/bin/php7.2 easyengine.phar cli info