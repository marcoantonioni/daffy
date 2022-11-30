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

1.  [Cloud Pak for Business Automation](https://techzone.ibm.com/collection/PakInstaller#tab-1){target=_blank}
2.  [Cloud Pak for Data](https://techzone.ibm.com/collection/PakInstaller#tab-2){target=_blank}
3.  [Cloud Pak for Integration](https://techzone.ibm.com/collection/PakInstaller#tab-3){target=_blank}


## CP4BA

Will take 1 1/2 to 2 hours to install OpenShift, Cloud Pak base and start the services install. You will get email at this point with how to connect to your cluster. From the Guacamole console, you can connect to the Desktop or get the status of your cloud pak. Once you get the email, it can take 2-3 hours for the CP4BA services to be ready. During that time you may see failed deployment, this is normal as the operator will self heal. (Do not watch the paint dry, get a coffee and come back in a few hours)

## CP4D

Will take 3 to 4 hours to install OpenShift, Cloud Pak base and start the services install. You will get email at this point with how to connect to your cluster. From the Guacamole console, you can connect to the Desktop or get the status of your cloud pak. Once you get the email, it can take 3-6 hours for the CP4D services to be ready, depending which ones you deployed. During that time you may see failed deployment, this is normal as the operator will self heal. (Do not watch the paint dry, get a coffee and come back in a few hours)

## CP4I

Will take 2 to 3 hours to install OpenShift, Cloud Pak base and start the services install. You will get email at this point with how to connect to your cluster. From the Guacamole console, you can connect to the Desktop or get the status of your cloud pak. Once you get the email, it can take 1-2 hours for the CP4I services to be ready. During that time you may see failed deployment, this is normal as the operator will self heal. (Do not watch the paint dry, get a coffee and come back in a few hours)

## Tips and Tricks

### Guacamole

<img src='../images/TechZoneTiles/GuacamoleConsole.jpg'   align="top"  style = "float">

!!! INFO
      If you are using Firefox and unable to copy/paste in Remote Desktop Web Client, please enable. [https://sudoedit.com/firefox-async-clipboard/](https://sudoedit.com/firefox-async-clipboard/){target=_blank} via @Max Simpson

Has three options

!!! INFO
       To copy and paste, just highlight the text you want to copy and it will be in your clipboard. Then paste(right click then paste menu) to other Guacamole Screens.


1.  **CloudPak Information**

      This will be menu based system to give you info about your cloud pak.  Status and any Console links and ID/Passwords
      This is where you can copy the url and passwords to paste in the Red Hat Remote Desktop Firefox Browser.

2.  **Remote Red Hat Linux Desktop**

      This will be GUI for the Bastion Desktop.  This is where  you would go to logon to your OpenShift Console, Cloud Pak Dashboard, etc. To open Firefox, on the top left of the Desktop, click the "Activities" text and select Firefox from the new menu.

3.  **SSH Terminal Session**

      This is where you can go to run oc commands or other line command line tools.

#### Controls

If want to get the guacamole controls to have a better way to copy/paste, resize screen or change keyboard type, you can do the following to bring up the controls:

For Mac users

  **CONTROL-OPTION-SHIFT**

For Windows Users

  **CTRL-ALT-SHIFT**


### **Wireguard**
If you enabled the VPN on the TechZone tile and want to connect, you need to install the WireGuard Application on your local Desktop and load your own config.

1)  Install WireGuard [https://www.wireguard.com/install/](https://www.wireguard.com/install/){target=_blank}

2) Download the Connection Config from the TechZone tile
??? Info "Screenshot"
    <img src='../../images/DeployingOCP/TechZoneTiles/1.1WireGuard.jpg'   align="top" style = "float">


3) Import into to your local Wireguard
??? Info "Screenshot"
    <img src='../../images/DeployingOCP/TechZoneTiles/1WireGuard.jpg'   align="top" style = "float">

4) Start up the VPN connection with new config
??? Info "Screenshot"
    <img src='../../images/DeployingOCP/TechZoneTiles/2WireGuard.jpg'   align="top" style = "float">
    <img src='../../images/DeployingOCP/TechZoneTiles/3WireGuard.jpg'   align="top" style = "float">

5)  Open your local browser and connect to the OpenShift, VCenter or Cloud Pak URLs.  
