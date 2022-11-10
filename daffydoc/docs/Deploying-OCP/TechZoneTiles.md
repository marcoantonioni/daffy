---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - TechZone Tiles";
</script>

# TechZone Tile Info

<img src='../images/techzone.jpeg'   align="top" width="100"  height="200" style = "float">

The Purpose of the following TechZone Tiles are to install the full OpenShift/Cloud Pak stack for you. This would enable you to start using your Cloud Pak of choice, without deep skills in OpenShift or Cloud Pak install process. From a Reservetaion to Cloud Pak use, in a few hours of runtime, but 5 min of your time.  Sit back, let Daffy Build the full stack for you.


You can access the Tech Zone Environment Tiles here:

[https://techzone.ibm.com/collection/daffy#tab-1](https://techzone.ibm.com/collection/daffy#tab-1){target=_blank}



## CP4BA

Will take 1 1/2 to 2 hours to install OpenShift, Cloud Pak base and start the services install. You will get email at this point with how to connect to your cluster. From the Guacamole console, you can connect to the Desktop or get the status of your cloud pak. Once you get the email, it can take 2-3 hours for the CP4BA services to be ready. During that time you may see failed deployment, this is normal as the operator will self heal. (Do not watch the paint dry, get a coffee and come back in a few hours)

## CP4D

Will take 3 to 4 hours to install OpenShift, Cloud Pak base and start the services install. You will get email at this point with how to connect to your cluster. From the Guacamole console, you can connect to the Desktop or get the status of your cloud pak. Once you get the email, it can take 3-6 hours for the CP4D services to be ready, depending which ones you deployed. During that time you may see failed deployment, this is normal as the operator will self heal. (Do not watch the paint dry, get a coffee and come back in a few hours)

## CP4I

Will take 2 to 3 hours to install OpenShift, Cloud Pak base and start the services install. You will get email at this point with how to connect to your cluster. From the Guacamole console, you can connect to the Desktop or get the status of your cloud pak. Once you get the email, it can take 1-2 hours for the CP4I services to be ready. During that time you may see failed deployment, this is normal as the operator will self heal. (Do not watch the paint dry, get a coffee and come back in a few hours)

## Tips and Tricks

### Guacamole

<img src='../images/TechZoneTiles/GuacamoleConsole.jpg'   align="top"  style = "float">

Has three options

1.  **CloudPak Information**

      This will be menu based system to give you info about your cloud pak.  Status and any Console links and ID/Passwords

2.  **Remote Red Hat Linux Desktop**

      This will be GUI for the Bastion Desktop.  This is where  you would go to logon to your OpenShift Console, Cloud Pak Dashbaord, etc.

3.  **SSH Terminal Session**

      This is where you can go to run oc commands or other line command line tools.
