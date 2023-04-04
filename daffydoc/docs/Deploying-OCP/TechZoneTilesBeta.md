---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - TechZone Tiles - Beta";
</script>

# TechZone Tile Info

<img src='../images/techzone.jpeg'   align="top" width="100"  height="200" style = "float">

The Purpose of the following TechZone Tiles are to install the full OpenShift/Cloud Pak stack for you. This would enable you to start using your Cloud Pak of choice, without deep skills in OpenShift or Cloud Pak install process. From a Reservetaion to Cloud Pak use, in a few hours of runtime, but 5 min of your time.  Sit back, let Daffy/PakInstaller Build the full stack for you. 

1.  This collection of tiles will build a public facing cluster.  <font color=red>No VPN is require or provided</font>
2.  More then one user is allowed to access your Cluster and Cloud Pak.  The only limitation is your cloud pak and the size that was built.


You can access the Tech Zone Environment Tiles here:

1.  [Cloud Pak for Business Automation](https://techzone.ibm.com/collection/PakInstaller/journey-cloud-pak-for-business-automation){target=_blank}

2.  [Cloud Pak for Integration](https://techzone.ibm.com/collection/PakInstaller/journey-cloud-pak-for-integration){target=_blank}


## **Over all Process**

Overall Process can take 4 - 8 hours. 

Of that, it will take 2 to 3 hours to install OpenShift, Cloud Pak base and install/start the services for the cloud pak. You will get email at each major step.  Then you will have to wait the 1 -5 hours until your serivces are fully running.

### **Status Email Messages**

1.  After Cluster is installed - OpenShift is up and running,  you can logon to the OpenShift Cluster console
2.  After the Cloud Pak Base is installed - Cloud Pak Name Spaces is create and All Cloud Pak Operators are installed
3. After the Cloud Pak Services have be installed - This is that the starting process, servics are not ready yet. This is <font color=red>final</font> email as the Pak Installer automation process is over. Now the cloud pak operators take over and can take another <font color=red>1 - 5 hours</font>

??? INFO
    TechZone will also send you emails, at the begging of the reserveration and and the end once the PakInstaller automation is done. You will get a total of 5 emails for this process. 




## Pak Installer Portal

To make the process simple, the end result for your TechZone Reservation will be a single link to the Pak Installer Portal. This portal is your one stop for status and connection info for you cluster and the cloud pak. The Portal requires userid/password to connect to as this cluster is a public facing cluster. 

These pages update every few minutes with any updated information.  This portal is where you would go to monitor the status of your servies and to find out when they are ready.  You will not get email when they are ready as this can take from 1 - 5 hours to finish. 

### **Tabs**

#### Instructions 

This page to explain the tabs within the Portal. Points to the Daffy Public documnetain site from within your local cluster Portal page 

#### Bastion 

Connection info to the bastion(RHEL server).  It will gave you the host name, port, userID and password you can use if you want to connect to the bastion server for this new enviornemt. The Cloud Pak Status page will auto refresh and where you can watch as your servcies come online.  

??? INFO
    This info is not required to be used to run/access your Cloud Pak, but here if you needed it. 

#### OpenShift Console 

Connection info to your new OpenShift Cluster.

??? INFO 
    This info is not required to be used to run/access your Cloud Pak, but here if you needed it. 

#### Cloud Pak Status 

This page is where can see overall status of the cloud pak and all the sevcies you requeted. The page will refresh every few minutes. As stated before, this can take 1 -5 hours to get tot "Ready" state for all servcies componets. 


#### Cloud Pak Console 

This page is where can see the connection info for your cloud Pak. This is the page where you will get your URL's, usernames and passwords once the services are up and running. The page will refresh every few minutes. 

