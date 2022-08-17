---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - AWS";
</script>

#AWS Install

<img src='../images/aws_new.jpeg'  align="top" width="200" height="300" style = "float">

##Platform Requirements

To use Daffy on **Amazon Web Services**, there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.  For **AWS**, it breaks down to the following basic three items:

  **Account Details** - The account that you plan to install OpenShift

  **Permissions** - The permissions need to perform the install

  **Quota** - The ability to add new workload to that platform

  For detailed list of the above, you can find in the Daffy Provider Requirements. Please review before proceeding.

  [https://ibm.box.com/v/DaffyProviderRequirements](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank}

##Finding Provider Details

To install Daffy on **AWS**, the hardest part can be finding the provider details in the portal.

To create or use an existing **AWS Access Key ID** you can refer to this:

[https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html?icmpid=docs_iam_console#Using_CreateAccessKey](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html?icmpid=docs_iam_console#Using_CreateAccessKey){target=_blank}

Note: Use the Identity and Access Management (IAM) service to manage access keys.

1. Select Search - find   IAM   service
2. You can create a new access key or use an existing key. The access key must have authority to the account you wan to install OpenShift into.

<img src='../images/aws_1.png'/>
<img src='../images/aws_2.png'/>
<img src='../images/aws_3.png'/>
<img src='../images/aws_4.png'/>
<img src='../images/aws_5.png'/>

**Secret Access Key:**
The secret access key is ONLY displayed at the time of creation. When you create the access key, you will then have the opportunity to capture the secret access key

!!! Note
      This is sensitive information, please make sure you store this in a secure location

The screen to the right is an example of what you will see when you create a NEW access Key.
<img src='../images/aws_6.png'/>

**Region:**

For you to use Daffy to install on **AWS** you need to choose a valid region identifier. This will be the target region you are planning to deploy OpenShift into.  

To see a complete list of available AWS Regions, you can select the region drop down list in the AWA Portal. This will be in the upper right hand corner next to your account name. (See picture to the right)

**Note:** Take note of the region identifier such as: us-east-2. This is the value you would use to deploy a OCP cluster into the US East (Ohio) region.  
<img src='../images/aws_7.png'/>  

**Permission:**

Within your **AWS** project, you would need to go to IAM  Section and make sure the user that is associated with your Access Key is assigned the correct roles.  

At minimum, you need to have this role: AdministratorAccess


Please see the [requirements doc](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank} for more information!

<img src='../images/aws_8.png'/>

**Hosted Zone:**

For each OpenShift deployment into **AWS**, you need to create a **Route 53 Hosted Zone .**

**Important**: You must create a Hosted Zone that exactly matches your Base Domain.

**Important:** Once you create your Hosted Zone, you must point your DNS registry Name Server records to the assigned AWS DNS Name Server records listed in this Hosted Zone. You will see the Name Servers listed once you have created the Hosted Zone.

<img src='../images/aws_9.png'/>
<img src='../images/aws_10.png'/>

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

**Quota:**

Please refer to the [requirements doc](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank} for a list of resource quota's that are required for deployment of OpenShift in AWS.

##Environment File

Below are the AWS specific environment variables that must be defined in the /data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh file.

- **AWS_REGION**
- **AWS_ACCESS_KEY_ID**

**Note**: You can look in the samples directory on your bastion for example of **AWS** install : /data/daffy/env/samples/**aws-ipi-env.sh**

You can run this command to build your **new** file from the sample.
```R
cp /data/daffy/env/samples/aws-ipi-env.sh /data/daffy/env/<ENVIRONMENT_NAME>-env.sh
```
**Valid Options:**

- **OCP_INSTALL_TYPE**=aws-ipi
- **AWS_REGION**=AWS-REGION
- **AWS_ACCESS_KEY_ID**=AWS-ACCESS_KEY-ID

```R
OCP_INSTALL_TYPE="aws-ipi"
AWS_REGION="<AWS-REGION>"
AWS_ACCESS_KEY_ID="<AWS-ACCESS_KEY-ID>"
#OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE=true
```

**Optional:**

**OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE**=true

If you plan to install a cloud pak and/or need storage, you need to set the flag to setup OCS Storage.

##Execution

To deploy your cluster, run the build.sh script from the /data/daffy/ocp directory.

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
