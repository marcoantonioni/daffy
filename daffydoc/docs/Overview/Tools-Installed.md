Thought out the Daffy process,  it will install all support tools it would need. Depending on the step of daffy you are running and feature it uses, the tools are different.
<b>****If the tool is present already and correct version, it will not be installed.</b>

## Core
| Tool   | 	When |
| :---      |    :----     |  
|oc|always
|openshfit-install|always
|kubectl|always
nmon | always
|curl| always
|nano| always
|vim| always
|tree| always
|wget| always
|jq| always
|expect| always
|apache2-util| always
|unzip| always
|git| always
|dnsutils| always
|openssh-client| always
|grepcidr| always
|nfs-kernel-server|NFS Option only
|nfs-common|NFS Option only

## Cloud CLI
| Tool   | 	When |
| :---      |    :----     |  
|awscli |AWS Install only
|azure-cli |Azure Install only
|gcloud |GCP Install only
|cloudctl |Cloud Pak install if Flag is set
|python2 |Cloud Pak install if cloudctl Flag is set (< 4.0.6)
|python3 |Cloud Pak install if cloudctl Flag is set (>= 4.0.6)
|pip2 |Cloud Pak install if Flag is set (< 4.0.6)
|pip3 |Cloud Pak install if Flag is set (>= 4.0.6)
|ibmcloud |ROKS Install and IBM DNS Used
|ibm-cp-automation |CP4BA Install Only
|podman |CP4BA Install or mirror local registry


##Kernel-based Virtual Machine Utilities(KVM)

| Tool   | 	When |
| :---      |    :----     |  
|lvm2 KVM install Only
|bridge-utils |KVM install Only
|qemu-kvm |KVM install Only
|virtinst |KVM install Only
|libvirt-daemon |KVM install Only
|virt-manager |KVM install Only
|cifs-utils KVM |install Only
|libosinfo-bin |KVM install Only
|uvtool |KVM install Only
|matchbox |KVM install Only
|rhcos-live-initramfs.x86_64.img| KVM install Only
|rhcos-live-kernel-x86_64 |KVM install Only
|rhcos-live-rootfs.x86_64.img |KVM install Only
|apache2| VMDashboard Only
|mysql-server| VMDashboard Only
|php |VMDashboard Only
|libapache2-mod-php| VMDashboard Only
|php-mysql |VMDashboard Only
|php-xml |VMDashboard Only
|php-libvirt-php| VMDashboard Only
|python |VMDashboard Only

##UPI

| Tool   | 	When |
| :---      |    :----     |  
|haproxy |KVM or VSphere install Only
|dnsmasq |KVM or VSphere install Only

##AirGap Tools

| Tool   | 	When |
| :---      |    :----     |  
|opm |build local registry only
|rhcos-4.6.40-x86_64-live.x86_64.iso| build local registry only
|rhcos-4.7.13-x86_64-live.x86_64.iso |build local registry only
|rhcos-4.8.2-x86_64-live.x86_64.iso |build local registry only
|rhcos-4.9.0-x86_64-live.x86_64.iso |build local registry only
|podman |build local registry only

##VSphere

| Tool   | 	When |
| :---      |    :----     |  
|rhcos-4.6.47-x86_64-vmware.x86_64.ova |VSphere IPI only
|rhcos-4.7.33-x86_64-vmware.x86_64.ova |VSphere IPI only
|rhcos-4.8.14-x86_64-vmware.x86_64.ova |VSphere IPI only
|rhcos-4.9.0-x86_64-vmware.x86_64.ova| VSphere IPI only
|govc |VSphere Install only
