---
hide:
  - footer
---

## Step 1: Access your bastion Server
<button onclick="location.href='/daffy/Supporting-Software/Create-Your-Own-Bastion/'" class="custom-btn btn-7">Create Bastion Steps</button>

  <b>*** If  you do not have a bastion, above button/link will walk you thru the process to create a Linux bastion server.</b>

## Step 2: Install Daffy

Log into your Bastion Machine (as root) and run the following command to download the latest Daffy Scripts.

```
wget http://get.daffy-installer.com/download-scripts/daffy-init.sh; chmod 777 daffy-init.sh;./daffy-init.sh

```
**Optional:** You may choose to use the Daffy Web Configurator! The purpose of this tool is to help you build an environment file
[Daffy On-Line Configurator](http://config.daffy-installer.com:1887/start){ .md-button .md-button--primary }
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

<div style="text-align:left">

<button onclick="location.href='/daffy/Deploying-OCP/IBM-gym/'" class="custom-btn btn-7">IBM GYM</button>

<button onclick="location.href='/daffy/Deploying-OCP/GCP/'" class="custom-btn btn-7">GCP</button>

<button onclick="location.href='/daffy/Deploying-OCP/Azure/'" class="custom-btn btn-7">AZURE</button>

<button onclick="location.href='/daffy/Deploying-OCP/AWS/'" class="custom-btn btn-7">
AWS</button>
<div></div>

<button onclick="location.href='/daffy/Deploying-OCP/VSphere/'" class="custom-btn btn-7">
VSphere</button>

<button onclick="location.href='/daffy/Deploying-OCP/ROKS/'" class="custom-btn btn-7">
ROKS</button>

<button onclick="location.href='/daffy/Deploying-OCP/TechZone/'" class="custom-btn btn-7">
TechZone</button>

</div>

<!-- PUT ANY JS OR CSS BELOW HERE-->

<style>

.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
button {
  margin: 5px;
}
.custom-btn {
  width: 200px;
  height: 50px;
  color: black;
  border-radius: 10px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

/* 7 */
.btn-7 {
background: linear-gradient(0deg, rgba(255,151,0,1) 0%, rgba(251,75,2,1) 100%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-7 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-7:before,
.btn-7:after {
  position: absolute;
  content: "";
  right: 0;
  bottom: 0;
  background: rgba(251,75,2,1);
  box-shadow:
   -7px -7px 20px 0px rgba(255,255,255,.9),
   -4px -4px 5px 0px rgba(255,255,255,.9),
   7px 7px 20px 0px rgba(0,0,0,.2),
   4px 4px 5px 0px rgba(0,0,0,.3);
  transition: all 0.3s ease;
}
.btn-7:before{
   height: 0%;
   width: 2px;
}
.btn-7:after {
  width: 0%;
  height: 2px;
}
.btn-7:hover{
  color: rgba(251,75,2,1);
  background: transparent;
}
.btn-7:hover:before {
  height: 100%;
}
.btn-7:hover:after {
  width: 100%;
}
.btn-7 span:before,
.btn-7 span:after {
  position: absolute;
  content: "";
  left: 0;
  top: 0;
  background: rgba(251,75,2,1);
  box-shadow:
   -7px -7px 20px 0px rgba(255,255,255,.9),
   -4px -4px 5px 0px rgba(255,255,255,.9),
   7px 7px 20px 0px rgba(0,0,0,.2),
   4px 4px 5px 0px rgba(0,0,0,.3);
  transition: all 0.3s ease;
}
.btn-7 span:before {
  width: 2px;
  height: 0%;
}
.btn-7 span:after {
  height: 2px;
  width: 0%;
}
.btn-7 span:hover:before {
  height: 100%;
}
.btn-7 span:hover:after {
  width: 100%;
}
}
</style>