---
hide:
  - footer
---


#KVM Install

<img src='../images/kvm.jpeg'  align="top" width="200"
  height="300" style = "float">

  At this point, you have a bastion machine where you have installed the Daffy tool, created your core <b>environment-name</b>-env.sh and can execute the install of OCP on ROKS.

##Step 1: Platform Requirements

To use Daffy on **K**ernel-based **V**irtual **M**achine, there are some platform info and requirements that need to be gathered or met. We have a simple doc that you should refer to that list all providers and what would be needed.  For KVM , it breaks down to the following three basic items:

**Hardware** - Enough to run the OCP Cluster based on T-Shirt Sizing

**OS Version** - Ubuntu 20.0.4

**Permission** - Full root authority

For detailed list of the above, you can find in the Daffy Provider Requirements. Please review before proceeding.

https://ibm.box.com/v/DaffyProviderRequirements

Public DNS Setup:

You will need to create a DNS entries and domain.  For the OpenShift install, you need the following:

1. Registered DNS Name - **myexample.com**
2. DNS Entries- **myexample-com**
    1. api.<CLUSTER_NAME>.**myexample.com**        --->    <YOUR.BASTION.IP>
    2. api-int.<CLUSTER_NAME>.**myexample.com**    --->    <YOUR.BASTION.IP>
    3. *.apps.<CLUSTER_NAME>.myexample.com      --->    <YOUR.BASTION.IP>


**Setting up DNS for KVM Deployment with OpenShift:**    
INSERT VIDEO Here

## Step 2: Environment File

Deploying the OpenShift on **K**ernel-based **V**irtual **M**achine only requires three entries to your <b>existing</b> core environment file (<ENVIRONMENT_NAME>-env.sh) plus a local service account file.

**Note:** You can look in the samples directory on your bastion for example of **K**ernel-based **V**irtual **M**achine install : /data/daffy/env/samples/kvm-upi-env.sh



You can copy the sample file to build your new environment  file.

cp /data/daffy/env/samples/kvm-upi-env.sh /data/daffy/env/<ENVIRONMENT_NAME>-env.sh

**<u>Valid Options:</u>**

**OCP_INSTALL_TYPE=** kvm-upi

Optional:

**BASTION_HOST**="xxx.xxx.xxx.xxx"

If your host does not have its own public IP address, you need to specify the bastion IP address that the OCP cluster would use to reach your Bastion host, its local IP address you used to connect to the bastion:

**OCP_CREATE_OPENSHIFT_CONTAINER_STORAGE=**true

If you plan to install a cloud pak and/or need storage, you need to set the flag to setup OCS Storage

##Step 3: Execution

To deploy your OCP cluster to Kernel-based Virtual Machine, run the build.sh script from the /data/daffy/ocp directory

```
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```

Once your cluster is fully deployed you can access the help menu which has a number of options.

Note: <ENVIRONMENT_NAME> is the first part of your name that you used for the <ENVIRONMENT_NAME>-env.sh file
```
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME> --help
```

Here is a full example for deploying OpenShift on Kernel-based Virtual Machine with the Daffy process.

<button onclick="location.href='/daffy/Cloud-Paks/'" class="custom-btn btn-7">
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
