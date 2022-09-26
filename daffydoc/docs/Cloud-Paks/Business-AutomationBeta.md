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


!!! Info
      Currently Daffy only supports step 2 for Production services.  You can have daffy install the operators and create the namespace, but does not support the 3 step, deploy services just yet.

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

| Variable Name                           | Valid Options       | Variable Name         | Valid Options             |
| :---------                              |    :---------       |   :----               |   :----                   |
| CP4BA_VERSION                           |  21.0.3             | CP4BA_IFIX            |   IF005,IF007,IF008       |
| CP4BA_VERSION                           |  22.0.1             | CP4BA_IFIX            |   IF001,IF002                   |

| Variable Name                           | Valid Options                                         |
| :---------                              |    :---------                                         |                      
| CP4BA_DEPLOYMENT_STARTER_SERVICE        |  content,decisions,content-decisions,workflow,samples |  

### RPA Server

| Variable Name                           | Info                                          | Required            |
| :---------                              |    :---------                                 |      :----          |  
| CP4BA_ENABLE_SERVICE_RPA_SERVER         | **true** if you want to deploy RPA Server     |    No               |
| CP4BA_RPA_SERVER_VERSION                | Version of RPA to deploy                      |    NO               |
| CP4BA_RPA_SERVER_IFIX                   | The fix version of your version supported     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_EMAIL| Owner Email Address                          |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_ID  | Owner user ID to login to RPA                 |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_NAME| Owner Full Name                               |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_USER              | SMTP User that RPA will use to send Email     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_PORT              | SMTP Port that RPA will use to send Email     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_SERVER            | SMTP Server/IP that RPA will use to send Email|    Yes if RPA True  |

***Valid Options:***

| Variable Name                           | Valid Options       | Variable Name         | Valid Options             |
| :---------                              |    :---------       |   :----               |   :----                   |
| CP4BA_RPA_SERVER_VERSION                |  21.0.2             | CP4BA_RPA_SERVER_IFIX |   IF005                   |
| CP4BA_RPA_SERVER_VERSION                |  21.0.3             | CP4BA_RPA_SERVER_IFIX |                           |


You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:
```R
CP4BA_VERSION="22.0.1"
CP4BA_IFIX=IF002
CP4BA_DEPLOYMENT_STARTER_SERVICE="content"
#Prodution Services - only step 2 supported today.
###################################################
#CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS="true"
#CP4BA_DEPLOYMENT_PRODUCTION_CONTENT="true"
#CP4BA_DEPLOYMENT_PRODUCTION_WORKFLOW="true"

#RPA Server
############################################
#CP4BA_RPA_SERVER_VERSION="21.0.3"
#CP4BA_RPA_SERVER_IFIX=""
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_EMAIL="daffy@us.ibm.com"
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_ID="daffy"
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_NAME="Daffy Admin"
#CP4BA_RPA_SERVER_SMTP_USER="GmailID@Gmail.com"
#CP4BA_RPA_SERVER_SMTP_PORT=587
#CP4BA_RPA_SERVER_SMTP_SERVER="gmail.smtp.com"
```

***Service Mapping to Components:***

Service | Components | CP4BA Version
:----------- |:-------------| -----------
decisions        | odm, bai        | 22.0.1 or 21.0.3
content        | filenet, cmis, ier, tm, bai        | 22.0.1 or 21.0.3
content-decisions        | filenet, cmis, ier, tm, odm, bai        | 22.0.1 or 21.0.3
workflow       | workflow, workstreams, pfs, baw_authoring, case, bai       | 22.0.1 or 21.0.3
all            | All Components(except iccsap)        | 22.0.1 or 21.0.3
samples        | Depends on sample        | 22.0.1 or 21.0.3

Run the following command to deploy the Cloud Pak for Business Automation:

```shell
/data/daffy/cp4ba/build.sh <ENVIRONMENT_NAME>
```

When this step is complete, approximately after 10 minutes depending on your environment, you will have the Cloud Pak running. These are just the core Cloud Pak operators, no service is running at this point. The cluster is now ready to deploy the service.  At this stage, the cluster consists of IBM Foundation Services and the Cloud Pak for Business Automation operators in the following projects based on selection above:

- cp4ba-starter
- cp4ba-content
- cp4ba-decisions
- cp4ba-workflow
- ibm-common-services


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
| CP4BA_DEPLOYMENT_STARTER_SERVICE_SAMPLE | The name of sample yaml you want to deploy    |   Starter     |   No        |
***Valid Options:***

| Variable Name                           | Valid Options       | Variable Name         | Valid Options             |
| :---------                              |    :---------       |   :----               |   :----                   |
| CP4BA_VERSION                           |  21.0.3             | CP4BA_IFIX            |   IF005,IF007,IF008       |
| CP4BA_VERSION                           |  22.0.1             | CP4BA_IFIX            |   IF001.IF002                   |

| Variable Name                           | Valid Options                                         |
| :---------                              |    :---------                                         |                      
| CP4BA_DEPLOYMENT_STARTER_SERVICE        |  content,decisions,content-decisions,workflow,all,samples |  


Instead of using the included services, you can also deploy your own sample or the included sample CR files from Daffy.

Variable | Valid Option | Required
:----------- |:-------------| -----------
CP4BA_DEPLOYMENT_STARTER_SERVICE        | samples       | No
CP4BA_DEPLOYMENT_STARTER_SERVICE_SAMPLE | see list below       | No

!!! Warning "Sample Name"
    The value you use is without the .yaml in the name.


     cd /data/daffy/cp4ba/templates/services/samples  

To use samples, you would give the name of the sample in this directory.

sample                                                       |  Info                   | Deployment Type
:-----------                                                 |:-------------           | -----------
ocp-starter-ocs-all-22.0.1-IF001                             | All Starters with OpenShift Container Storage           |  OCP
roks-starter-ibm-all-22.0.1-IF001                            | All Starters IBM Storage                |  ROKS

This is just the Daffy samples, you can create your own as well. Just put your CR in this folder and add your name to your env file.

The given sample names tell you which platform, storage, service and version.



### OPS HUB

If  you want to deploy Open Prediction Service HUB (OPS), you can set this flag to setup it up in your cluster.

Variable | Valid Option | Required
:----------- |:-------------| -----------
CP4BA_ENABLE_SERVICE_OPS        | true or false       | No


### RPA Server

| Variable Name                           | Info                                          | Required            |
| :---------                              |    :---------                                 |      :----          |  
| CP4BA_ENABLE_SERVICE_RPA_SERVER         | **true** if you want to deploy RPA Server     |    No               |
| CP4BA_RPA_SERVER_VERSION                | Version of RPA to deploy                      |    Yes if RPA True  |
| CP4BA_RPA_SERVER_IFIX                   | The fix version of your version supported     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_EMAIL| Owner Email Address                          |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_ID  | Owner user ID to login to RPA                 |    Yes if RPA True  |
| CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_NAME| Owner Full Name                               |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_USER              | SMTP User that RPA will use to send Email     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_PORT              | SMTP Port that RPA will use to send Email     |    Yes if RPA True  |
| CP4BA_RPA_SERVER_SMTP_SERVER            | SMTP Server/IP that RPA will use to send Email|    Yes if RPA True  |

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh:
```R

CP4BA_VERSION="22.0.1"
CP4BA_IFIX="IF001"
CP4BA_DEPLOYMENT_STARTER_SERVICE="content"
#CP4BA_DEPLOYMENT_STARTER_SERVICE_SAMPLE=roks-starter-ibm-all-22.0.1

#Open Prediction Service HUB
############################################
#CP4BA_ENABLE_SERVICE_OPS="true"

#RPA Server
############################################
#CP4BA_ENABLE_SERVICE_RPA_SERVER="true"
#CP4BA_RPA_SERVER_VERSION="21.0.3"
#CP4BA_RPA_SERVER_IFIX=""
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_EMAIL="daffy@us.ibm.com"
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_ID="daffy"
#CP4BA_RPA_SERVER_FIRST_TENANT_OWNER_NAME="Daffy Admin"
#CP4BA_RPA_SERVER_SMTP_USER="GmailID@Gmail.com"
#CP4BA_RPA_SERVER_SMTP_PORT=587
#CP4BA_RPA_SERVER_SMTP_SERVER="gmail.smtp.com"
```


Options for Starter Services


Service | Components | CP4BA Version
:----------- |:-------------| -----------
decisions        | odm, bai        | 22.0.1 or 21.0.3
content        | filenet, cmis, ier, tm, bai        | 22.0.1 or 21.0.3
content-decisions        | filenet, cmis, ier, tm, odm, bai        | 22.0.1 or 21.0.3
workflow       | workflow, workstreams, pfs, baw_authoring, case, bai       | 22.0.1 or 21.0.3
samples        | Depends on sample        | 21.0.3 or 21.0.1



Be aware, this step is async, meaning that the Daffy engine will deploy the service to the cluster and then complete. This only takes a few minutes to complete. When the deployment of the service script is done, the service is not running yet. Depending on your service, it can take from 1 hour to 6 to complete. You can use the status command below to watch its progress.

### Decisions Production

To deploy a **Decisions Production Pattern**, you have to have a db2 database and an IDS LDAP server.  Daffy can either use your existing assets or can build them locally where daffy is installed.  If you just want daffy to build all the needed components on your local bastion, just set the build flags below to true and daffy will build it all.

!!! important
	To have daffy build your database and LDAP config info, you need to have DB2 and IDS LDAP installed locally. Instructions: [DB2](../../Supporting-Software/DB2/) and [LDAP](../../Supporting-Software/IBM-LDAP/)



| Variable Name                                     | Info                                                          | Required            |  Valid Options   |
| :---------                                        |    :---------                                                 |      :----          |    :----         |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS             | Do you want to deploy Decisions?                              |    No               |   true or false  |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_BUILD_DB    | Do you want to deploy Decisions DB2 Database locally?         |    No               |   true or false  |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_BUILD_LDAP  | Do you want to deploy Decisions LDAP locally?                 |    No               |   true or false  |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_SERVER | DNS Name or IP address for your IDS LDAP Server?              |    No               |   true or false  |
| CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_DC_ODM_DATABASE_SERVERNAME | DNS Name or IP address for your IDS DB2 Server |    No               |   true or false  |


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


## Post Install Info


### RPA Server
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

3) Select ***Identity provider configuration***
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep3.jpg'   align="top" style = "float">

4) Select ***New Connection***
??? Info "Screenshot"

    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep4.jpg'   align="top" style = "float">

5) Select ***LDAP*** from drop down list
??? Info "Screenshot"

    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep5.jpg'   align="top" style = "float">

6) Fill out details from command line console output from before and test connection
??? Info "Screenshot"

    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep6.jpg'   align="top" style = "float">

7) Fill out details from command line console output from before and hit create
??? Info "Screenshot"

    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep7.jpg'   align="top" style = "float">

8) Close current browser tab and go back to previous tab for Cloud Pak Dashboard

9) Click "***Add users"***
??? Info "Screenshot"

    <img src='../../images/cloudpaks/cp4ba/rpaserver/LDAPStep9.jpg'   align="top"  style = "float">
10) Logout of the Cloud Pak dashboard and close your browser.


At this point, you are ready to logon to your RPA Server Console.



### Decisions Server
Once you have installed Production Decisions Server pattern, you will need to do a few manual steps.

1. Map Your LDAP Groups to IDP Roles
2. Install and Configure your Rule Designer

The details for the next steps will come when you install Step 3 of Daffy for Decisions , via your command line console.

#### Map LDAP groups to Roles

1) Logon to your Cloud Pak Namespace Dashboard from data you were giving with services.sh  --console flag.

Login with the Admin Username and Admin Password

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep1.jpg'   align="top"  style = "float">

2) From the Dashboard you will need to click the **hamburger** icon top left

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep2.jpg'   align="top"  style = "float">

3) From the menu,  you need to click the **Access Control** item

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep3.jpg'   align="top"  style = "float">

4) From the dashboard, we will need to import the LDAP groups, so click the **User Groups** tab

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep4.jpg'   align="top"  style = "float">

5) From the dashboard, click the **New user group** button on the right

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep5.jpg'   align="top"  style = "float">

6) For steps 7-10 you will need to repeat for each group listed below.

    resAdministrators
    resDeployers
    resExecutors
    resMonitor
    rtsAdministrators
    rtsConfigManagers
    rtsUsers

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep6.jpg'   align="top"  style = "float">

7) Fill in the name of the new group, easy way just use the same name as the LDAP Group name then click the blue button in bottom right corner labeled **next**.

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep7.jpg'   align="top"  style = "float">

8) Click the **Identity provider groups** tab to import from our new LDAP Server.  The type in the ldap group name you want to import. Once it finds it, click the result.  Then click the blue button bottom right corner labeled **next**.

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep8.jpg'   align="top"  style = "float">

9) Based on the LDAP group you selected, **check box** for the Role that you want to map to this new group.

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep9.jpg'   align="top"  style = "float">

10) Now create the new group by clicking the blue button bottom right corner labeled **Create**.

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsLDAPRoleMappingStep10.jpg'   align="top"  style = "float">                  

#### Rule Designer

For you to be able install and deploy rule projects you need to install Eclipse with Rule Designer and the connect it to your new instance.

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

4) Update Eclipse.ini and add these lines at the end for example

```R
-Djavax.net.ssl.trustStore="C:/Users/Administrator/Desktop/MyTrustStores/truststore.jks"
-Djavax.net.ssl.trustStorePassword="changeit"
```

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsRuleDesignerStep4.jpg'   align="top"  style = "float">

5) Get the Zen Key API from the CPD console
??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsRuleDesignerStep5.jpg'   align="top"  style = "float">

6) Connect Rule Designer to your new Instance
>
a. Import project
>
b. Synchronize project (edited)
>

??? Info "Screenshot"
    <img src='../../images/cloudpaks/cp4ba/decisions/DecisionsRuleDesignerStep6.jpg'   align="top"  style = "float">
