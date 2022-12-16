<script>
  document.title = "Common Commands";
</script>

This page lists some of the most commonly used Daffy commands for installation, troubleshooting, and cleanup.

## **Precheck Environment**
By adding --precheck to any of the following build/service commands in daffy. It will run all prechecks for that step and then exit without preforming the full process
!!! Info
      This will not work on the all-in-one command **/data/daffy/build.sh <env-name> --precheck**

Precheck OpenShift Build
```r
/data/daffy/ocp/build.sh <env-name> --precheck
```
And will work on all Cloud Pak commands as well:

Precheck CP4D Build
```r
/data/daffy/cp4d/build.sh <env-name> --precheck
```
Precheck CP4D Service
```r
/data/daffy/cp4d/service.sh <env-name> --precheck
```


## **Delete Environment**
Run the following command to delete all resources created by Daffy, including but not limited to the OpenShift cluster, Cloud Paks, services, VM systems, and tools.

```console
/data/daffy/cleanup.sh <env-name>
```

## **Daffy Versioning**

### Upgrade/Refresh
Run the following command to upgrade Daffy to the newest release.

```console
cd /data ; /data/daffy/refresh.sh

```

### Downgrade Version
Run the following command to install older version of Daffy. This will output a list of previous releases to select and install.

```console
cd /data ; /data/daffy/refresh.sh --list
```

??? Screenshot "Example Output"
      <img src='../../images/tips/daffyUpgrade2.jpg'   align="top"  style = "float">

!!! Warning
    If you already downgraded to an older version and want to install another older version, you must first upgrade to the latest release and then downgrade to the other version you want.

### Get Version
Run the following command to view the current Daffy version.

```console
/data/daffy/version.sh
```

## **OCP Build Help**
The OCP build process has several flags, to see all the flags, you can run the --help

```console
/data/daffy/ocp/build.sh <env_name> --help
```

??? note "All Build Flags"
      ```bash
      --precheck                            "This will just do a quick precheck to see if the environment is ready for a build"
      --tshirtSize                          "This will display what the current TShirt size would be with this environment"
      --createIBMCloudDNSEntries            "This will create your Public DNS enries in IBM Cloud"
      --approveVCenterCert                  "This will download VCenter certs and add to host trust store."
      --removeIBMCloudDNSEntries            "This will remove your Public DNS enries in IBM Cloud"
      --displayOCPDNSRequirements           "This will display what DNS records that need to be created"
      --displayOCPLoadBalanceRules          "This will display the Load Balnacer rules you will need"
      --runOpenShiftInstallWaitBoot         "This will run openshift-install (wait-for boot)"
      --approveCSR                          "This will approve all pending CSR request"
      --runOpenShiftInstallWaitInstall      "This will run openshift-install (wait-for install)"
      --updateIngress                       "This will get new IBM Cert and update the main ingress certs/secret"
      --createOpenShiftContainerStorage     "This will create OpenShift Container Storage"
      --createNFSServer                     "This will create local NFS Server"
      --createNFSDisk                       "This will create local disk for NFS Server"
      --configureLocalStorge                "This will create local stroage"
      --createVMDashboard                   "This will create the VM Dashboard Web UI"
      --createImageRegistry                 "This will create the OpenShift Image Registry"
      --console                             "This will display Admin Console Info"
      --status                              "This will display cluster info"
      --installOpenShiftTools               "This will install oc, kubectl and openshift-install tools"
      --displayVSpherePermissionsNeeded     "This will display all permissions needed for VSphere Install"
      --validateReserverLookupDNS           "This will validate PTR records for UPI installs"
      --applyFix                            "This will apply a given fix to your Daffy env, pass the fix number to command"
      --deleteAllFailedPods                 "This will delete all pods in Failed state."
      --MACinstallOCPTools                  "This will install oc and kubectl tools locally on your Mac"
      --installRHACM                        "This will install Red Hat Advanced Cluster Management"
      --CephStatus                          "This will show the status of ceph using ceph tools inside of OpenShift Storage"
      --createAdminAccount                  "This will create local htaccess admin account"
      --help|--?|?|-?|help|-help            "This help menu"
      ```
**Examples**

To show OpenShift Console info, ID/Password and URL
```console
/data/daffy/ocp/build.sh <env_name> --console
```
To show OpenShift status
```console
/data/daffy/ocp/build.sh <env_name> --status
```
To show OpenShift Node sizes based on your environment file
```console
/data/daffy/ocp/build.sh <env_name> --tshirtSize
```

## **ODF Existing Cluster**
If you have existing cluster, you can run the follow command to setup OpenShift Data Foundation on your existing cluster.

```console
/data/daffy/ocp/build.sh <env_name> --createOpenShiftContainerStorage
```

## **Daffy Tools**
Run the following command to install other tools you might need.

```console
/data/daffy/tools.sh
```

??? note "Tools Flags"
      ```console
      Daffy Tools
      --prepareHost                          This will run the prepareHost for daffy
      --mustGather                           This will run the mustGather for daffy
      --installOC                            This will install the oc command line tool
      --installOpenShiftInstall              This will install the openshift-install command line tool
      --installAWS                           This will install the aws commandline tool
      --installAzure                         This will install the azure commandline tool
      --installGCloud                        This will install the gcloud commandline tool
      --installGOVC                          This will install the govc commandline tool(VMware)
      --installCloudCTL                      This will install the cloudctl for CP4D
      --installCP4DCloudCLI                  This will install the CP4D Cloud CLI utility
      --installCPDCTL                        This will install the Cloud Pak 4 Data (CPDCTL) utility"
      ```

## **Gather Logs**
Run the following command to package all Daffy logs into a tar file. When troubleshooting, please send the gathered logs at `#!pypylog /tmp/daffy/daffy_mustgather.tar.gz` to the Daffy team.

```console
/data/daffy/tools.sh --mustGather
```

## **Security Cleanup**
Run the following command to clear all security (or individual) credentials.

```console
/data/daffy/security-cleanup.sh
```

??? note "Additional Cleanup Flags"
      ```console
      --all                            This will cleanup all security including RH Pull Secret, SSH key, and IBM Entitlement keys
      --aws                            This will cleanup the aws security information
      --azure                          This will cleanup the azure security information
      --gcp                            This will cleanup the gcp credential information
      --ibm                            This will cleanup the IBM Entitlement Key and ibmcloud sesssion info
      --vsphere                        This will cleanup vsphere information
      --pullSecret                     This will cleanup your RedHat Pull Secret
      --ssh                            This will cleanup your local ssh key
      --ibm-ipi                        This will cleanup IBM API Key for use with IBM-ipi
      --roks                           This will cleanup IBM ROKS keys and login information
      --turbo                          This will cleanup your local ssh key
      --help|--?|?|-?|help|-help       This help menu
      ```
