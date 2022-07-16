
##Why the name Daffy?

Its a great name and mascot.

##What is your favorite Cloud Pak?

Cloud Pak for Business Automation

##Can this be run on the XBOX platform?

No, sorry.

##Daffy Slack Channels:
```
#daffy-user-group
```
##The refresh.sh is hangs when I try to update daffy code.

If the /data/daffy/refresh.sh hangs or does not work, you can run the following command to put latest version of daffy:

curl  http://get.daffy-installer.com/download-scripts/daffy-init.sh | bash

##I put invalid or wrong Red Hat Pull Secret during the OCP install process, how do you fix?

1) Edit your ~/.profile and remove the following line

       export PULL_SECRET=

2) Save file

3) run this command to remove value from memory

     unset PULL_SECRET

4) Run the Daffy process again

##I put invalid or wrong IBM Entitlment during the CP install process, how do you fix?

1) Edit your ~/.profile and remove the following line

       export IBM_ENTITLEMENT_KEY=

2) Save file

3) run this command to remove value from memory

     unset IBM_ENTITLEMENT_KEY

4) Run the Daffy process again

##How can I create my own bastion?

We have a document outlining how to create your own bastion in two ways: (1) through a paid IBM Cloud Account and (2) through IBM Technology Zone. Click here to access the document.

##ROKS unbound immediate PersistentVolumeClaims
This means the cluster has requested storage from MSP provider(IBM ROKS) and it is still provisioning it.  It can take a few minutes or hours at times or sometimes never get provisioned.
If it is stuck for more then 60 minutes, best option is to delete the stuck pod requesting storage or you can run the daffy rebuild process to get it working in a few hours.

##What does rebuild.sh do?
Rebuild starts over with your cluster using your environment file.

Drop Cluster and all resources it created
Install new Cluster
Install new CP
Install all services
rebuild.sh requires your env file, that drives all the info it would need. As you can see, it will destroy everything and give you new env, nothing will be saved in cluster.
