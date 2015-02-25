# Clean up package information
apt-get -y purge software-properties-common ansible
apt-get -y autoremove
apt-get -y clean
rm -r /var/lib/apt/lists/*

