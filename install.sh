function setup_php() {
    # Checking linux distro. Currently only Ubuntu and Debian are supported.
    if [ "$ee_linux_distro" == "Ubuntu" ]; then
      echo "Installing PHP cli"
      # Adding software-properties-common for add-apt-repository.
      apt-get install -y software-properties-common
      # Adding ondrej/php repository for installing php, this works for all ubuntu flavours.
      add-apt-repository -y ppa:ondrej/php
      apt-get update
      # Installing php-cli, which is the minimum requirement to run EasyEngine
      apt-get -y install php7.2-cli
    elif [ "$ee_linux_distro" == "Debian" ]; then
      echo "Installing PHP cli"
      # Adding locales as there is language related issue with ondrej repository.
      apt-get install apt-transport-https lsb-release ca-certificates locales locales-all -y
      export LC_ALL=en_US.UTF-8
      export LANG=en_US.UTF-8
      wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
      echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
      apt-get update
      apt-get install php7.2-cli -y
    fi
}

function setup_php_modules {
    # Setting up the three required php extensions for EasyEngine.
    php_modules=( pcntl curl sqlite3 )
    if command -v php >> $LOG_FILE 2>&1; then
      # Reading the php version.
      default_php_version="$(readlink -f /usr/bin/php | gawk -F "php" '{ print $2}')"
      echo "Installed PHP : $default_php_version"
      echo "Checking if required PHP modules are installed..."
      for module in "${php_modules[@]}"; do
        if ! php -m | grep $module >> $LOG_FILE 2>&1; then
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
