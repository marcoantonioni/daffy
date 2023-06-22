---
hide:
  - footer
---
<script>
  document.title = "Cloud Pak - Data";
</script>
Cloud Pak for Data {: style="text-align: left;"}
===============
<img src='../images/data.png'
       style="width:100px;height:100px;"/>

At this point, you have a working OCP cluster on your platform of choice. Your <**ENVIRONMENT_NAME**>-env.sh configuration file will contain details of the platform and OCP installation. You will now add the following details to your env file:

1) The Cloud Pak info that you wish to install

2) The services that you wish to install on the Cloud Pak
## Step 2: Deploy Cloud Pak

Deploying the Cloud Pak for Data requires one entry to your environment file (/data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh).

**CP4D_VERSION=**

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:

```R
CP4D_VERSION="4.6.6"
```

With these values, the Daffy engine will be able to install the version of Cloud Pak for Data and prepare for the desired services.

| CP4D Supported Version    | OCP Versions |
| :---      |    :----     |
| 4.6.6     | 4.10, 4.12    |
| 4.6.5     | 4.10, 4.12    |
| 4.6.4     | 4.10, 4.12    |
| 4.6.3     | 4.10    |
| 4.6.2     | 4.10    |
| 4.6.1     | 4.10    |
| 4.6.0     | 4.10    |

Run the following command to deploy the Cloud Pak for Data:

```
/data/daffy/cp4d/build.sh <ENVIRONMENT_NAME>
```
When this step is complete, approximately after 60 minutes depending on your environment, you will have the Cloud Pak running. These are just the core Cloud Pak operators, no service/pattern is running at this point. The cluster is now ready to deploy the services/patterns.  At this stage, the cluster consists of bedrock operators and the Cloud Pak for Data operators in the following projects:

**cpd-instance**    
**cpd-operators**   
**ibm-common-services**    

## Step 3: Deploy Services

Set the flags in your environment file (<**ENVIRONMENT_NAME**>-env.sh) for the CP4D services you wish to deploy.

| Variable Name| Value's |Info | Required |
| :---------   | :----  | :-----------------   |  :----  |  
| CP4D_ENABLE_SERVICE_WKS | true / false   | Watson Knowledge Studio |   No  |
| CP4D_ENABLE_SERVICE_WKC | true / false   | Watson Knowledge Catalog |  No  |
| CP4D_ENABLE_SERVICE_DV | true / false   |  Data Virtualization |  No    |
| CP4D_ENABLE_SERVICE_WS | true / false   | Watson Studio |  No    |
| CP4D_ENABLE_SERVICE_SPSS | true / false   | Statistical Package for Social Sciences |   No |
| CP4D_ENABLE_SERVICE_WML | true / false   | Watson Machine Learning |  No    |
| CP4D_ENABLE_SERVICE_DATASTAGE | true / false   |  DataStage | No    |
| CP4D_ENABLE_SERVICE_DODS | true / false   | Decision Optimization |  No    |
| CP4D_ENABLE_SERVICE_DMC | true / false   |  DB2 Management Console | No    |
| CP4D_ENABLE_SERVICE_COGNOS | true / false   | Cognos |  No    |
| CP4D_ENABLE_SERVICE_MATCH_360 | true / false   | Match 360 |  No    |
| CP4D_ENABLE_SERVICE_OPENPAGES | true / false   | Open Pages |   No    |
| CP4D_ENABLE_SERVICE_ANALYTICS_ENGINE | true / false | Analytics Engine powered by Apache Spark | No |
| CP4D_ENABLE_SERVICE_DB2_WAREHOUSE | true / false   |  DB2 Warehouse |  No    |
| CP4D_ENABLE_SERVICE_DATAPRIVACY | true / false   | Data Privacy |  No    |
| CP4D_ENABLE_SERVICE_COGNOS_ANALYTICS | true / false   | Cognos Analytics |  No    |
| CP4D_ENABLE_SERVICE_DB2 | true / false   |  DB2 OLTP | No    |
| CP4D_ENABLE_SERVICE_WATSON_OPENSCALE | true / false   |  Watson OpenScale | No    |
| CP4D_ENABLE_SERVICE_WS_PIPELINES| true / false   |  Watson Pipelines | No    |
| CP4D_ENABLE_SERVICE_FACTSHEETS| true / false   |  AI FactSheets | No    |
| CP4D_ENABLE_SERVICE_REPLICATION| true / false   |  Data Replication | No    |

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:

```R
CP4D_ENABLE_SERVICE_WKS="false"
CP4D_ENABLE_SERVICE_WKC="false"
CP4D_ENABLE_SERVICE_DV="false"
CP4D_ENABLE_SERVICE_SPSS="false"
CP4D_ENABLE_SERVICE_WS="false"
CP4D_ENABLE_SERVICE_WML="false"
CP4D_ENABLE_SERVICE_DATASTAGE="false"
CP4D_ENABLE_SERVICE_DODS="false"
CP4D_ENABLE_SERVICE_DMC="false"
CP4D_ENABLE_SERVICE_COGNOS_DASHBOARDS="false"
CP4D_ENABLE_SERVICE_MATCH_360="false"
CP4D_ENABLE_SERVICE_OPENPAGES="false"
CP4D_ENABLE_SERVICE_ANALYTICS_ENGINE="false"
CP4D_ENABLE_SERVICE_DB2_WAREHOUSE="false"
CP4D_ENABLE_SERVICE_DATAPRIVACY="false"
CP4D_ENABLE_SERVICE_COGNOS_ANALYTICS="false"
CP4D_ENABLE_SERVICE_DB2="false"
CP4D_ENABLE_SERVICE_WATSON_OPENSCALE="false"
CP4D_ENABLE_SERVICE_WS_PIPELINES="false"
CP4D_ENABLE_SERVICE_FACTSHEETS="false"
CP4D_ENABLE_SERVICE_REPLICATION="false"
```

Run the following command to deploy the Cloud Pak for Data services:

```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME>
```
## Step 3a: Status
The service can take a few hours to complete, based on which one you chose to deploy. To help monitor the status of the service deployment you can run the --help flag to see what flags you can use to get information on your service deployment.

Run the following commands to check the Cloud Pak for Data to see what command flags you can run:
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --help
```
The following command will give you the status of all components for the pattern you deployed:

```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --AllStatus
```

If you want to have a running job to refresh every few seconds,  you can run the above command via the watch command:

```
watch -c /data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --AllStatus
```
If you want to want to see more detail status on an individual service, you can run each service status:

```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --WKCStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --WKSStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --WSStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --DVStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --WMLStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --SPSSStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --DataStageStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --DODSStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --Match360Status
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --OpenPagesStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --AnalyticsEngineStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --DB2WarehouseStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --DataPrivacyStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --CognosAnalyticsStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --DB2Status
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --OpenscaleStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --WSPipelinesStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --FactsheetStatus
```
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --ReplicationStatus
```
```
/data/daffy/cp4d/build.sh <ENVIRONMENT_NAME> --Console
```

<img src='../images/uncomment_services.png'
       style="width:1374px;height:700px;"/>

## Day 2 Operations: Upgrade

Read the documentation for complete instructions and help - [https://www.ibm.com/docs/en/cloud-paks/cp-data/4.6.x?topic=upgrading](https://www.ibm.com/docs/en/cloud-paks/cp-data/4.6.x?topic=upgrading){target=_blank}. This assumes you have an environment file filled out with the correct information about the storage, services, and current cloud pak version.

Step 1: Update the cpd-cli

Run the following command to download the Cloud Pak for Data command line utility and choose the version you want to upgrade to:
```
/data/daffy/tools.sh --installCP4DCloudCLI
```

Step 2: Login to the cpd-cli

Run the following command to login using the command line utility previously (must already be logged into OpenShift):
```
/data/daffy/tmp/cpdcli/<CPDCLI_VERSION_INFO>/cpd-cli manage login-to-ocp --token=$(oc whoami -t) --server=<OPENSHIFT_API_ADDRESS>
```

Step 3: Export the CPD variables for base cloud pak

Run the following command to get the cp4d variables exported for the base cloud pak platform:
```
/data/daffy/cp4d/build.sh <ENVIRONMENT_NAME> --exportcpdvars
```

Step 4: Update the version in your variables environment to match the version you want to get to. The file will be located in /data/daffy/tmp/<CLUSTER_NAME>/cp4d/cpd_vars.sh. Find the line export VERSION=4.6.x

Step 5: Check to make sure the status of the components all say completed.

Run the following commands to update the base cloud pak OLM objects
```
source /data/daffy/tmp/<CLUSTER_NAME>/cp4d/cpd_vars.sh
/data/daffy/tmp/cpdcli/<CPDCLI_VERSION_INFO>/cpd-cli manage get-cr-status --cpd_instance_ns=${PROJECT_CPD_INSTANCE}
```

Step 6: Update the base cloud pak (OLM Objects)

Run the following commands to update the base cloud pak OLM objects
```
/data/daffy/tmp/cpdcli/<CPDCLI_VERSION_INFO>/cpd-cli manage apply-olm --release=${VERSION} --cpd_operator_ns=${PROJECT_CPD_OPS} --upgrade=true
```

Step 7: Update the base cloud pak services

Run the following command to update base cloud pak services:
```
/data/daffy/tmp/cpdcli/<CPDCLI_VERSION_INFO>/cpd-cli manage apply-cr \
--components=${COMPONENTS} \
--release=${VERSION} \
--cpd_instance_ns=${PROJECT_CPD_INSTANCE} \
--block_storage_class=${STG_CLASS_BLOCK} \
--file_storage_class=${STG_CLASS_FILE} \
--license_acceptance=true \
--upgrade=true
```

Step 8: Export the services cp4d variables

!!! warning
	This will overwrite the cpd_vars file from the platform steps and will only look at the components/services installed. Make sure you update the version again as in step 4.

Run the following command to get the cp4d variables exported for the cloud pak services that are installed:
```
/data/daffy/cp4d/service.sh <ENVIRONMENT_NAME> --exportcpdvars
```

Step 9: Upgrade the components/services

Run the following command to update cloud pak services:
```
source /data/daffy/tmp/<CLUSTER_NAME>/cp4d/cpd_vars.sh
/data/daffy/tmp/cpdcli/<CPDCLI_VERSION_INFO>/cpd-cli manage apply-cr \
--components=${COMPONENTS} \
--release=${VERSION} \
--cpd_instance_ns=${PROJECT_CPD_INSTANCE} \
--block_storage_class=${STG_CLASS_BLOCK} \
--file_storage_class=${STG_CLASS_FILE} \
--license_acceptance=true \
--upgrade=true
```

!!! warning
	If Step 9 fails for some reason, run the following command and then step 8 again.
  ```
  source /data/daffy/tmp/<CLUSTER_NAME>/cp4d/cpd_vars.sh
  /data/daffy/tmp/cpdcli/<CPDCLI_VERSION_INFO>/cpd-cli manage restart-container
  ```
