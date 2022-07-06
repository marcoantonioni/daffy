## Step 1: Access your bastion Server
[Create Bastion Steps](../Supporting-Software/Create-Your-Own-Bastion.md){ .md-button .md-button--primary }

  <b>*** If  you do not have a bastion, above button/link will walk you thru the process to create a Linux bastion server.</b>

## Step 2: Install Daffy

Log into your Bastion Machine (as root) and run the following command to download the latest Daffy Scripts.

```
wget http://get.daffy-installer.com/download-scripts/daffy-init.sh; chmod 777 daffy-init.sh;./daffy-init.sh

```

## Step 3: Create <environment-name>-env.sh

```
DAFFY_UNIQUE_ID="<YourID@ibm.com>"
#This is required - Values POC/Demo/Enablement/HCCX/TechZone
DAFFY_DEPLOYMENT_TYPE=""
#If POC/Demo, these are required.
#ISC number must be 18 characters
#DAFFY_ISC_NUMBER="0045h00000w1nvKAAG"
#DAFFY_CUSTOMER_NAME="Acme Customer"

BASE_DOMAIN="<YOUR.BASEDOMAIN.COM>"
CLUSTER_NAME="<ENVIRONMENT_NAME>"
OCP_RELEASE="4.8.36"
VM_TSHIRT_SIZE="Large"
```

This file is where you store values that will define your environment and Daffy will use to build your environment.

Place your file in :

/data/daffy/env/<ENVIRONMENT_NAME>-env.sh



** Best practices is <ENVIRONMENT_NAME> is your cluster name but not required.



**DAFFY_DEPLOYMENT_TYPE** - Values POC/Demo/Enablement/HCCX/TechZone
**DAFFY_ISC_NUMBER** - If Demo or POC, the ISC Record Number

**DAFFY_CUSTOMER_NAME** - If Demo or POC, the Customer Name

**BASE_DOMAIN** - Is your DNS name your cluster will use

**CLUSTER_NAM**E - The name you want to give your OpenShift Cluster

**OCP_RELEASE** - What version of OpenShift you want to Install

**VM_TSHIRT_SIZE** - How large you want the OpenShift Cluster to be. Min and Large Supported today

** If **MSP** type install like ROKS, **BASE_DOMAIN** is not needed.

**Optionally:** As a starting point, you can copy a sample environment file from the samples folder located here:  /data/daffy/env/samples/<platform>-env.sh
```
cd /data/daffy/env/samples
```

Replace these values for the next command.

**<platform>** = This is the sample file name for the platform you are planning to deploy your OCP Cluster.

**<environment>** = This is the name of your environment file. As a best practice, we recommend you use the name of your cluster.

This command will copy the the sample file and place it in the /data/daffy/env directory (back one folder)

```
cp <platform>-env.sh ../<environment>-env.sh

```

You are NOW ready to begin making the necessary edits to your **/data/daffy/env/<environment>-env.sh** file for a deployment of OCP to a specific platform.

## Step 4: Install OpenShift on your selected platform

[IBM GYM](../Deploying-OCP/IBM-gym.md){ .md-button .md-button--primary }
[KVM](../Deploying-OCP/kvm.md){ .md-button .md-button--primary }
[Google Cloud Platform](../Deploying-OCP/GCP.md){ .md-button .md-button--primary }
[Amazon Web Services](../Deploying-OCP/AWS.md){ .md-button .md-button--primary }
[Microsoft Azure](../Deploying-OCP/Azure.md){ .md-button .md-button--primary }
[VMWare VSphere](../Deploying-OCP/VSphere.md){ .md-button .md-button--primary }
[IBM RedHat OpenShift](../Deploying-OCP/ROK.md){ .md-button .md-button--primary }
