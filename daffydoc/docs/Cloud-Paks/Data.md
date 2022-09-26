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
CP4D_VERSION="4.5.1"
```

With these values, the Daffy engine will be able to install the version of Cloud Pak for Data and prepare for the desired services.

| CP4D Supported Version    | OCP Versions |
| :---      |    :----     |
| 4.5.1     | 4.8, 4.10    |
| 4.5.0     | 4.8, 4.10    |
| 4.0.9     | 4.8          |
| 4.0.8     | 4.8          |
| 4.0.7     | 4.8          |
| 4.0.6     | 4.8          |


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
/data/daffy/cp4d/build.sh <ENVIRONMENT_NAME> --Console
```

<img src='../images/uncomment_services.png'
       style="width:500px;height:500px;"/>