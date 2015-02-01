# Clean up package information
apt-get -y remove linux-headers-$(uname -r) build-essential
apt-get -y autoremove
apt-get -y clean
rm -r /var/lib/apt/lists/*

echo "Clean up DHCP leases"
rm /var/lib/dhcp/*

# Make sure Udev doesn't block our network
echo "Clean up udev rules"
rm /etc/udev/rules.d/70-persistent-net.rules
ln -s -f /dev/null /etc/udev/rules.d/70-persistent-net.rules
rm -rf /dev/.udev/
rm /lib/udev/rules.d/75-persistent-net-generator.rules

echo "Add a 2 sec delay to the interface up: for dhclient"
echo "pre-up sleep 2" >> /etc/network/interfaces

