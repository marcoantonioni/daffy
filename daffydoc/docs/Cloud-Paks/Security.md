---
hide:
  - footer
---
<script>
  document.title = "Cloud Pak - Security";
</script>
Cloud Pak for Security {: style="text-align: left;"}
===============
<img src='../images/security-cp.png'
       style="width:100px;height:100px;"/>

At this point, you have a working OCP cluster on your platform of choice. Your <**ENVIRONMENT_NAME**>-env.sh configuration file will contain details of the platform and OCP installation. You will now add the details of the Cloud Pak info that you wish to install to this file.

## Step 2: Deploy Cloud Pak
Deploying the Cloud Pak for Security only requires one entry to your environment file (/data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh)

**CP4SEC_VERSION=<version>**

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:

```R
CP4SEC_VERSION="1.10"
```

With this one value, the Daffy engine will be able to install the version of Cloud Pak for Security.
