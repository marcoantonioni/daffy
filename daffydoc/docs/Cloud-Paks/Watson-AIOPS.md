---
hide:
  - footer
---
<script>
  document.title = "Cloud Pak - Watson AIOPS";
</script>
Cloud Pak for Watson AI Ops {: style="text-align: left;"}
===============
<img src='../images/WAIOPS.png'
       style="width:100px;height:100px;"/>

At this point, you have a working OCP cluster on your platform of choice. Your <**ENVIRONMENT_NAME**>-env.sh configuration file will contain details of the platform and OCP installation. You will now add to this file, the details of:

1) The Cloud Pak info that you wish to install

2) The services that you wish to install on the Cloud Pak



## Step 2: Deploy Cloud Pak

Deploying the Cloud Pak for Watson AIOps only requires **one** entry to your environment file (/data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh)

**CP4WAIOPS_VERSION=<version>**

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:

```R
CP4WAIOPS_VERSION=3.3.1
```

With this one value, the Daffy engine will be able to install the version of Cloud Pak for Watson AI Ops and the Platform Navigator. Along with the base cloud pak components, the AI Manager will be installed.

The service consist of the following products:

**AI Manager**

| AIOps Supported Version    | OCP Versions |
| :---      |    :----     |
| 3.3.1     | 4.8     |
| 3.2.0     | 4.8     |

**Run the following command** to deploy the Cloud Pak for Watson AIOps:

```
/data/daffy/cp4waiops/build.sh <ENVIRONMENT_NAME>
```

When this step is complete, up to an hour depending on your environment, you have the Cloud Pak running. This will install all of the Cloud Pak operators including foundational services and the Platform Navigator. The cluster is now ready to deploy additional services and or demos.  At this stage, the cluster consists  of common services and the Cloud Pak for Watson AIOps operators and some services in the following projects:

**cp4waiops**

**ibm-common-services**

## Step 3: Deploy Services

The Event Manager for WatsonAIOps is an optional service deployment that can be added to your WatsonAIOps Cloud Pak deployment. To deploy the Event Manager component of WatsonAIOps, you will need to set the flag within your environment file.

!!! Warning
      As of today, you can ONLY deploy the Event Manager service as an additional component to the Cloud Pak for Watson AIOps. Installing the Watson AIOps Cloud Pak will by default install the AI Manager component. It is not possible today to only install the Event Manager component without the AI Manager.  

Here is the flag that will need to be set to enable the deployment of Event Manager with Watson AIOps:

```R
CP4WAIOPS_DEPLOY_EMGR=<true|false>
```
## Step 3a: Status

The service can take a few hours to complete, based on which one you chose to deploy. To help monitor the status of the service/pattern deployment, you can run the help flag to see what flags you can use to get information on your service/pattern deployment:

```
/data/daffy/cp4waiops/build.sh <ENVIRONMENT_NAME> --help
```

**Run the following commands** to check the Cloud Pak for Watson AIOps installation progress:

```
/data/daffy/cp4waiops/build.sh <ENVIRONMENT_NAME> --status
```

If you want to have a running job to refresh every few seconds,  you can run the status script using the watch command:

```
watch -c /data/daffy/cp4waiops/build.sh <ENVIRONMENT_NAME> --status
```

To find out the connection info to your new service/pattern, you can run the console flag to get user names, passwords and URLs to connect to:

```
/data/daffy/cp4waiops/build.sh <ENVIRONMENT_NAME> --console
```
