# Debian Wheezy

## Example

```shell
# Install vmware-tools
packer build  -var 'remote_password=__esxi_password__' -var 'remote_host=__esxi_ip__' -var 'ethernet0.networkName=VM Network' -var 'ethernet1.networkName=VM Network 2' debian-wheezy.json

# Install open-vm-tools
packer build  -var 'remote_password=__esxi_password__' -var 'remote_host=__esxi_ip__' -var 'ethernet0.networkName=VM Network' -var 'ethernet1.networkName=VM Network 2' -var 'use_open_vm_tools=YES' debian-wheezy.json
```

