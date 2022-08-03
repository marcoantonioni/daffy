---
hide:
  - footer
---

<script>
  document.title = "Deploy OCP - ROKS";
</script>
#ROKS Install

<img src='../images/ROKS.jpeg'   align="top" width="200"  height="300" style = "float">

At this point, you have a bastion machine where you have installed the Daffy tool, created your core <b>environment-name</b>-env.sh and can execute the install of OCP on ROKS.

## Platform Requirements

To use Daffy to provision <b>R</b>ed <b>H</b>at <b>O</b>penShift <b>K</b>ubernetes <b>S</b>ervices on IBM Cloud (ROKS), there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that lists all providers and what would be needed. For ROKS, it breaks down to the following basic two items:

<b>Account Details:</b> the account that you plan to install ROKS on

<b>Account Type:</b> the account type needed to perform the install

For a detailed list of the above, you can read the Daffy Provider Requirements. Please review before proceeding.

[https://ibm.box.com/v/DaffyProviderRequirements](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank}

## Finding Provider Details

To use Daffy to install ROKS, you must find the provider details. Luckily, Daffy automatically walks you through this process using IBM Cloud CLI. Below are the steps you can use to make sure you use the right information.

<b>Account:</b>
to find more details on managing your IBM Cloud account, you can refer to this.

[https://cloud.ibm.com/docs/account?topic=account-account-getting-started](https://cloud.ibm.com/docs/account?topic=account-account-getting-started){target=_blank}

You must have an IBMid before logging in. The link above can help create one. If you are an IBM employee, your IBMid is most likely some numbers followed by your name.

You can list your Account ID from the drop down:
<img src="../images/download.jpeg" style="float: left; margin-right: 10px;" />

<b>Location/Zone:</b>
to find a list of available data center locations/zones, you can refer to this.

[https://cloud.ibm.com/docs/overview?topic=overview-locations#mzr-table](https://cloud.ibm.com/docs/overview?topic=overview-locations#mzr-table){target=_blank}


Note: Daffy currently only supports single datacenter location installs with classic infrastructure
### Zones

Regions are collections of zones. Zones have high-bandwidth, low-latency network connections to other zones in the same region. In order to deploy fault-tolerant applications that have high availability, IBM recommends deploying applications across multiple zones and multiple regions. This helps protect against unexpected failures of components, up to and including a single zone or region.

Choose regions that makes sense for your scenario. For example, if you only have customers in the US, or if you have specific needs that require your data to live in the US, it makes sense to store your resources in zones in the dal13 zone or in the wdc07 zone. Daffy currently defaults to dal13 when deploying a ROKS cluster


[https://cloud.ibm.com/docs/containers?topic=containers-regions-and-zones#locations](https://cloud.ibm.com/docs/containers?topic=containers-regions-and-zones#locations){target=_blank}

### Account types
Your IBM Cloud account includes many interacting components and systems for resource, user, and access management. Concepts like how certain components are connected or how access works help you in understanding how to set up your account type. Many features are free to use regardless of account type.

<b> Account Type: </b>
for you to use Daffy to install on ROKS, you need to have a Pay-As-You-Go or subscription IBM Cloud account.

[https://cloud.ibm.com/docs/account?topic=account-accounts](https://cloud.ibm.com/docs/account?topic=account-accounts){target=_blank}

## Environment File

Deploying OpenShift on ROKS only requires one entry to your existing core environment file (<ENVIRONMENT_NAME>-env.sh).



Note: You can look in the samples directory on your bastion for example of ROKS install : /data/daffy/env/samples/roks-msp-env.sh



You can copy the sample file to build your new environment  file.
```console
cp /data/daffy/env/samples/roks-msp-env.sh /data/daffy/env/<ENVIRONMENT_NAME>-env.sh
```
Valid Options:

OCP_INSTALL_TYPE= roks-msp



Optional:

ROKS_ZONE=dal13

```R
OCP_INSTALL_TYPE="roks-msp"
#ROKS_ZONE="dal13"

```
## Execution

To deploy your OCP cluster to ROKS, run the build.sh script from the /data/daffy/ocp directory. The installer will ask you a number of questions to login to IBM Cloud via the CLI. When prompted with a region, select any but stay within your geography. For instance, us-south. This is used to talk with IBM Cloud via the right API endpoint.
```console
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```
Once your cluster is fully deployed, you can access the help menu which has a number of options.

<b> Note: </b> <ENVIRONMENT_NAME> is the first part of your name that you used for the <ENVIRONMENT_NAME>-env.sh file

```console
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME> --help
```

Here is a full example for deploying OpenShift on <b>ROKS</b> with the Daffy process.
<button onclick="location.href='../../Cloud-Paks/'" class="custom-btn btn-7">Installing Cloud Paks</button>
