---
hide:
  - footer
---
# IBM Gym
<img src='../images/gym.png'   align="top" width="200"
  height="300" style = "float">

#Overview
The OpenShift Gym is a learning environment offering individuals the ability to deploy virtual machines to support installation of IBM technologies such as OpenShift and Cloud Paks.

# Prerequisites
1. A [Gym Membership](https://w3.ibm.com/w3publisher/ibm-americas-hccx/openshift-gym) request can be made by filling out the form.
2. An active [TECNet VPN ID](https://w3.ibm.com/w3publisher/ibm-americas-hccx/tecnet) is required to access and use the Gym. 

An email containing details on accessing the features of the OpenShift Gym is sent to the email address supplied once provisioning has completed. General information about the environment supplied is listed below. Refer to the provisioning email for detailed information.

#Set Up
1. Make Sure you are connected to the Tecnet VPN, in initaial setup it may require you to reset your password.

2. Launch Termius or your preferred Terminal
> ###Termius
1. on the left tabe click on hosts
2. click on + New Host
3. Add the IP address that was given in the provisioning email

>Your preffered Terminal
run command
```
ssh admin@{Server IP address} -p 32222
```

Next you will copy the prepopulated env file in your home directory to your daffy env directory
```
cp vmware-ipi-env.sh /data/daffy/env/{env-name}-env.sh
```
You may make any changes needed in this file.

#Deploying


[Cloud Paks](../Cloud-Paks/index.md){ .md-button .md-button--primary }
