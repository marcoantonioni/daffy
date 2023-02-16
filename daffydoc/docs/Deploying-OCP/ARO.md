---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - Azure ARO";
</script>

#Azure Install
<img src='../images/aro.png'   align="top" width="200"  height="300" style = "float">

At this point, you have a bastion machine where you have installed the Daffy tool, created your core <b>environment-name</b>-env.sh and can execute the install of OCP on Azure.

## Platform Requirements

To use Daffy on **Azure**, there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.  For **Azure**, it breaks down to the following basic three items:

**Account Details** - The account that you plan to install OpenShift

**Permissions** - The permissions need to perform the install

**Quota** - The ability to add new workload to that platform


**Base Domain Resource Group Name"
For detailed list of the above, you can find in the Daffy Provider Requirements. Please review before proceeding.

[https://ibm.box.com/v/DaffyProviderRequirements](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank}

## Finding Provider Details

To install Daffy on Azure, the hardest part can be finding the provider details.


| Variable Name                           | Info                                          | Required    |
| :---------                              |    :---------                                 |   :----     |
| AZURE_REGION                            | What region you want to deploy to             |   Yes       |
| AZURE_SUBSCRIPTION_ID                   | The fix version of your version supported     |   Yes       |
| AZURE_CLIENT_ID                         | The name of the service you want to deploy    |   Yes       |
| AZURE_TENANT_ID                         | The name of sample yaml you want to deploy    |   Yes       |



[Subscription ID](https://learn.microsoft.com/en-us/azure/azure-portal/get-subscription-tenant-id#find-your-azure-subscription ){target=_blank}
??? Info "Screenshot"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-Subscriptions1.png'   align="top"  style = "float">
    ??? Info "Screenshot"

[Client ID](https://learn.microsoft.com/en-us/azure/azure-portal/get-subscription-tenant-id#find-your-azure-subscription ){target=_blank}
    ??? Info "Screenshot"
        <img src='../../Deploying-OCP/images/azure/AccountDetails-Subscriptions1.png'   align="top"  style = "float">
        ??? Info "Screenshot"

[Tenant ID](https://learn.microsoft.com/en-us/azure/azure-portal/get-subscription-tenant-id#find-your-azure-subscription ){target=_blank}
??? Info "Screenshot"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-Subscriptions1.png'   align="top"  style = "float">
    ??? Info "Screenshot"

[Region](https://azure.microsoft.com/en-us/explore/global-infrastructure/products-by-region/?products=openshift&regions=all ){target=_blank}

[Quota](https://learn.microsoft.com/en-us/azure/networking/check-usage-against-limits){target=_blank}
    ??? Info "Screenshot"
        <img src='../../Deploying-OCP/images/azure/AccountDetails-Subscriptions1.png'   align="top"  style = "float">
        ??? Info "Screenshot"




**Permission:**

Within your Azure project, you would need to go to IAM  Section and create/use Service Account.  From the [requirements doc](https://ibm.box.com/v/DaffyProviderRequirements), make sure your service account has the correct permissions.


## Environment File

Deploying the OpenShift on Azure only requires three entries to your **existing** core environment file (<**ENVIRONMENT_NAME**>-env.sh) plus a local service account file.

!!! Note
    You can look in the samples directory on your bastion for example of Azure install : /data/daffy/env/samples/**azro-msp-env.sh**

You can copy the sample file to build your new environment  file:
```R
cp /data/daffy/env/samples/aro-msp-env.sh /data/daffy/env/<ENVIRONMENT_NAME>-env.sh
```


<u>
**Valid Options:**
</u>

**OCP_INSTALL_TYPE**="azure-ipi"

**AZURE_SUBSCRIPTION_ID**="<YOUR_SUB_ID>"

**AZURE_CLIENT_ID**="<YOUR_CLIENT_ID>"

**AZURE_TENANT_ID**=<YOUR_TENANT_ID>"

**AZURE_TENANT_ID**=<YOUR_TENANT_ID>"

**AZURE_RESOURCE_GROUP_NAME**="<YOUR_RESOURCE_GROUP_FOR_YOUR_CLUSTER>"

**AZURE_BASE_DOMAIN_RESOURCE_GROUP_NAME**="<YOUR_RESOURCE_GROUP_FOR_DNS>"

**AZURE_REGION**="<YOUR_REGION>"

Optional:

**OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE**="true"

**AZURE_RESOURCE_GROUP_NAME_CREATE_MISSING**="true"

```R
OCP_INSTALL_TYPE="azure-ipi"
AZURE_SUBSCRIPTION_ID="999999-999999-999999-99999"
AZURE_CLIENT_ID="999999-999999-999999-99999"
AZURE_TENANT_ID="999999-999999-999999-99999"
AZURE_RESOURCE_GROUP_NAME="<YOUR_RESOURCE_GROUP_FOR_CLUSTER>"
AZURE_BASE_DOMAIN_RESOURCE_GROUP_NAME="<YOUR_RESOURCE_GROUP_FOR_DNS>"
AZURE_REGION="<YOUR_REGION>"
#OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE="true"
#AZURE_RESOURCE_GROUP_NAME_CREATE_MISSING="true"
```

If you plan to install a cloud pak and/or need storage, you need to set the flag to setup OCS Storage

**** It will prompt you for the Client Secret during the install.**

## Execution
To deploy your OCP cluster to **Azure**, run the build.sh script from the /data/daffy/ocp directory:

```R
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```

Once your cluster is fully deployed you can access the help menu which has a number of options.

!!! Note
      <**ENVIRONMENT_NAME**> is the first part of your name that you used for the <**ENVIRONMENT_NAME**>-env.sh file


<button onclick="location.href='../../Cloud-Paks/'" class="custom-btn btn-7">Installing Cloud Paks</button>
