function setup_php() {
      echo "Installing PHP cli"
      # Adding software-properties-common for add-apt-repository.
      apt-get install -y software-properties-common
      # Adding ondrej/php repository for installing php, this works for all ubuntu flavours.
      add-apt-repository -y ppa:ondrej/php
      apt-get update
      # Installing php-cli, which is the minimum requirement to run EasyEngine
      apt-get -y install php7.2-cli
}

function setup_php_modules {
    # Setting up the three required php extensions for EasyEngine.
    php_modules=( pcntl curl sqlite3 )
    if command -v php > /dev/null 2>&1; then
      # Reading the php version.
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

function download_and_install_easyengine {
    # Download EasyEngine phar.
    wget -O /usr/local/bin/ee https://raw.githubusercontent.com/EasyEngine/easyengine-builds/master/phar/easyengine.phar
    # Make it executable.
    chmod +x /usr/local/bin/ee
}

function setup_dependencies {
    setup_php
    setup_php_modules
    download_and_install_easyengine
}
setup_dependencies
