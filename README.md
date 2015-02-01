# Packer Templates for ESXi

[Packer](https://www.packer.io/) templates with ESXi.

## Specification

1. VM has 2 vNIC
2. Get IP address from DHCP servers
3. VMware tools / open-vm-tools is installed

## Pre-Requirements

1. ESXi Settings : Following 3 setting needed
  - Enable SSH
  - Open port from 5900 to 6000(these are defaults of vnc\_port\_min, vnc\_port\_max). Packer will use VNC.
  - Set advanced setting of /Net/GuestIPHack.(For getting IP address of VM, before installing [open-]vmware-tools.)

        ```shell
        # On ESXi console or login via SSH
        esxcli system settings advanced set -o /Net/GuestIPHack -i 1
        ```

2. [Install Packer](https://www.packer.io/downloads.html)
3. (If you want to use VMware tools,) download VMwareTools-\*.tar.gz and put to debian-wheezy/uploads/VMwareTools-\*.tar.gz

## Parameters

### Requiered

| variable               | mean                       |
|------------------------|----------------------------|
| remote\_host           | ESXi IP/hostname           |
| remote\_password       | ESXi password              |
| ethernet0.networkName  | Portgroup name of 1st vNIC |
| ethernet1.networkName  | Portgroup name of 2nd vNIC |

### Optional

Explain important variables below.
See each templates file for getting all variables.

| variable               | default            | mean                                              |
|------------------------|--------------------|---------------------------------------------------|
| use\_open\_vm\_tools   | ""                 | if this value is "YES", use open-vm-tools         |
| core                   | 1                  | # of CPU core                                     |
| memory                 | 512                | Mem Size (MB)                                     |
| diskSize               | 4096               | Disk Size (GB)                                    |
| iso\_url               | snip.              | Debian net install image URL                      |
| iso\_md5               | snip.              | md5sum of ISO file                                |

## Limitation
Now, default user&password are root/password.
If you want change them directory, you must modify preseed file and add packer build parameter.
It's very confusing.

So, please use provisioning for change them.

## Build Example

```shell
# Install vmware-tools
packer build  -var 'remote_password=__esxi_password__' -var 'remote_host=__esxi_ip__' -var 'ethernet0.networkName=VM Network' -var 'ethernet1.networkName=VM Network 2' debian-wheezy.json

# Install open-vm-tools
packer build  -var 'remote_password=__esxi_password__' -var 'remote_host=__esxi_ip__' -var 'ethernet0.networkName=VM Network' -var 'ethernet1.networkName=VM Network 2' -var 'use_open_vm_tools=YES' debian-wheezy.json
```

