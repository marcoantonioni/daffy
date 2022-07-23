---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - TechZone";
</script>

# TechZone Install

<img src='../images/techzone.jpeg'   align="top" width="100"  height="200" style = "float">

At this point, you have a **bastion** machine where you have installed the Daffy tool, created your core <**ENVIRONMENT_NAME**>-env.sh.  Depending on if you use TechZone to build your cluster, you may skip Daffy Step 1 that builds your cluster. You will not use the bastion to build your cluster, but follow the steps to have TechZone build your cluster.  Once that is done, you would move on with the daffy process and install your cloud paks from your new **bastion.**

## Platform Requirements

There are three options with TechZone
!!! Warning   
      For IBM and Business Partners use only

  1. OpenShift Cluster via AWS, Azure (**Prebuilt** Cluster)   [https://techzone.ibm.com/collection/third-party-cloud-openshift-clusters](https://techzone.ibm.com/collection/third-party-cloud-openshift-clusters){target=_blank}
    - Does **NOT** include Bastion with request
    - With this option, you will skip Daffy step 1 (Build cluster) as TechZone will build for you. (This would fail as you do not have access to create cluster with a techzone setup)
    - You still need to have a bastion and core values in your <**ENVIRONMENT_NAME**>-env.sh



  2. Tech Zone VSphere (**Daffy** build's cluster) [https://techzone.ibm.com/collection/ocp-gymnasium](https://techzone.ibm.com/collection/ocp-gymnasium){target=_blank}
    - Includes Bastion with request
    - Once you create the request and the VSPhere environment has been provisioned, it will create your own bastion and give you the instructions on how to use Daffy in that environment with the prebuild <**ENVIRONMENT_NAME**>-env.sh.


  3. TechZone Roks (**Prebuilt** Cluster) [https://techzone.ibm.com/collection/custom-roks-vmware-requests](https://techzone.ibm.com/collection/custom-roks-vmware-requests){target=_blank}
    - Does **NOT** include Bastion with request
    - With this option, you will skip Daffy step 1 (Build cluster) as TechZone will build for you (This will fail as you do not have access to create cluster with a techzone setup)
    - Once you create the request, you would follow the same steps of ROKS with Daffy
    - You still need to have a bastion and core values in your <**ENVIRONMENT_NAME**>-env.sh  
    - Extra setting to change in your environment file      
          1. **ROKS_PROVIDER=**techzone
          2. **DAFFY_DEPLOYMENT_TYPE=**TechZone

<button onclick="location.href='../../Cloud-Paks/'" class="custom-btn btn-7">Installing Cloud Paks</button>
