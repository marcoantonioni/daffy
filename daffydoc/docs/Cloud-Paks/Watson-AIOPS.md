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

At this point, you should have a working OCP cluster on your platform of choice. Your <**ENVIRONMENT_NAME**>-env.sh configuration file will contain details of the platform and OCP installation. To install CP4WAIOPS, you must add some additional information to the env file. Below is a description of the information, you wll need to add.

1) Version of the CP4WAIOPS product to install

2) The CP4WAIOPS services that you wish to install

Daffy automation scripts currently support the deployment of

* **AI Manager** - (This is installed with the cp4waiops/build.sh script)
* **Event Manager** - This is an optional component that can be installed with the service.sh scrpt. You must set the install fag to true before you run the service.sh script.

!!! Note
      The Daffy Event Manager deployment script ONLY installs the operator. You must configure and deploy the custom resource.  

*  **Infrastructure Automation** - This is an optional component that can be installed with the service.sh scrpt. You must set the install fag to true before you run the service.sh script.

## Step 2: Deploy Cloud Pak for WAIOPS + AI Manager

Deploying the Cloud Pak for Watson AIOps only requires **one** entry to your environment file (/data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh)

**CP4WAIOPS_VERSION=<version>**

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:

```R
CP4WAIOPS_VERSION="3.6.0"
```

With this one value, the Daffy engine will be able to install the version of Cloud Pak for Watson AI Ops and the Platform Navigator. Along with the base cloud pak components, the AI Manager will be installed.

The service consist of the following products:

**AI Manager**

| AIOps Supported Version    | OCP Versions |
| :---      |    :----     |
| 3.6.2     | 4.10    |
| 3.6.1     | 4.10    |
| 3.6.0     | 4.10    |
| 3.5.1     | 4.10    |
| 3.5.0     | 4.10    |




**Run the following command** to deploy the Cloud Pak for Watson AIOps + AI Manger:

```
/data/daffy/cp4waiops/build.sh <ENVIRONMENT_NAME>
```

When this step is complete, up to an hour depending on your environment, you have the Cloud Pak running. This will install all of the Cloud Pak operators including foundational services and the Platform Navigator. The cluster is now ready to deploy additional services and or demos.  At this stage, the cluster consists  of common services and the Cloud Pak for Watson AIOps operators and some services in the following projects:

**cp4waiops**

**ibm-common-services**

!!! warning
     Occasionally you may see the following error message, which is usually not a big concern. We have noticed that in some cases (***primarily on ROKS when doing an all in one deployment***) the install of the event manager will take longer than normal to deploy. In this case you may see a message like this below. If that happens, please give some additional time (usually no more than 30 minutes) to verify your installation.

<img src='../images/evntmgr-deploy-error.png'/>

Run the ***--console*** command after 30 minutes to show you the login information. Details of the ***--console*** command are below.


## Step 3: Deploy Cloud Pak for WAIOPS Optional Services

There are 2 services that can be optionally installed after you have the Cloud Pak for Watson AIOPS installed.

* Event Manager (Operator ONLY)
* Infrastructure Automation

The **Event Manager** for WatsonAIOps is an optional service deployment that can be added to your WatsonAIOps Cloud Pak deployment. To deploy the Event Manager component of WatsonAIOps, you will need to set the flag within your environment file then run the service.sh script.  

!!! Warning
      As of today, you can ONLY deploy the Event Manager service as an additional component to the Cloud Pak for Watson AIOps. Installing the Watson AIOps Cloud Pak will by default install the AI Manager component. It is not possible today to only install the Event Manager component without the AI Manager.  

Here is the flag that will need to be set to enable the deployment of Event Manager Operator:

```
CP4WAIOPS_DEPLOY_EMGR=<true|false>
```

!!! Note
    **POST EVENT MANAGER INSTALL STEPS** The Daffy scripts for deployment of Watson AIOPS Event Manager will configure the subscription and deploy the event manager operator. You will need to configure the NOI (Event Manager) instance manually. This is because Event Manager can be configured to collect, consolidate, and correlate events and topology data from a multitude of sources, which may require additional parameters specific to your environment.  

This is a screen shot of what you will see after Daffy deploys the event manager operator. Please follow the instructions to complete the configuration of the Event Manager (NOI) instance.

<img src='../images/evntmgr_config.png'/>

Here is the flag that will need to be set to enable the deployment of **Infrastructure Automation**:

```
CP4WAIOPS_DEPLOY_IA=<true|false>
```

**Run the following command** to deploy the Cloud Pak for Watson AIOps Optional Services:

```
/data/daffy/cp4waiops/service.sh <ENVIRONMENT_NAME>
```

When this step is complete you will have the Cloud Pak and the optional services running.


## Step 4: Status & Console

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
