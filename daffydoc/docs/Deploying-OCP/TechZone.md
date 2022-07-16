---
hide:
  - footer
---

# TechZone Install

<img src='../images/techzone.jpeg'   align="top" width="100"
  height="200" style = "float">

At this point, you have a **bastion** machine where you have installed the Daffy tool, created your core <**ENVIRONMENT_NAME**>-env.sh.  Depneding on if you use TechZone to build your cluster, you may skip Daffy Step 1 that builds your cluster. You will not use the bastion to build your cluster, but follow the steps to have TechZone build your cluster.  Once that is done, you would move on with the daffy process and install your cloud paks from your new **bastion.**

## Platform Requirements

There are three options with TechZone

  1. OpenShift Cluster via AWS, Azure (**Prebuilt** Cluster)   [https://techzone.ibm.com/collection/third-party-cloud-openshift-clusters](https://techzone.ibm.com/collection/third-party-cloud-openshift-clusters)
    * With this option, you will skip Daffy step 1 (Build cluster) as TechZone will build for you. (This would fail as you do not have access to create cluster with a techzone setup)
    * You still need to have a bastion and core values in your <**ENVIRONMENT_NAME**>-env.sh



  2. Tech Zone VSphere (**Daffy** build's cluster) [https://techzone.ibm.com/collection/ocp-gymnasium](https://techzone.ibm.com/collection/ocp-gymnasium)
    - Once you create the request and the VSPhere environment has been provisioned, it will create your own bastion and give you the instructions on how to use Daffy in that environment with the prebuild <**ENVIRONMENT_NAME**>-env.sh.


  3. TechZone Roks (**Prebuilt** Cluster) [https://techzone.ibm.com/collection/custom-roks-vmware-requests](https://techzone.ibm.com/collection/custom-roks-vmware-requests)
    - With this option, you will skip Daffy step 1 (Build cluster) as TechZone will build for you (This will fail as you do not have access to create cluster with a techzone setup)
    - Once you create the access, you would follow the same steps of ROKS with Daffy
    - You still need to have a bastion and core values in your <**ENVIRONMENT_NAME**>-env.sh  
    - Extra setting to change in your environment file      
          1. **ROKS_PROVIDER=**techzone
          2. **DAFFY_DEPLOYMENT_TYPE=**TechZone


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
