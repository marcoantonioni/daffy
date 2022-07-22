---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - HCCX";
</script>

# HCCX Gym
<img src='../images/gym.png'   align="top" width="200"
  height="300" style = "float">

## Overview
The OpenShift Gym is a learning environment offering individuals the ability to deploy virtual machines to support installation of IBM technologies such as OpenShift and Cloud Paks.

The HCCX Gym has documentation on using daffy, below are some shortcuts for their instructions. Its same basic instructions based on VSphere, but they have some pre-built steps for Gym Members.

1. [Main Gym Page](https://github.ibm.com/Kerry-Malland/openshift-gym-documentation/blob/main/README.md){target=_blank}

2. [VMware IPI deployment - using DAFFY](https://github.ibm.com/Kerry-Malland/openshift-gym-documentation/blob/main/workouts/vmwaredaffy.md){target=_blank}

## Prerequisites
!!! Warning   
      For internal IBM use only, Links may only work while in the IBM Network
1. A [Gym Membership](https://w3.ibm.com/w3publisher/ibm-americas-hccx/openshift-gym){target=_blank} request can be made by filling out the form.
2. An active [TECNet VPN ID](https://w3.ibm.com/w3publisher/ibm-americas-hccx/tecnet){target=_blank} is required to access and use the Gym. 

An email containing details on accessing the features of the OpenShift Gym is sent to the email address supplied once provisioning has completed. General information about the environment supplied is listed below. Refer to the provisioning email for detailed information.

## Connection
1. Make Sure you are connected to the Technet VPN, in initial setup it may require you to reset your password.

2. Launch your preferred Terminal
> ###Termius
    1. On the left tab click on hosts
    2. Click on + New Host
    3. Add the IP address that was given in the provisioning email
    4. Add password that was giving in the email
    5. Change port to 32222

> ###Standard Terminal
```
ssh admin@{Server IP address} -p 32222
```

## Set Up
### Login as root
After logging in as admin, switch to root user

```
  sudo su -
```

!!! Warning  
      Before you can start with daffy, you must registry your RedHat Enterprise Linux(RHEL)( [Here](https://access.redhat.com/solutions/253273){target=_blank})
      ```
      subscription-manager register --username <username> --password <password> --auto-attach
      ```

### Install latest daffy

```
curl  http://get.daffy-installer.com/download-scripts/daffy-init.sh | bash

```

### Copy environment file
Next you will copy the prepopulated env file in your home directory to your daffy env directory
```
cp ~/vmware-ipi-env.sh /data/daffy/env/{env-name}-env.sh
```
You may make any changes needed in this file, add cloud paks, change sizing, etc.

## Deploying
You can now run the daffy process

```
/data/daffy/build.sh  {env-name}

```
<button onclick="location.href='../../Cloud-Paks/'" class="custom-btn btn-7">
Installing Cloud Paks</button>





<!-- PUT ANY JS OR CSS BELOW HERE-->

<style>

.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
button {
  margin: 5px;
}
.custom-btn {
  width: 200px;
  height: 50px;
  color: black;
  border-radius: 10px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

/* 7 */
.btn-7 {
background: linear-gradient(0deg, rgba(255,151,0,1) 0%, rgba(251,75,2,1) 100%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-7 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-7:before,
.btn-7:after {
  position: absolute;
  content: "";
  right: 0;
  bottom: 0;
  background: rgba(251,75,2,1);
  box-shadow:
   -7px -7px 20px 0px rgba(255,255,255,.9),
   -4px -4px 5px 0px rgba(255,255,255,.9),
   7px 7px 20px 0px rgba(0,0,0,.2),
   4px 4px 5px 0px rgba(0,0,0,.3);
  transition: all 0.3s ease;
}
.btn-7:before{
   height: 0%;
   width: 2px;
}
.btn-7:after {
  width: 0%;
  height: 2px;
}
.btn-7:hover{
  color: rgba(251,75,2,1);
  background: transparent;
}
.btn-7:hover:before {
  height: 100%;
}
.btn-7:hover:after {
  width: 100%;
}
.btn-7 span:before,
.btn-7 span:after {
  position: absolute;
  content: "";
  left: 0;
  top: 0;
  background: rgba(251,75,2,1);
  box-shadow:
   -7px -7px 20px 0px rgba(255,255,255,.9),
   -4px -4px 5px 0px rgba(255,255,255,.9),
   7px 7px 20px 0px rgba(0,0,0,.2),
   4px 4px 5px 0px rgba(0,0,0,.3);
  transition: all 0.3s ease;
}
.btn-7 span:before {
  width: 2px;
  height: 0%;
}
.btn-7 span:after {
  height: 2px;
  width: 0%;
}
.btn-7 span:hover:before {
  height: 100%;
}
.btn-7 span:hover:after {
  width: 100%;
}
}
</style>
