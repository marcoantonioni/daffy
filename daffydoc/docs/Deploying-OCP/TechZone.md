# TechZone Install

<img src='../images/techzone.jpeg'   align="top" width="100"
  height="200" style = "float">

At this point, you have a **bastion** machine where you have installed the Daffy tool, created your core **<environment-name>**-env.sh.  Depneding on if you use TechZone to build your cluster, you may skip Daffy Step 1 that builds your cluster. You will not use the bastion to build your cluster, but follow the steps to have TechZone build your cluster.  Once that is done, you would move on with the daffy process and install your cloud paks from your new **bastion.**

## Platform Requirements

There are three options with TechZone

  1. OpenShift Cluster via AWS, Azure (**Prebuilt** Cluster)   https://techzone.ibm.com/collection/third-party-cloud-openshift-clusters
    * With this option, you will skip Daffy step 1 (Build cluster) as TechZone will build for you. (This will fail at you do not have access to create cluster)
    * You still need to have a bastion and core values in your **<environment-name>**-env.sh

  2. Tech Zone VSphere (**Daffy** build's cluster) https://techzone.ibm.com/collection/ocp-gymnasium
    - Once you crate the access to your VSphere ,it will create your own bastion and give you the instructions on how to use Daffy in that environment.
  3. TechZone Roks (**Prebuilt** Cluster)https://techzone.ibm.com/collection/custom-roks-vmware-requests
    - With this option, you will skip Daffy step 1 (Build cluster) as TechZone will build for you (This will fail as you do not have access to create cluster)
    - Once you create the access, you would follow the same steps of ROKS with Daffy
    - One extra setting to change in your environment file  DAFFY_DEPLOYMENT_TYPE=TechZone
