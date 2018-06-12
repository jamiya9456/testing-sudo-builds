function setup_php() {
    # Checking linux distro
    if [ "$ee_linux_distro" == "Ubuntu" ]; then
      echo "Installing PHP cli"
      apt-get install -y software-properties-common
      add-apt-repository -y ppa:ondrej/php
      apt-get update
      apt-get -y install php7.2-cli
    elif [ "$ee_linux_distro" == "Debian" ]; then
      echo "Installing PHP cli"
      apt-get install apt-transport-https lsb-release ca-certificates locales locales-all -y
      export LC_ALL=en_US.UTF-8
      export LANG=en_US.UTF-8
      wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg
      echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list
      apt-get update
      apt-get install php7.2-cli -y
    fi
}
setup_php
