---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - AWS ROSA";
</script>

#Azure Install
<img src='../images/aws/rosa.jpg'   align="top" width="200"  height="300" style = "float">

At this point, you have a bastion machine where you have installed the Daffy tool, and ready to created your core <b>environment-name</b>-env.sh and so you can execute the install of OCP on AWS via ROSA.

## Platform Requirements

To use Daffy on **AWS**, there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.  For **AWS ROSA**, it breaks down to the following basic three items:

**Account Details** - The account that you plan to install OpenShift

**Permissions** - The permissions need to perform the install

**Quota** - The ability to add new workload to that platform

For detailed list of the above, you can find in the Daffy Provider Requirements. Please review before proceeding.

[https://ibm.box.com/v/DaffyProviderRequirements](https://ibm.box.com/v/DaffyProviderRequirements){target=_blank}

## Finding Provider Details

To install Daffy on AWS, the hardest part can be finding the provider details.

More Details Comming!!!!!!!!!!!!!

### <font color="red">Access Key ID</font>
First search for........?????
??? Info "Screenshot Locate Access Key ID"
    <img src='../../images/Under_construction_icon-yellow.svg.png' height="10%" width="10%"  align="top"  style = "float">

[<img src='../../images/httpLinkIcon.png' height="1%" width="1%"> More Info](http://www.google.com ){target=_blank}

### Permission

Within your AWS project, you would need to go to IAM  Section and create/use Service Account.  From the [requirements doc](https://ibm.box.com/v/DaffyProviderRequirements), make sure your service account has the correct permissions.  Look at the AWS section, it is same plus a few extra needed for ROSA.


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
