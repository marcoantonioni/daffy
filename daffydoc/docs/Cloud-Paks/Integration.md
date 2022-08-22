---
hide:
  - footer
---
<script>
  document.title = "Cloud Pak - Integration";
</script>
Cloud Pak for Integration {: style="text-align: left;"}
===============
<img src='../images/integration.png'
       style="width:100px;height:100px;"/>

At this point, you have a working OCP cluster on your platform of choice. Your <**ENVIRONMENT_NAME**>-env.sh configuration file will contain details of the platform and OCP installation. You will now add to this file, the details of:

1) The Cloud Pak info that you wish to install

2) The services that you wish to install on the Cloud Pak

##Step 2: Deploy Cloud Pak

Deploying the Cloud Pak for Integration only requires one entry to your environment file (/data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh)

**CP4I_VERSION=<version>**

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:

```R
CP4I_VERSION="2022.2.1"
```

With this one value, the Daffy engine will be able to install the version of Cloud Pak for Integration and the Platform Navigator.

The service consist of the following products:

platform navigator

| Integration Supported Version    | OCP Versions |
| :---      |    :----     |  
| 2022.2.1     | 4.10     |
| 2021.4.1     | 4.6, 4.8      |
| 2021.3.1     | 4.6, 4.8      |
| 2021.2.1     | 4.6, 4.8      |

**Run the following command** to deploy the Cloud Pak for Integration:

```
/data/daffy/cp4i/build.sh <ENVIRONMENT_NAME>
```

When this step is complete, up to an hour depending on your environment, you will have the Cloud Pak running. This will install all of the Cloud Pak operators including foundational services and the Platform Navigator. The cluster is now ready to deploy additional services/patterns.  At this stage, the cluster consists of common services and the Cloud Pak for Integration operators and some services in the following projects:

**cp4i**

**ibm-common-services**

## Step 3: Deploy Services

Deploying the Cloud Pak for Integration requires some entries to your environment file (<ENVIRONMENT_NAME>-env.sh). The current services supported are App Connect Designer (ACEDESIGN), App Connect Dashboard (ACEDASH), Integration Asset Repository (ASSETREPO), Operations Dashboard Tracing (TRACING), Single Instance of MQ (MQSINGLE), API Connect (APIC), Cloud Native MQ HA (MQHA), and Event Streams (EVENTSTREAMS).

```R
CP4I_ENABLE_SERVICE_ACEDESIGN="true|false"

CP4I_ENABLE_SERVICE_ACEDASH="true|false"

CP4I_ENABLE_SERVICE_ASSETREPO="true|false"

CP4I_ENABLE_SERVICE_TRACING="true|false"

CP4I_ENABLE_SERVICE_MQSINGLE="true|false"

CP4I_ENABLE_SERVICE_APIC="true|false"

CP4I_ENABLE_SERVICE_MQHA="true|false"

CP4I_ENABLE_SERVICE_EVENTSTREAMS="true|false"
```
With these values, the Daffy engine will be able to install the version of Cloud Pak for Integration and prepare for the desired services.

**ACEDESIGN** - App Connect Designer

**ACEDASH** - App Connect Dashboard

**ASSETREPO** - Integration Asset Repository

**TRACING** - Operations Dashboard Tracing

**MQSINGLE** - Single Instance of MQ

**APIC** - API Connect

**MQHA** - Cloud Native MQ HA

**EVENTSTREAMS** - Event Streams

**Run the following command** to deploy the Cloud Pak for Integration services:

```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME>
```
## Step 3a: Status

The service can take a few hours to complete, based on which one you chose to deploy. To help monitor the status of the CP4I service deployment you can run the help flag to see what flags you can use to get information on your service deployment:

```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --help
```

**Run the following commands** to check the Cloud Pak for Integration services installation progress:

```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --AllStatus
```

If you want to want to see more detail status on an individual service, you can run each service status:

```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --AceDashStatus
```
```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --AceDesignStatus
```
```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --AssetRepoStatus
```
```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --TracingStatus
```
```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --MQSingleStatus
```
```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --APICStatus
```
```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --MQHAStatus
```
```
/data/daffy/cp4i/service.sh <ENVIRONMENT_NAME> --EventStreamsStatus
```
To find out the connection info to your Integration Platform Navigator instance, you can run the console flag to get user names, passwords, and URLs to connect to:

```
/data/daffy/cp4i/build.sh <ENVIRONMENT_NAME> --console
```
