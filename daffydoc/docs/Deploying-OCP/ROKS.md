---
hide:
  - footer
---


#ROKS Install

<img src='../images/ROKS.jpeg'   align="top" width="200"
  height="300" style = "float">

At this point, you have a bastion machine where you have installed the Daffy tool, created your core <b>environment-name</b>-env.sh and can execute the install of OCP on ROKS.

##Step 1: Platform Requirements

To use Daffy to provision <b>R</b>ed <b>H</b>at <b>O</b>penShift <b>K</b>ubernetes <b>S</b>ervices on IBM Cloud (ROKS) , there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.  For ROKS, it breaks down to the following basic two items:

<b>Account Details</b> - The account that you plan to install ROKS

<b>Account Type</b> - The account type needed to perform the install

For detailed list of the above, you can find in the Daffy Provider Requirements. Please review before proceeding.

[https://ibm.box.com/v/DaffyProviderRequirements](https://ibm.box.com/v/DaffyProviderRequirements)

##Step 2: Finding Provider Details

To use Daffy to install ROKS, you must find the provider details. Luckily, Daffy automates this as it walks you through this process using ibmcloud CLI. Below are the steps you can use to make sure you use the right information.

<b>Account:</b>

To find more details IBM Cloud account and how to manage you can refer to this:

https://cloud.ibm.com/docs/account?topic=account-account-getting-started

You must have an IBMid before logging in and the link above can help create one. If you are an IBM employee, after the number will most likely be your name.

You can list your Account ID from the Drop down
<img src="../images/download.jpeg" style="float: left; margin-right: 10px;" />

Location/Zone:
To find a list of available datacenter locations/zones, you can refer to this:

https://cloud.ibm.com/docs/overview?topic=overview-locations#mzr-table

Note: Daffy currently only supports single datacenter location installs with classic infrastructure
### Identifying a datacenter location/zone

Regions are collections of zones. Zones have high-bandwidth, low-latency network connections to other zones in the same region. In order to deploy fault-tolerant applications that have high availability, IBM recommends deploying applications across multiple zones and multiple regions. This helps protect against unexpected failures of components, up to and including a single zone or region.

Choose regions that makes sense for your scenario. For example, if you only have customers in the US, or if you have specific needs that require your data to live in the US, it makes sense to store your resources in zones in the dal13 zone or in the wdc07 zone. Daffy currently defaults to dal13 when deploying a ROKS cluster

<b> Account Type: </b>
For you to use Daffy to install on ROKS, you need to have a Pay-As-You-Go or subscription IBM Cloud account.

https://cloud.ibm.com/docs/account?topic=account-accounts

### What are account types?
Your IBM Cloud account includes many interacting components and systems for resource, user, and access management. Concepts like how certain components are connected or how access works help you in understanding how to set up your account type. Many features are free to use regardless of account type.

## Step 3: Environment File

Deploying OpenShift on ROKS only requires one entry to your existing core environment file (<ENVIRONMENT_NAME>-env.sh).



Note: You can look in the samples directory on your bastion for example of ROKS install : /data/daffy/env/samples/roks-msp-env.sh



You can copy the sample file to build your new environment  file.
```
cp /data/daffy/env/samples/roks-msp-env.sh /data/daffy/env/<ENVIRONMENT_NAME>-env.sh
```
Valid Options:

OCP_INSTALL_TYPE= roks-msp



Optional:

ROKS_ZONE=dal13

```
OCP_INSTALL_TYPE="roks-msp"
#ROKS_ZONE="dal13"

```
## Step 4: Execution

To deploy your OCP cluster to ROKS, run the build.sh script from the /data/daffy/ocp directory. The installer will ask you a number of questions to login to ibmcloud via the CLI. When prompted with a region, select any but stay within your geography. For instance, us-south. This is used to talk with IBM Cloud via the right API endpoint.
```
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```
Once your cluster is fully deployed you can access the help menu which has a number of options.

<b> Note: </b> <ENVIRONMENT_NAME> is the first part of your name that you used for the <ENVIRONMENT_NAME>-env.sh file

```
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME> --help
```

Here is a full example for deploying OpenShift on <b>ROKS</b> with the Daffy process.

<button onclick="location.href='/daffy/Cloud-Paks/'" class="custom-btn btn-7">
Installing Cloud Paks</button>






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
