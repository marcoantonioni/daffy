---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - Azure";
</script>

#Azure Install
<img src='../images/Azure-Logo-1024x752.jpeg'   align="top" width="200"
  height="300" style = "float">

At this point, you have a bastion machine where you have installed the Daffy tool, created your core <b>environment-name</b>-env.sh and can execute the install of OCP on Azure.

## Platform Requirements

To use Daffy on **Azure**, there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.  For **Azure**, it breaks down to the following basic three items:

**Account Details** - The account that you plan to install OpenShift

**Permissions** - The permissions need to perform the install

**Quota** - The ability to add new workload to that platform

For detailed list of the above, you can find in the Daffy Provider Requirements. Please review before proceeding.

[https://ibm.box.com/v/DaffyProviderRequirements](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank}

## Finding Provider Details

To install Daffy on Azure, the hardest part can be finding the provider details.

Subscription ID:Details coming soon !!!

Client ID:Details coming soon !!!

Client Secret:Details coming soon !!!

Tenant ID:Details coming soon !!!

Base Domain Resource Group Name:Details coming soon !!!

Region:Details coming soon !!!

Quota:Details coming soon !!!

**Permission:**

Within your Azure project, you would need to go to IAM  Section and create/use Service Account.  From the [requirements doc](https://ibm.box.com/v/DaffyProviderRequirements), make sure your service account has the correct permissions.

**Dedicated public host Zone:**

You will need to create a DNS Zone within a new/existing resource group.  For the OpenShift install, you need the following:

1. Registered DNS Name - **myexample.com**
2. Azure DNS Zone              - **myexample-com**
3. Transfer the domain to **Azure** Name services listed in your new **Azure** DNS Zone

## Setting up DNS

<iframe width="560" height="315" src="https://www.youtube.com/embed/V8biZjrHfOM" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

## Environment File

Deploying the OpenShift on Azure only requires three entries to your **existing** core environment file (<**ENVIRONMENT_NAME**>-env.sh) plus a local service account file.

**Note:** You can look in the samples directory on your bastion for example of **Azure** install : /data/daffy/env/samples/**azure-ipi-env.sh**

You can copy the sample file to build your new environment  file.
```
cp /data/daffy/env/samples/azure-ipi-env.sh /data/daffy/env/<ENVIRONMENT_NAME>-env.sh
```


<u>
**Valid Options:**
</u>

**OCP_INSTALL_TYPE**="azure-ipi"

**AZURE_SUBSCRIPTION_ID**="<YOUR_SUB_ID>"

**AZURE_CLIENT_ID**="<YOUR_CLIENT_ID>"

**AZURE_TENANT_ID**=<YOUR_TENANT_ID>"

**AZURE_BASE_DOMAIN_RESOURCE_GROUP_NAME**=<YOUR_RESOURCE_GROUP_FOR_DNS>"

**AZURE_REGION**="<YOUR_REGION>"

Optional:

**OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE**=true

```
OCP_INSTALL_TYPE="azure-ipi"
AZURE_SUBSCRIPTION_ID="999999-999999-999999-99999"
AZURE_CLIENT_ID="999999-999999-999999-99999"
AZURE_TENANT_ID="999999-999999-999999-99999"
AZURE_BASE_DOMAIN_RESOURCE_GROUP_NAME="<YOUR_RESOURCE_GROUP_FOR_DNS>"
AZURE_REGION="<YOUR_REGION>"
#OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE=true
```

If you plan to install a cloud pak and/or need storage, you need to set the flag to setup OCS Storage

**** It will prompt you for the Client Secret during the install.**

## Execution
To deploy your OCP cluster to **Azure** , run the build.sh script from the /data/daffy/ocp directory

```
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```

Once your cluster is fully deployed you can access the help menu which has a number of options.

**Note:** <**ENVIRONMENT_NAME**> is the first part of your name that you used for the <**ENVIRONMENT_NAME**>-env.sh file


<button onclick="location.href='../../Cloud-Paks/'" class="custom-btn btn-7">
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
