---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - AWS ROSA";
</script>

#ROSA Install
<img src='../images/aws/rosa.jpg'   align="top" width="200"  height="300" style = "float">

At this point, you have a bastion machine where you have installed the Daffy tool, and ready to created your core <b>environment-name</b>-env.sh and so you can execute the install of OCP on AWS via ROSA.

## Platform Requirements

To use Daffy on **AWS**, there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.  For **AWS ROSA**, it breaks down to the following basic three items:

**Account Details** - The account that you plan to install OpenShift

**Permissions** - The permissions need to perform the install

**Quota** - The ability to add new workload to that platform

For detailed list of ROSA instructions, refer to the ROSA documentation.

[https://docs.openshift.com/rosa/welcome/index.html](ROSA Documentation){target=_blank}

For detailed list of the above, you can find in the Daffy Provider Requirements. Please review before proceeding.

[https://ibm.box.com/v/DaffyProviderRequirements](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank}

## One time ROSA setup

First login to the AWS Console, and search for ROSA service.

<img src='../images/rosa-search.jpg'/>

Click **Enable OpenShift** button in the ROSA Services page.

<img src='../images/rosa-enable.jpg'/>

Next, go to the Red Hat token page to get a ROSA token for login and generate or load an OpenShift Cluster Manager API Token.

!!! Note
    You must have a valid Red Hat login id. You can signup with any email address

[https://console.redhat.com/openshift/token/rosa](ROSA Token){target=_blank}

<img src='../images/rosa_token.jpg'/>

## Finding Provider Details

To install OpenShift on **AWS ROSA** using Daffy, the hardest part can be finding the provider details.

To create or use an existing **AWS Access Key ID** you can refer to this:

[https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html?icmpid=docs_iam_console#Using_CreateAccessKey](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_credentials_access-keys.html?icmpid=docs_iam_console#Using_CreateAccessKey){target=_blank}

**Note:** Use the Identity and Access Management (IAM) service to manage access keys.

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

## Environment File

Deploying the OpenShift on AWS only requires three entries to your **existing** core environment file (<**ENVIRONMENT_NAME**>-env.sh).

!!! Note
    You can look in the samples directory on your bastion for example of ROSA install : /data/daffy/env/samples/**rosa-msp-env.sh**

You can copy the sample file to build your new environment  file:
```R
cp /data/daffy/env/samples/rosa-msp-env.sh /data/daffy/env/<ENVIRONMENT_NAME>-env.sh
```


<u>
**Valid Options:**
</u>

| Variable Name                           | Info                                          | Default Value     | Required     |
| :---------                              |    :---------                                 |                   |   :----      |
| OCP_INSTALL_TYPE                        | Install type must be rosa-msp                 |                   |   Yes        |
| AWS_REGION                              | AWS region you want to deploy to              |                   |   Yes        |
| AWS_ACCESS_KEY_ID                       | Your AWS Access Key ID                        |                   |   Yes        |
| AWS_CREATE_EFS_STORAGE                  | Do you want to create EFS storage             |    false          |   No         |

```R
#ROSA Base Settings
####################
OCP_INSTALL_TYPE="rosa-msp"
AWS_REGION="us-east-2"
AWS_ACCESS_KEY_ID="123YOURACCESSKEYID12"

#Enable Features
#############################
#AWS_CREATE_EFS_STORAGE="true"

#ROSA Override Settings
####################

```

!!! warning "Storage"
    If you plan to install a cloud pak and/or need storage,  ODF/OCS is not currently supportd on ROSA. If you want daffy to setup the EFS Storage for you, you need to set the AWS_CREATE_EFS_STORAGE to true. Or you can build our use some other Storage provider.  


!!! info "Client Secret"
    It will prompt you for the Client Secret during the install

## Execution
To deploy your OCP cluster to **AWS ROSA**, run the build.sh script from the /data/daffy/ocp directory:

```R
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```

Once your cluster is fully deployed you can access the help menu which has a number of options.

!!! Note
      <**ENVIRONMENT_NAME**> is the first part of your name that you used for the <**ENVIRONMENT_NAME**>-env.sh file


<button onclick="location.href='../../Cloud-Paks/'" class="custom-btn btn-7">Installing Cloud Paks</button>
