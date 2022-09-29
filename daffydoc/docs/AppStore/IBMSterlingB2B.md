---
hide:
  - footer
---
<script>
  document.title = "AppStore - IBM Sterling B2B";
</script>

<img src='../images/IBM_Sterling_B2B_Integration.png'
       style="width:100px;height:100px;"/>

#Info
Auto-installation tool for IBM-Sterling B2Bi and IBM-Sterling File Gateway containers in a clustered environment.

This tool was developed to simplify the basic installation of containers for IBM Sterling B2Bi-SFG on RedHat OpenShift Container Platform.

# Basic assumptions / prerequisites:

You have already installed a ROKS cluster. You can do this manually, through TechZone or using the Daffy_RHOCP_Installer. The remainder of this documentation assumes you have already installed a ROKS cluster using the Daffy_RHOCP_Installer but can be easily adapted to the other methods of ROKS installation.

You are using a UNIX / Linux bastion host to install and run the scripts. The bastion host can be located in any cloud (AWS, Azure, GCP, IBM or private). You may also be able to use your workstation as a bastion host as long as you have the rights to install software on it.

You have already created a file containing your IBM software entitlement key on the bastion host. This key will allow access to the IBM B2Bi/SFG software in the IBM Container registry during the final helm install process.
You already know the ingress subdomain of the cluster where you will be installing this software. This is available on the cluster dashboard webpage after Daffy installation. If you are not sure how or where to find this information click here.


<button onclick=" window.open('https://github.com/IBM/B2Bi-SFG-on-Daffy-RHOCP/', '_blank'); return false;" class="custom-btn btn-7">Install Instructions</button>
