---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - Core Steps";
</script>
## Step 1: Bastion Server
<button onclick="location.href='../../Supporting-Software/Bastion/'" class="custom-btn btn-7">Create Bastion Steps</button>

  <b>*** If  you do not have a bastion, above button/link will walk you through the process to create a Linux bastion server.</b>

## Step 2: Sizing

Go to the following site to size your OpenShift cluster to meet your software needs

<button onclick=" window.open('https://app.ibmsalesconfigurator.com/#/', '_blank'); return false;" class="custom-btn btn-7">CloudPak Sizing</button>


## Step 3: Install Daffy

Log into your Bastion Machine (as root) and run the following command to download the latest Daffy Scripts:

```console
wget http://get.daffy-installer.com/download-scripts/daffy-init.sh; chmod 777 daffy-init.sh;./daffy-init.sh

```
**Optional:** You may choose to use the Daffy Web Configurator or Daffy CLI Configurator! The purpose of these tools are to help you build your environment file

<button onclick=" window.open('http://config.daffy-installer.com:1887/start', '_blank'); return false;" class="custom-btn btn-7">Online Configurator</button>
<button onclick="location.href='../../AppStore/IBMDaffyCLIConfigurator/'" class="custom-btn btn-7">CLI Configurator</button>

## Step 4: Environment File

```R
#Daffy Values
#########################
DAFFY_UNIQUE_ID="<YourID@email.com>"
#This is required - Values POC/Demo/Enablement/HCCX/TechZone
DAFFY_DEPLOYMENT_TYPE="PickValueFromLineAbove"
#If POC/Demo, these are required.
#ISC number must be 18 characters
#DAFFY_ISC_NUMBER="0045h00000w1nvKAAG"
#DAFFY_CUSTOMER_NAME="Acme Customer"

#Core Values
#########################
BASE_DOMAIN="<YOUR.BASEDOMAIN.COM>"
CLUSTER_NAME="<ENVIRONMENT_NAME>"
#This is required - Values aws-ipi/azure-ipi/gcp-ipi/vsphere-ipi/vsphere-upi/kvm-upi/roks-msp
OCP_INSTALL_TYPE="PickValueFromLineAbove"
OCP_RELEASE="4.10.32"
VM_TSHIRT_SIZE="Large"
```


This file is where you store values that will define your environment and Daffy will use to build your environment.

Place your file in the following folder with your environment name in the following formatting:

```console
/data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh
```

Best practice is to set <**ENVIRONMENT_NAME**> as your cluster name, but that is not required.



Name  | Example Values  | Description
:----------- |:----------- |:-----------
DAFFY_DEPLOYMENT_TYPE | Enablement |  POC/Demo/Enablement/HCCX/TechZone/PostSale |
DAFFY_ISC_NUMBER | 0045h00000w1nvKAAG |  Required if Demo, POC or PostSale
DAFFY_CUSTOMER_NAME | Acme Shoes  | Required if Demo, POC or PostSale
BASE_DOMAIN | acme-shoes.com |  Is your DNS name your cluster will use
CLUSTER_NAME | demo01 | The name you want to give your OpenShift Cluster
OCP_INSTALL_TYPE | aws-ipi | The name of the install type you want  aws-ipi/azure-ipi/gcp-ipi/vsphere-ipi/vsphere-upi/kvm-upi/roks-msp
OCP_RELEASE | 4.10.17 | What version of OpenShift you want to Install
VM_TSHIRT_SIZE | Large | How large you want the OpenShift Cluster to be. **Min** and **Large** Supported today

!!! Info
      If **MSP** type install like ROKS, **BASE_DOMAIN** is not needed.

**Optionally:** As a starting point, you can copy a sample environment file from the samples folder located here:  /data/daffy/env/samples/&lt;platform&gt;-env.sh
```console
cd /data/daffy/env/samples
```

Replace these values for the next command:

- <**platform**> = the sample file name for the platform you are planning to deploy your OCP Cluster.

- <**environment**> = the name of your environment file. As a best practice, we recommend you use the name of your cluster.

**Example:**  cp /data/daffy/env/samples/aws-ipi-env.sh /data/daffy/env/demo01-env.sh

This command will copy the sample file and place it in the /data/daffy/env directory, and your new environment name will be **demo01**

```console
cp /data/daffy/env/samples/<platform>-env.sh /data/daffy/env/<environment>-env.sh

```

**Debug Flag**

Setting the debug flag to true will stop you at every check point and ask you to hit enter. Setting the debug flag to false will run though the script without any interference.  

```R
DEBUG="false"
```

## Step 5:  DNS Requirements

For OpenShift to be installed, you will need to setup your own DNS or use existing domain/subdomain. You can not use local host files or local resolver.

### **vSphere and KVM UPI**
1. api.${CLUSTER}.${YOUR.DOMAIN.COM}          --->    ${YOUR.BASTION.IP}  
2. api-int.${CLUSTER}.${YOUR.DOMAIN.COM}      --->    ${YOUR.BASTION.IP}  
3.  *.apps.${CLUSTER}.${YOUR.DOMAIN.COM}      --->    ${YOUR.BASTION.IP}  

### **vSphere IPI**
1. api.${CLUSTER}.${YOUR.DOMAIN.COM}          --->    Unused Static IP #1   
2. *.apps.${CLUSTER}.${YOUR.DOMAIN.COM}       --->    Unused Static IP #2   

??? Info "Allow Daffy to crate DNS entries in IBM Cloud"
    If you want the daffy tool to create your above DNS entires in IBM Cloud, add the following to your ~/.profiles
    ```R  
    DNS_API_KEY="YOURDNSAPIKEY"
    DNS_DOMAIN_ID="YOURDNSDOMAINID"
    ```
### **AWS, Azure, GCP IPI**

1. Have/Create DNS domain/subdomain (**More Detail for DNS on next steps**)
2. Transfer domain/subdomain to your provider (if not created there already)    
  a. Create hosted zone in provider      
  b. Use name servers from hosted zone to transfer your domain/subdomain      

### **TechZone, HCCX, ROKS**
1. You will not need DNS as they will provide for you

## Step 6a: Install OpenShift
You are **NOW** ready to begin making the necessary edits to your /data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh file for a deployment of OCP to a specific platform.
<div style="text-align:center">
<button onclick="location.href='../HCCX-gym'" class="custom-btn btn-7">HCCX Gym</button>
<button onclick="location.href='../TechZone'" class="custom-btn btn-7">TechZone</button>
<button onclick="location.href='../ROKS'" class="custom-btn btn-7">ROKS</button>
<button onclick="location.href='../VSphere'" class="custom-btn btn-7">VSphere</button>
<div></div>
<button onclick="location.href='../Azure'" class="custom-btn btn-7">Azure</button>
<button onclick="location.href='../AWS'" class="custom-btn btn-7">AWS</button>
<button onclick="location.href='../GCP'" class="custom-btn btn-7">GCP</button>
</div>

## Step 6b: Existing Cluster

If you already have an existing cluster that was not built with Daffy, you can still use daffy for Step 2 and/or Step 3.
The only extra step you need to do is via the command line on your bastion. You will need to login to your cluster via the **oc login** command. You can get this command from your OpenShift console. You would then move on to the Cloud Pak steps and skip the OpenShift Install.

**For Step 6b only**, If you do not have the oc command installed on your bastion, you can use the daffy tools command to installing it for you.

[https://ibm.github.io/daffy/Tips-and-Tricks/Common-Commands/#daffy-tools](https://ibm.github.io/daffy/Tips-and-Tricks/Common-Commands/#daffy-tools){target=_blank}


      /data/daffy/tools.sh --installOC

<button onclick="location.href='../../Cloud-Paks'" class="custom-btn btn-7">Cloud Paks</button>
