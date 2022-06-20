
<img src='../images/Azure-Logo-1024x752.jpeg'   align="top" width="400"
  height="500" style = "float">

<a>[PREREQ](AWS.md){.md-button .md-button--primary}</a>

[CORE STEPS](index.md){.md-button .md-button--primary}

At this point, you have a bastion machine where you have installed the Daffy tool, created your core <b>environment-name</b>-env.sh and can execute the install of OCP on ROKS.

##Step 1 Platform Requirements

To use Daffy on **Azure**, there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.  For **Azure**, it breaks down to the following basic three items:

**Account Details** - The account that you plan to install OpenShift

**Permissions** - The permissions need to perform the install

**Quota** - The ability to add new workload to that platform

For detailed list of the above, you can find in the Daffy Provider Requirements. Please review before proceeding.

https://ibm.box.com/v/DaffyProviderRequirements

##Step 2 Finding Provider Details

To install Daffy on Azure, the hardest part can be finding the provider details.

Subscription ID:Details coming soon !!!

Client ID:Details coming soon !!!

Client Secret:Details coming soon !!!

Tenant ID:Details coming soon !!!

Base Domain Resource Group Name:Details coming soon !!!

Region:Details coming soon !!!

Quota:Details coming soon !!!

**Permission:**

Within your Azure project, you would need to go to IAM  Section and create/use Service Account.  From the requirements doc, make sure your service account has the correct permissions.

**Dedicated public host Zone:**

You will need to create a DNS Zone within a new/existing resource group.  For the OpenShift install, you need the following:

1. Registered DNS Name - **myexample.com**
2. Azure DNS Zone              - **myexample-com**
3. Transfer the domain to **Azure** Name services listed in your new **Azure** DNS Zone

**Setting up DNS for Azure Deployment with OpenShift:**
insert video Here
## Step 3 Environment File

Deploying the OpenShift on Azure only requires three entries to your **existing** core environment file (**<ENVIRONMENT_NAME>**-env.sh) plus a local service account file.

**Note:** You can look in the samples directory on your bastion for example of **Azure** install : /data/daffy/env/samples/**azure-ipi-env.sh**

You can copy the sample file to build your new environment  file.

```
OCP_INSTALL_TYPE="azure-ipi"
AZURE_SUBSCRIPTION_ID="999999-999999-999999-99999"
AZURE_CLIENT_ID="999999-999999-999999-99999"
AZURE_TENANT_ID="999999-999999-999999-99999"
AZURE_BASE_DOMAIN_RESOURCE_GROUP_NAME="<YOUR_RESOURCE_GROUP_FOR_DNS>"
AZURE_REGION="<YOUR_REGION>"
#OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE=true
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

If you plan to install a cloud pak and/or need storage, you need to set the flag to setup OCS Storage

**** It will prompt you for the Client Secret during the install.**

## Step 4 Execution
To deploy your OCP cluster to **Azure** , run the build.sh script from the /data/daffy/ocp directory

```
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```

Once your cluster is fully deployed you can access the help menu which has a number of options.

**Note:**<ENVIRONMENT_NAME> is the first part of your name that you used for the <**ENVIRONMENT_NAME**>-env.sh file

Here is a full example for deploying OpenShfit on **Azure** with the Daffy process.
