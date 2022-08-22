---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - IBM";
</script>

#IBM Install

<img src='../images/IBM-cloud.png'  align="top" width="200" height="300" style = "float">

##Platform Requirements

To use Daffy on **IBM Cloud**, there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.  For **IBM**, it breaks down to the following basic three items:

  **Account Details** - The account that you plan to install OpenShift

  **Permissions** - The permissions need to perform the install

  **Cloud Internet Services** - The ability to add DNS

  For detailed list of the above, you can find in the Daffy Provider Requirements. Please review before proceeding.

  [https://ibm.box.com/v/DaffyProviderRequirements](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank}

##Finding Provider Details

To install Daffy on **IBM**, the hardest part can be finding the provider details in the portal.

To create or use an existing **IBM API Key** you can refer to this:

[https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui](https://cloud.ibm.com/docs/account?topic=account-userapikey&interface=ui){target=_blank}

**Note:** Use the Identity and Access Management (IAM) service to manage access keys.

1. Select Manage - Access (IAM) from drop down menu, then select API keys on the left menu
2. You can create a new access key or use an existing key. The access key must have authority to the account you wan to install OpenShift into.

<img src='../images/ibm_ipi_apikey.jpg'/>
<img src='../images/ibm-ipi-apikeynew.jpg'/>
<img src='../images/ibm-ipi-createapi.jpg'/>

**IBM API Key:**
The IBM API key is ONLY displayed at the time of creation. When you create the access key, you will then have the opportunity to capture or download the key

!!! Note
      This is sensitive information, please make sure you store this in a secure location

The screen below is an example of what you will see when you create a NEW access Key.
<img src='../images/ibm-ipi-apicreated.jpg'/>

**Region:**

For you to use Daffy to install on **IBM** you need to choose a valid region identifier. This will be the target region you are planning to deploy OpenShift into.  

To see a complete list of available IBM Regions, go to the following website.

[https://cloud.ibm.com/docs/overview?topic=overview-locations](https://cloud.ibm.com/docs/overview?topic=overview-locations){target=_blank}

By default, Daffy sets this to us-south, but others are fully supported.

**Note:** Take note of the region identifier such as: us-south. This is the value you would use to deploy a OCP cluster into the US South (Dallas) region. This is the default if not in your environment file  

**Permission:**

Within your **IBM** account, you would need to go to IAM  Section and make sure the user that is associated with your account is assigned the correct roles.  

At minimum, you need to have this role: All Account Management services = All


Please see the [requirements doc](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank} for more information!

<img src='../images/ibm-ipi-user.jpg'/>

**Hosted Zone:**

For each OpenShift deployment into **IBM**, you need to have your own **Cloud Internet Services.** (CIS) service

**Important**: You must create a domain that exactly matches your Base Domain.

**Important:** Once you create your domain in your CIS instance, you must point your DNS registry Name Server records to the assigned IBM DNS Name Server records listed in this domain. You will see the Name Servers listed once you have created the Domain.

<img src='../images/ibm-ipi-cis.jpg'/>

##Setting up DNS

<html>
   <head>
      <title>HTML Video embed</title>
   </head>
   <body>
    <div style="text-align:center">
      <iframe width="560" height="315" src="https://www.youtube.com/embed/Zg3eFa47PKk" frameborder="0" allowfullscreen></iframe>
      </iframe>
      </div>
   </body>
</html>

##Environment File

Below is the IBM specific environment variable that must be defined in the /data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh file:

- **CIS_INSTANCE_NAME**

!!! Note
      You can look in the samples directory on your bastion for example of **IBM** install : /data/daffy/env/samples/**ibm-ipi-env.sh**

You can run this command to build your **new** file from the sample.
```R
cp /data/daffy/env/samples/ibm-ipi-env.sh /data/daffy/env/<ENVIRONMENT_NAME>-env.sh
```
**Valid Options:**

- **OCP_INSTALL_TYPE**=ibm-ipi
- **CIS_INSTANCE_NAME**="YOUR IBM CIS Instance"

```R
OCP_INSTALL_TYPE="ibm-ipi"
CIS_INSTANCE_NAME="YOUR IBM CIS Instance"
#OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE=true
```

**Optional:**

**OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE**=true

If you plan to install a cloud pak and/or need storage, you need to set the flag to setup OCS Storage.

##Execution

To deploy your cluster, run the build.sh script from the /data/daffy/ocp directory:

```R
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```

Once your cluster is fully deployed you can access the help menu which as a number of options.

!!! Note
      &lt;**environment**&gt; is the first part of your name that you used for the &lt;**environment**&gt;-env.sh file

```R
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME> --help
```

<button onclick="location.href='../../Cloud-Paks/'" class="custom-btn btn-7">
Installing Cloud Paks</button>
