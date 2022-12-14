---
hide:
  - footer
---
<script>
  document.title = "AppStore - CP4D Backup & Restore Utility";
</script>

<img src='../images/cp4d-backup-restore/CP4D-Backup-Restore-Logo.png'
       style="width:350px;height:225px;"/>

# Info
A Cloud Pak for Data Backup & Restore Utility that automates the steps to take an off-line restic backup and/or perform a full restore to a NEW OpenShift cluster. This utility was created for demonstration puroposes.

It should be noted that there are multiple backup / restore methods. This utility **ONLY** automates the steps for a **FULL off-line restic** backup and restore to a NEW OpenShift Cluster. Please refer to the [Cloud Pak for Data knowledge center](https://www.ibm.com/docs/en/cloud-paks/cp-data/4.6.x?topic=administering-backing-up-restoring-cloud-pak-data) for full details on all the backup / restore methods.

**Below is a diagram of what the process looks like**

<img src='../images/cp4d-backup-restore/CP4D-Pic-1.png'/>

# Prerequisites:

* **Bastion Machine** (Pre-loaded with the latest Daffy Scripts)
* (S3 Compatible) **Object Store Bucket**
* **IBM Entitlement Key** with proper entitlement to Cloud Pak for Data
* **Running OpenShift Cluster with Cloud Pak for Data Installed** (*For BACKUP*)
* **Running OpenShift Cluster** (*for RESTORE*)
	* Must at least match backup cluster compute size
	* Storage configured to match backup cluster: Provider, Storage Classes.. etc

**_DAFFY Bastion_** - You are using a Linux bastion that is supported by Daffy. You can get a bastion through TechZone or following the steps located at https://ibm.github.io/daffy/Supporting-Software/Bastion/. You have Daffy installed on your bastion. The rest of this document assumes that you have both of these.

Installation of OpenShift & Cloud Pak for Data is outside the scope of this utility. Please refer to the Daffy documentation for more information on how you can deploy OpenShift and/or Cloud Pak for Data.

**_S3 Bucket_** - You will need to have a S3 bucket ready with proper security setup to allow access for the utility.

**_S3 Bucket Connectivity Information_** - You will need have the proper S3 connection information

* OBJECT STORE ACCESS KEY
* OBJECT STORE SECRET ACCESS KEY
* OBJECT STORE S3 URL
* OBJECT STORE S3 REGION
* OBJECT STORE S3 BUCKET NAME

**If you wish to use IBM Cloud Object Storage, here is some informatino that will help you setup the security for your Object Store.**

(read about the Open S3 API [here](https://docs.aws.amazon.com/AmazonS3/latest/API/Welcome.html)

<img src='../images/cp4d-backup-restore/CP4D-Pic-2.png'/>

# Outline of Automated Steps

<img src='../images/cp4d-backup-restore/CP4D-Pic-3.png'/>


## Owner/Support
Slack Channel ***#daffy-user-group***

[dakrier@us.ibm.com](mailto:dakrier@us.ibm.com?Subject=Daffy AppStore Help)


## Install Command

Use this command to install the CP4D Backup & Restore utility on the bastion machine.

```R
/data/daffy/appstore.sh --CP4DBackupRestore
```

## Setting up the environment variables

Edit the following environment file with your specific informtion for your cluster and your S3 Bucket.

**Cluster Information**

```R
OCP_URL="https://api.<clustername>.dojo-demo.net:6443"  # API URL
OCP_TYPE="self-managed"  # Valid values: aro, roks, rosa, self-managed
OCP_USERNAME="ocpadmin"
OCP_PASSWORD="********"
```

**Project / Namespaces**

```R
PROJECT_CPFS_OPS="ibm-common-services"
PROJECT_CPD_OPS="ibm-common-services"
PROJECT_CATSRC="openshift-marketplace"
PROJECT_CPD_INSTANCE="cpd-instance"
```

**Object Store**

```R
OBJECT_STORE_ACCESS_KEY=""
OBJECT_STORE_SECRET_ACCESS_KEY=""
OBJECT_STORE_S3_URL=""
OBJECT_STORE_S3_REGION=""
OBJECT_STORE_S3_BUCKET_NAME=""
```

**Name Your Backup**

```R
OADP_BACKUP_NAME=""
```

**IBM Entitlement Key**

```R
IBM_ENTITLEMENT_KEY=""
```

**Cloud Pak for Data Backup Version**

```R
CP4DBR_VERSION=""
```


## Running the tool

The tool by default will be installed in /data/appstore/cpd-backup-restore.

```R
/data/appstore/cpd-backup-restore/run.sh
```

The help menu will show you what flags are available to run.

```R
Help Menu for CP4D Backup Restore Tool
################################################################
--help|--?|?|-?|help|-help            This help menu
--prepareCluster                      Prepare the Cluster for Backup / Restore
--runBackup                           Run Backup
--runRestore                          Run Restore
```

## Performing a Backup

You will need to prepare both the Backup Cluster & the Restore Cluster. Please run the following command to install the required tools and Cloud Pack for Data scripts on the bastion machine used for the deployment of OpenShift & Cloud Pak for Data on the cluster you wish to take a backup of.

```R
/data/appstore/cpd-backup-restore/run.sh --prepareCluster
```

Once you have completed the prepareCluster step and there are no issues, you can proceed to taking a CP4D Backup.

```R
/data/appstore/cpd-backup-restore/run.sh --runBackup
```

**Plase Note: This may take a while. Do not close your session while the script is running.**


## Performing a Restore

You will need to prepare both the Backup Cluster & the Restore Cluster. Please run the following command to install the required tools and Cloud Pack for Data scripts on the bastion machine used to install OpenShift for the Restore cluster.

```R
/data/appstore/cpd-backup-restore/run.sh --prepareCluster
```

Once you have completed the prepareCluster step and there are no issues, you can proceed to taking a CP4D Backup.

```R
/data/appstore/cpd-backup-restore/run.sh --runRestore
```

**Plase Note: This may take a while. Do not close your session while the script is running.**
