---
hide:
  - footer
---
<script>
  document.title = "Cloud Pak - Business Automation";
</script>

Cloud Pak for Business Automation {: style="text-align: left;"}
===============
<img src='../images/ba.svg'
       style="width:100px;height:100px;"/>

At this point, you have a working OCP cluster on your platform of choice. Your <**ENVIRONMENT_NAME**>-env.sh configuration file will contain details of the platform and OCP installation. You will now add the following configurations to this file:

1) The Cloud Pak info that you wish to install

2) The services that you wish to install on the Cloud Pak

## Step 2: Deploy Cloud Pak

Deploying the Cloud Pak for Business Automation only requires two entries to your environment file (/data/daffy/env/  <**ENVIRONMENT_NAME**>-env.sh):
You need to pick starter services or production services.

| Variable Name                           | Info                                          | Install Type  | Required    |
| :---------                              |    :---------                                 |   :----       |   :----     |  
| CP4BA_VERSION                           | The version you want to install               |   Both        |   Yes       |
| CP4BA_IFIX                              | The fix version of your version supported     |   Both        |   No        |
| CP4BA_DEPLOYMENT_STARTER_SERVICE        | The name of the service you want to deploy    |   Starter     |   No        |
| CP4BA_DEPLOYMENT_STARTER_SERVICE_SAMPLE | The name of sample yaml you want to deploy    |   Starter     |   No        |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS   | **true** if you want to deploy decisions      |   Production  |   No        |
| CP4BA_DEPLOYMENT_PRODUCTION_CONTENT     | **true** if you want to deploy content        |   Production  |   No        |
| CP4BA_DEPLOYMENT_PRODUCTION_WORKFLOW    | **true** if you want to deploy workflow       |   Production  |   No        |


***Valid Options:***

| Variable Name                           | Valid Options       |
| :---------                              |    :---------       |  
| CP4BA_VERSION                           |  22.0.1             |
| CP4BA_IFIX                              |  IF002, IF003, IF004 and IF005      |                
| CP4BA_DEPLOYMENT_STARTER_SERVICE        |  content,decisions,content-decisions,workflow,docprocessing,samples,all |  

### RPA Server

!!! warning
	Currently does not support running RPA and Cp4BA in same cluster.  Known issue with Common Services as they are not compatible versions.


| Variable Name                           | Info                                          | Required            |
| :---------                              |    :---------                                 |      :----          |  
| CP4BA_ENABLE_SERVICE_RPA_SERVER         | **true** if you want to deploy RPA Server     |    No               |
| CP4BA_RPA_SERVER_VERSION                | Version of RPA to deploy                      |    No               |
| CP4BA_RPA_SERVER_IFIX                   | The fix version of your version supported     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_EMAIL| Owner Email Address                          |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_NAME| Owner Full Name                               |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_USER              | SMTP User that RPA will use to send Email     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_PORT              | SMTP Port that RPA will use to send Email     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_SERVER            | SMTP Server/IP that RPA will use to send Email|    Yes if RPA True  |

***Valid Options:***

| Variable Name                           | Valid Options       |
| :---------                              |    :---------       |  
| CP4BA_RPA_SERVER_VERSION                |  21.0.4 or 21.0.5   |           
| CP4BA_RPA_SERVER_IFIX                   |   N/A               |

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:
```R
#Core CP4BA Settings
###################################################
CP4BA_VERSION="22.0.1"
CP4BA_IFIX="IF005"
CP4BA_DEPLOYMENT_STARTER_SERVICE="content"

#Prodution Services
###################################################
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS="false"

#Prodution Services - only step 2 supported today.
###################################################
CP4BA_DEPLOYMENT_PRODUCTION_CONTENT="false"
CP4BA_DEPLOYMENT_PRODUCTION_WORKFLOW="false"

#RPA Server
############################################
CP4BA_ENABLE_SERVICE_RPA_SERVER="false"
CP4BA_RPA_SERVER_VERSION="21.0.5"
#CP4BA_RPA_SERVER_IFIX=""
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_EMAIL="daffy@us.ibm.com"
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_NAME="Daffy Admin"
#CP4BA_RPA_SERVER_SMTP_USER="GmailID@Gmail.com"
#CP4BA_RPA_SERVER_SMTP_PORT="587"
#CP4BA_RPA_SERVER_SMTP_SERVER="gmail.smtp.com"
```

### Starter Service Mapping

Service | Components | CP4BA Version
:----------- |:-------------| -----------
decisions        | odm, ads, bastudio, aae, bai        | 22.0.1
content        | filenet, cmis, ier, tm, bai        | 22.0.1
content-decisions        | filenet, cmis, ier, tm, odm, ads, bastudio, aae, ai        | 22.0.1
workflow       | workflow, workstreams, pfs, baw_authoring, case, bai       | 22.0.1
docprocessing  | docprocessing, content, cmis, css, tm      | 22.0.1
all            | All Components(except iccsap)        | 22.0.1
samples        | Depends on sample        | 22.0.1

Run the following command to deploy the Cloud Pak for Business Automation:

```shell
/data/daffy/cp4ba/build.sh <ENVIRONMENT_NAME>
```

When this step is complete, approximately after 10 minutes depending on your environment, you will have the Cloud Pak running. These are just the core Cloud Pak operators, no service is running at this point. The cluster is now ready to deploy the service.  At this stage, the cluster consists of IBM Foundation Services and the Cloud Pak for Business Automation operators in the following projects based on selection above:

- cp4ba-starter
- cp4ba-content
- cp4ba-decisions
- cp4ba-workflow
- cs-control


<html>
   <head>
      <title>HTML Video embed</title>
   </head>
   <body>
      <iframe width="560" height="315" src="https://www.youtube.com/embed/GY57pn26Duw" frameborder="0" allowfullscreen></iframe>
      </iframe>
   </body>
</html>

## Step 3: Deploy Services

Deploying the service does not need any new values to your environment file (<**ENVIRONMENT_NAME**>-env.sh>). It will use the same values during the Cloud Pak deployment.

| Variable Name                           | Info                                          | Install Type  | Required    |
| :---------                              |    :---------                                 |   :----       |   :----     |  
| CP4BA_VERSION                           | The version you want to install               |   Both        |   Yes       |
| CP4BA_IFIX                              | The fix version of your version support it    |   Both        |   No        |
| CP4BA_DEPLOYMENT_STARTER_SERVICE        | The name of the service you want to deploy    |   Starter     |   No        |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS   | **true** if you want to deploy decisions      |   Production  |   No        |
| CP4BA_DEPLOYMENT_STARTER_SERVICE_SAMPLE | The name of sample yaml you want to deploy    |   Starter     |   No        |
***Valid Options:***

| Variable Name                           | Valid Options       |
| :---------                              |    :---------       |  
| CP4BA_VERSION                           |  22.0.1             |
| CP4BA_IFIX                              |  IF002, IF003, IF004 and IF005      |       
| CP4BA_DEPLOYMENT_STARTER_SERVICE        |  content,decisions,content-decisions,workflow,all,samples |  


Instead of using the included services, you can also deploy your own sample.

Variable | Valid Option | Required
:----------- |:-------------| -----------
CP4BA_DEPLOYMENT_STARTER_SERVICE        | samples       | No
CP4BA_DEPLOYMENT_STARTER_SERVICE_SAMPLE | see list below       | No

!!! Warning "Sample Name"
    The value you use is without the .yaml in the name.


     cd /data/daffy/cp4ba/templates/services/samples  

To use samples, you would have to build your own CR yaml and store in the above directory and you would give the name of the sample.

### OPS HUB

If  you want to deploy Open Prediction Service HUB (OPS), you can set this flag to setup it up in your cluster.

Variable | Valid Option | Required
:----------- |:-------------| -----------
CP4BA_ENABLE_SERVICE_OPS        | true or false       | No


### RPA Server

!!! warning
	Currently does not support a ROKS deployment. There is known issue with RPA Server and ticket is open with IBM Support.

| Variable Name                           | Info                                          | Required            |
| :---------                              |    :---------                                 |      :----          |  
| CP4BA_ENABLE_SERVICE_RPA_SERVER         | **true** if you want to deploy RPA Server     |    No               |
| CP4BA_RPA_SERVER_VERSION                | Version of RPA to deploy                      |    Yes if RPA True  |
| CP4BA_RPA_SERVER_IFIX                   | The fix version of your version supported     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_EMAIL| Owner Email Address                          |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_NAME| Owner Full Name                               |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_USER              | SMTP User that RPA will use to send Email     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_PORT              | SMTP Port that RPA will use to send Email     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_SERVER            | SMTP Server/IP that RPA will use to send Email|    Yes if RPA True  |

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:
```R
#Core CP4BA Settings
###################################################
CP4BA_VERSION="22.0.1"
CP4BA_IFIX="IF005"
CP4BA_DEPLOYMENT_STARTER_SERVICE="content"
#CP4BA_DEPLOYMENT_STARTER_SERVICE_SAMPLE="<YourSampleHere>"

#Open Prediction Service HUB
############################################
CP4BA_ENABLE_SERVICE_OPS="false"

#RPA Server
############################################
CP4BA_ENABLE_SERVICE_RPA_SERVER="false"
CP4BA_RPA_SERVER_VERSION="21.0.5"
CP4BA_RPA_SERVER_IFIX=""
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_EMAIL="daffy@us.ibm.com"
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_NAME="Daffy Admin"
#CP4BA_RPA_SERVER_SMTP_USER="GmailID@Gmail.com"
#CP4BA_RPA_SERVER_SMTP_PORT=587
#CP4BA_RPA_SERVER_SMTP_SERVER="gmail.smtp.com"
```


### Starter Service Mapping

Service | Components | CP4BA Version
:----------- |:-------------| -----------
decisions        | odm, ads, bastudio, aae, bai        | 22.0.1
content        | filenet, cmis, ier, tm, bai        | 22.0.1
content-decisions        | filenet, cmis, ier, tm, odm, ads, bastudio, aae bai        | 22.0.1
workflow       | workflow, workstreams, pfs, baw_authoring, case, bai       | 22.0.1
docprocessing  | docprocessing, content, cmis, css, tm      | 22.0.1
all            | all (except iccsap)       | 22.0.1
samples        | Depends on sample        | Depends on sample



Be aware, this step is async, meaning that the Daffy engine will deploy the service to the cluster and then complete. This only takes a few minutes to complete. When the deployment of the service script is done, the service is not running yet. Depending on your service, it can take from 1 hour to 6 to complete. You can use the status command below to watch its progress.


### Production Services

**Options for Services**

Service | Components | CP4BA Version
:----------- |:-------------| -----------
decisions        | odm, ads, bastudio, aae, bai         | 22.0.1


##### Decisions Production

To deploy a **Decisions Production Pattern**, you have to have a db2 database and an IDS LDAP server. This will also include BAI.  Daffy can either use your existing assets or can build them locally where daffy is installed.  If you just want daffy to build all the needed components on your local bastion, just set the build flags below to true and daffy will build it all.

!!! important
	To have daffy build your database and LDAP config info, you need to have DB2 and IDS LDAP installed locally. Instructions: [DB2](../../Supporting-Software/DB2/) and [LDAP](../../Supporting-Software/IBM-LDAP/)



| Variable Name                                     | Info                                                          | Required            |  Valid Options   |
| :---------                                        |    :---------                                                 |      :----          |    :----         |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS             | Do you want to deploy Decisions?                              |    No               |   true or false  |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_BUILD_DB    | Do you want to deploy Decisions DB2 Database locally?         |    No               |   true or false  |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_BUILD_LDAP  | Do you want to deploy Decisions LDAP locally?                 |    No               |   true or false  |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_SERVER | DNS Name or IP address for your IDS LDAP Server?              |    No               |  DNS or IP address  |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_DC_ODM_DATABASE_SERVERNAME | DNS Name or IP address for your DB2 Server |    No               |  DNS or IP address  |


```R
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS="true"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_BUILD_DB="true"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_BUILD_LDAP="true"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_SERVER="XXX.XXX.XXX.XXX"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_DC_ODM_DATABASE_SERVERNAME="XXX.XXX.XXX.XXX"
```


### Execute Service
Run the following command to deploy the Cloud Pak for Business Automation services:

```
/data/daffy/cp4ba/service.sh <ENVIRONMENT_NAME>
```

<html>
   <head>
      <title>HTML Video embed</title>
   </head>
   <body>
   <center>
      <iframe width="560" height="315" src="https://www.youtube.com/embed/tJxXS_dTuZ0" frameborder="0" allowfullscreen></iframe>
   </center>
   </body>
</html>

## Step 3a: Status

The service can take a few hours to complete, based on which one you chose to deploy. To help monitor the status of the service deployment, you can run the help flag to see what flags you can use to get information on your service deployment.

Run the following commands to check the Cloud Pak for Business Automation to see what command flags you can run:

```
/data/daffy/cp4ba/service.sh <ENVIRONMENT_NAME> --help
```

The following command will give you the status of all ***starter*** components for the service you deployed:


```
/data/daffy/cp4ba/service.sh <ENVIRONMENT_NAME> --StarterStatus
```
The following command will give you the status of all ***Production*** components for the service you deployed:


```
/data/daffy/cp4ba/service.sh <ENVIRONMENT_NAME> --Status
```

The following command will give you the status of ***RPA Server*** you deployed:

```
/data/daffy/cp4ba/service.sh <ENVIRONMENT_NAME> --RPAStatus
```

If you want to have a running job to refresh every few seconds,  you can run the above command via the watch command:

```
watch -c /data/daffy/cp4ba/service.sh <ENVIRONMENT_NAME> --StarterStatus
```

To find out the connection info to your new ***starter*** services, you can run the console flag to get user names, passwords, and URLs to connect to:

```
/data/daffy/cp4ba/service.sh <ENVIRONMENT_NAME> --StarterConsole
```

To find out the connection info to your new ***Production*** services, you can run the console flag to get user names, passwords, and URLs to connect to:

```
/data/daffy/cp4ba/service.sh <ENVIRONMENT_NAME> --Console
```


To find out the connection info to your ***RPA Server***, you can run the console flag to get user names, passwords, and URLs to connect to:

```
/data/daffy/cp4ba/service.sh <ENVIRONMENT_NAME> --RPAConsole
```


<html>
   <head>
      <title>HTML Video embed</title>
   </head>
   <body>
      <iframe width="560" height="315" src="https://www.youtube.com/embed/yLhWYpCV5eo" frameborder="0" allowfullscreen></iframe>
      </iframe>
   </body>
</html>


## Post Daffy Steps


### ***RPA Server***
#### OpenLdap Config
Once you have installed RPA server, you will need add the LDAP Server from the Cloud Pak Dashboard.  The following steps will help you manually preform these steps.  

The details for the next steps will come when you install Step 3 of Daffy for RPA Server, via your command line console.
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep0.jpg'   align="top"  style = "float">


1) Login Cloud Pak Dashboard Link via "***IBM provided credentials(admin only)***"
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep1.jpg'   align="top"  style = "float">

2) From the hamburger menu bar, under Administration, select ***Access Control***
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep2.jpg'   align="top" style = "float">


3) Click "***Add users"***
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep9.jpg'   align="top"  style = "float">

4) Add your RPA user and give Acces to all roles.


5) Logout of the Cloud Pak dashboard and close your browser.


At this point, you are ready to logon to your RPA Server Console.



### ***Decisions Server***
Once you have installed Production Decisions Server pattern, you will need to do a few steps.

1. Map Your LDAP Groups to IDP Roles
2. Install and Configure your Rule Designer

#### Map LDAP groups to Roles

Run the following command to Import and Map your LDAP groups to Zen roles

```
/data/daffy/cp4ba/service.sh <env_name> --decisionImportLDAPGroups
```

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingScriptStep1.jpg'   align="top"  style = "float">

#### Rule Designer

After you installed Decisions Services, you need to install and connect Rule Designer to your new instance. For the next steps, any information you need from your environment you should be able to collect from the service.sh --console  command output of Daffy.

!!! important
	Original Instructions can be found [here](https://www.ibm.com/docs/en/cloud-paks/cp-biz-automation/22.0.1?topic=manager-installing-rule-designer){target=_blank}


1) Download and install Eclipse. [Download Eclipse](https://www.eclipse.org/downloads/packages/release/2020-06/r){target=_blank}
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsRuleDesignerStep1.jpg'   align="top"  style = "float">


2) Install ODM from Marketplace.
>
a. Start Eclipse. **Click Help > Eclipse Marketplace**.
>
b. In the Find field, enter the text ODM and click Go.
>
c. Locate the entry IBM Operational Decision Manager for Developers v8.11.0 - Rule Designer that matches the version to install, and then click **Install**.
>
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsRuleDesignerStep2.jpg'   align="top"  style = "float">

3) Download truststore.jks from your cluster
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsRuleDesignerStep3.jpg'   align="top"  style = "float">

4) Update your Eclipse.ini and add these lines at the end:(update path info based on your setup)

```R
-Djavax.net.ssl.trustStore=C:/Users/Administrator/Desktop/MyTrustStores/truststore.jks
-Djavax.net.ssl.trustStorePassword=changeit
```

5) Get the Zen Key API from the CPD console
!!! important
	Before the Zen API Key can be generated, you must **Map LDAP groups to Roles** from above and then via Browser, logon to the Cloud Pak Decisions Desktop once.

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsRuleDesignerStep5.jpg'   align="top"  style = "float">

6) Connect Rule Designer
<html>
<body>
<h4>Here is how you can connect to your new Decision Center</h2>
<ul>
  <li>Right Click your Rule Project</li>
  <li>Select Decision Center | connect</li>
</ul>
<h4>Fill out from based on daffy output from --console</h4>
<ol>
  <li>URL:             Decision Center</li>
  <li>Authentication:  Zen API Key</li>
  <li>User ID:         Decisions Admin Username</li>
  <li>API Key:         Decisions Admin Zen API Key</li>
</ol>
</body>
</html>
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsRuleDesignerStep6.jpg'   align="top"  style = "float">

  d. Click Next and then Finish
