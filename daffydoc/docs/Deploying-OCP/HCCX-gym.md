---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - HCCX";
</script>

# HCCX Gym
<img src='../images/gym.png'   align="top" width="200"  height="300" style = "float">

## Overview
The OpenShift Gym is a learning environment offering individuals the ability to deploy virtual machines to support installation of IBM technologies such as OpenShift and Cloud Paks.

The HCCX Gym has documentation on using Daffy, below are some shortcuts for their instructions. It's the same basic instructions based on VSphere, but they have some pre-built steps for Gym Members.

1. [Main Gym Page](https://github.ibm.com/Kerry-Malland/openshift-gym-documentation/blob/main/README.md){target=_blank}

2. [VMware IPI deployment - using DAFFY](https://github.ibm.com/Kerry-Malland/openshift-gym-documentation/blob/main/workouts/vmwaredaffy.md){target=_blank}

## Prerequisites
!!! Warning   
      For internal IBM use only, Links may only work while in the IBM Network
1. A [Gym Membership](https://w3.ibm.com/w3publisher/ibm-americas-hccx/openshift-gym){target=_blank} request can be made by filling out the form
2. An active [TECNet VPN ID](https://w3.ibm.com/w3publisher/ibm-americas-hccx/tecnet){target=_blank} is required to access and use the Gym

An email containing details on accessing the features of the OpenShift Gym is sent to the email address supplied once provisioning is completed. General information about the environment supplied is listed below. Refer to the provisioning email for detailed information.

## Connection
1. Make sure you are connected to the Technet VPN. During initial setup, it may require you to reset your password.

2. Launch your preferred Terminal
> ###Termius
    1. On the left tab, click on hosts
    2. Click on + New Host
    3. Add the IP address that was given in the provisioning email
    4. Add password that was given in the email
    5. Change port to 32222

> ###Standard Terminal
```
ssh admin@{Server IP address} -p 32222
```

## Set Up
### Login as root
After logging in as admin, switch to root user.

```console
  sudo su -
```

!!! Warning  
      Before you can start with daffy, you must registry your RedHat Enterprise Linux(RHEL)( [Here](https://access.redhat.com/solutions/253273){target=_blank})
      ```console
      subscription-manager register --username <username> --password <password> --auto-attach
      ```

### Install latest daffy

```console
curl  http://get.daffy-installer.com/download-scripts/daffy-init.sh | bash

```

### Copy environment file
Next you will copy the pre-populated env file in your home directory to your Daffy env directory
```console
cp ~/vmware-ipi-env.sh /data/daffy/env/{env-name}-env.sh
```
You may make any changes needed in this file, add cloud paks, change sizing, etc.

## Deploying
You can now run the daffy process.

```console
/data/daffy/build.sh  {env-name}

```
<button onclick="location.href='../../Cloud-Paks/'" class="custom-btn btn-7">Installing Cloud Paks</button>
