---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - VSphere";
</script>
<p align = "left">
    <img src='../images/vsphere.png'  align="top" style = "float">
</p>
## Platform Requirements

To install Daffy on **VSphere**, there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.

There is a number of permissions you MUST have as a user on VCenter for deployment of OpenShift on VSphere.

Please refer to the requirements document for the specific requirements for IPI or UPI installs on VSphere.
<a href="https://ibm.box.com/v/DaffyProviderRequirements" target="_blank">https://ibm.box.com/v/DaffyProviderRequirements
</a>
## Finding Provider Details

To install Daffy on **VSphere**, the hardest part can be finding the provider details in the VCenter Console.

Some of the variables are easily understood, but a few can be a bit tricky to find.


| Variable Name   | Info          | Install Type | Required |
| :---------         |    :---------    |   :----     |   :----     |  
| VSPHERE_DATASTORE           | This is the name of the VSphere Datastore       |IPI/UPI |Yes
| VSPHERE_CLUSTER          | The VSphere cluster is NOT the same as your OpenShift Cluster name. This is variable is referring to the VSphere Cluster name.  |IPI/UPI|Yes
|VSPHERE_NETWORK1|This is the VSphere VLAN name|IPI/UPI|Yes
|VSPHERE_DATACENTER|This is the name of the VSphere Datacenter|IPI/UPI|Yes
|VSPHERE_FOLDER|This is the location of where you will store the NEW VM's.|IPI/UPI|Yes
|VSPHERE_API_VIP|This is an **UNUSED** IP address that will be utilized by the OpenShift IPI installer to provision the API Virtual IP Address.|IPI|Yes
|VSPHERE_INGRESS|This is an **UNUSED** IP address that will be utilized by the OpenShift IPI installer to provision the Ingress Virtual IP Address.|IPI|Yes
|VSPHERE_ISO_DATASTORE|This is the name of the datastore where the the coreos iso is located|UPI|Yes
|VSPHERE_ISO_IMAGE_BASE|This is the directory within the datastore where the iso image is located.|UPI|Yes
|BASTION_HOST|This is the name of the bastion host, IP and DNS value|UPI|No
|BASTION_USER|This is non admin id on the bastion host that has access to logon via SSH|UPI|Yes



### Setting up DNS for VSphere Deployment with OpenShift:

<html>
   <head>
      <title>HTML Video embed</title>
   </head>
   <body>
    <div style="text-align:center">
      <iframe width="560" height="315" src="https://www.youtube.com/embed/WTjcPfwW2ys" frameborder="0" allowfullscreen></iframe>
      </iframe>
      </div>
   </body>
</html>

## Environment File

Below are the VSphere IPI specific environment variables that must be defined in the /data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh file.

Note: You can look in the samples directory on your bastion for example of **VSphere** install : /data/daffy/env/samples/**vsphere-ipi-env.sh**

<u>Valid Options:</u>

```
VSPHERE_USERNAME="userid"     
VSPHERE_HOSTNAME="vsphere-host-name"
VSPHERE_DATASTORE="datastore"     
VSPHERE_CLUSTER="cluster-name".   
 VSPHERE_NETWORK1="vlan-name"      
VSPHERE_DATACENTER="vsphere-datacenter"     
VSPHERE_FOLDER="/${VSPHERE_DATACENTER}/vm/${CLUSTER_NAME}"

#IPI Only
############  
VSPHERE_API_VIP="xx.xxx.xxx.xxx"
VSPHERE_INGRESS_VIP="xx.xxx.xxx"

#UPI Only
############
VSPHERE_ISO_DATASTORE="iso-datastore"     
VSPHERE_ISO_IMAGE_BASE="datastore-directory"    

#Storage Option for OpenShift
############
#OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE=true
```

Optional:

**OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE**=true

If you plan to install a cloud pak and/or need storage, you need to set the flag to setup OCS Storage

## Execution

To deploy your cluster, run the build.sh script from the /data/daffy/ocp directory.

```
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```

Once your cluster is fully deployed you can access the help menu which has a number of options.

**Note: <ENVIRONMENT_NAME>** is the first part of your name that you used for the <**ENVIRONMENT_NAME**>-env.sh file

```
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME> --help
```
Deploying an OpenShift cluster on VSphere using the Daffy Scripts.  (Using VSPhere-IPI Install Type)

<button onclick="location.href='../../Cloud-Paks/'" class="custom-btn btn-7">
Installing Cloud Paks</button>






<!-- PUT ANY JS OR CSS BELOW HERE-->

<style>

.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
button {
  margin: 5px;
}
.custom-btn {
  width: 200px;
  height: 50px;
  color: black;
  border-radius: 10px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

/* 7 */
.btn-7 {
background: linear-gradient(0deg, rgba(255,151,0,1) 0%, rgba(251,75,2,1) 100%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-7 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-7:before,
.btn-7:after {
  position: absolute;
  content: "";
  right: 0;
  bottom: 0;
  background: rgba(251,75,2,1);
  box-shadow:
   -7px -7px 20px 0px rgba(255,255,255,.9),
   -4px -4px 5px 0px rgba(255,255,255,.9),
   7px 7px 20px 0px rgba(0,0,0,.2),
   4px 4px 5px 0px rgba(0,0,0,.3);
  transition: all 0.3s ease;
}
.btn-7:before{
   height: 0%;
   width: 2px;
}
.btn-7:after {
  width: 0%;
  height: 2px;
}
.btn-7:hover{
  color: rgba(251,75,2,1);
  background: transparent;
}
.btn-7:hover:before {
  height: 100%;
}
.btn-7:hover:after {
  width: 100%;
}
.btn-7 span:before,
.btn-7 span:after {
  position: absolute;
  content: "";
  left: 0;
  top: 0;
  background: rgba(251,75,2,1);
  box-shadow:
   -7px -7px 20px 0px rgba(255,255,255,.9),
   -4px -4px 5px 0px rgba(255,255,255,.9),
   7px 7px 20px 0px rgba(0,0,0,.2),
   4px 4px 5px 0px rgba(0,0,0,.3);
  transition: all 0.3s ease;
}
.btn-7 span:before {
  width: 2px;
  height: 0%;
}
.btn-7 span:after {
  height: 2px;
  width: 0%;
}
.btn-7 span:hover:before {
  height: 100%;
}
.btn-7 span:hover:after {
  width: 100%;
}
}
</style>
