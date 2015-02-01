echo "USE_OPEN_VM_TOOLS = ${USE_OPEN_VM_TOOLS}"

if [ -n "${USE_OPEN_VM_TOOLS}" ]; then
  # if you want to install open-vm-tools
  echo "Install open-vm-tools"
  apt-get -y install open-vm-tools
else
  # Install vmware-tools
  echo "Install vmware-tools"
  cd /tmp
  tar xvf /tmp/VMwareTools.tar.gz
  cd /tmp/vmware-tools-distrib
  ./vmware-install.pl -f --default
fi

