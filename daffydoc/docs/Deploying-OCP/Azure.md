---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - Azure";
</script>

#Azure Install
<img src='../images/Azure-Logo-1024x752.jpeg'   align="top" width="200"  height="300" style = "float">

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

### <font color="red">Subscription ID</font>
First find subscriptions in your account from the search box
??? Info "Screenshot Locate Subscriptions"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-Subscriptions1.png'   align="top"  style = "float">

[<img src='../../images/httpLinkIcon.png' height="1%" width="1%"> More Info](https://learn.microsoft.com/en-us/azure/azure-portal/get-subscription-tenant-id#find-your-azure-subscription ){target=_blank}

Once you find the subscription you want to use, you can see the Subscription ID
??? Info "Screenshot Locate Subscription ID"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-Subscriptions2.png'   align="top"  style = "float">

### <font color="red">Tenant ID</font>
First you need to find the Active Direcotry for your account
??? Info "Screenshot Active Directory"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-ActiveDirectory1.png'   align="top"  style = "float">

From your active directory, you can locate the Tenant ID    
??? Info "Screenshot Tenant ID"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-TenantID.png'   align="top"  style = "float">

[<img src='../../images/httpLinkIcon.png' height="1%" width="1%"> More Info](https://learn.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-how-to-find-tenant ){target=_blank}

### <font color="red">Client ID</font>
First you need to find the Active Directory for your account
??? Info "Screenshot Active Directory"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-ActiveDirectory1.png'   align="top"  style = "float">

Search for your appliation and from here you can find the client ID for the application you plan to use 
??? Info "Screenshot Client ID"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-ClientID1.png'   align="top"  style = "float">

[<img src='../../images/httpLinkIcon.png' height="1%" width="1%"> More Info](https://docs.lacework.com/onboarding/gather-the-required-azure-client-id-tenant-id-and-client-secret ){target=_blank}

### <font color="red">Region</font>
[<img src='../../images/httpLinkIcon.png' height="1%" width="1%"> More Info](https://www.jlaundry.nz/2022/azure_region_abbreviations/ ){target=_blank}

To find the region name, you can use the above link to list all azure region names, make sure you pick one that has avaiblity zone support
??? Info "Screenshot"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-Region1.png'   align="top"  style = "float">

### <font color="red">Quota</font>
In your subscription, under settings, you can find Usage + Quotas
??? Info "Screenshot"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-Quota1.png'   align="top"  style = "float">

In the Qutoa section, you can filter by regtion and type.  Then you can see your used and your max qutoa limits.
??? Info "Screenshot"
    <img src='../../Deploying-OCP/images/azure/AccountDetails-Quota2.png'   align="top"  style = "float"> 

[<img src='../../images/httpLinkIcon.png' height="1%" width="1%"> More Info](https://learn.microsoft.com/en-us/azure/networking/check-usage-against-limits){target=_blank}


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

!!! Note
    You can look in the samples directory on your bastion for example of Azure install : /data/daffy/env/samples/**azure-ipi-env.sh**

You can copy the sample file to build your new environment  file:
```R
cp /data/daffy/env/samples/azure-ipi-env.sh /data/daffy/env/<ENVIRONMENT_NAME>-env.sh
```


<u>
**Valid Options:**
</u>

| Variable Name                           | Info                                          | Default Value     | Required     |
| :---------                              |    :---------                                 |                   |   :----      |
| OCP_INSTALL_TYPE                        | Install type must be aro-msp                  |                   |   Yes        |
| AZURE_SUBSCRIPTION_ID                   | The subscription ID for your account in Azure |                   |   Yes        |
| AZURE_CLIENT_ID                         | The client ID for your account in Azure       |                   |   Yes        |
| AZURE_TENANT_ID                         | The Tenant ID for your account in Azure       |                   |   Yes        |
| AZURE_REGION                            | The Azure region you want to deploy to        |                   |   Yes        |
| AZURE_RESOURCE_GROUP_NAME               | The Azure network resource group name         |                   |   No         |
| AZURE_BASE_DOMAIN_RESOURCE_GROUP_NAME   | The Azure clsuter resource group name         |                   |   No         |
| OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE  | Do you want to deploy ODF storage             |       false       |   No         |
| AZURE_RESOURCE_GROUP_NAME_CREATE_MISSING| Do you want to deploy ODF storage             |       false       |   No         |


```R
#Azure Base Settings
####################
OCP_INSTALL_TYPE="azure-ipi"
AZURE_SUBSCRIPTION_ID="999999-999999-999999-99999"
AZURE_CLIENT_ID="999999-999999-999999-99999"
AZURE_TENANT_ID="999999-999999-999999-99999"
AZURE_RESOURCE_GROUP_NAME="<YOUR_RESOURCE_GROUP_FOR_CLUSTER>"
AZURE_BASE_DOMAIN_RESOURCE_GROUP_NAME="<YOUR_RESOURCE_GROUP_FOR_DNS>"
AZURE_REGION="<YOUR_REGION>"

#OpenShift Storage
####################
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
