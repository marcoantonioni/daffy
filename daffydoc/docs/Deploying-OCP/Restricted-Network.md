---
hide:
  - footer
---
<script>
  document.title = "Deploy OCP - Restricted Network";
</script>
<!-- CSS FOR SLIDESHOW -->
## Slide Show
<style>
* {box-sizing:border-box}

/* Slideshow container */
.slideshow-container {
  max-width: 1000px;
  position: relative;
  margin: auto;
}

/* Hide the images by default */
.mySlides {
  display: none;
}

/* Next & previous buttons */
.prev, .next {
  cursor: pointer;
  position: absolute;
  top: 50%;
  width: auto;
  margin-top: -22px;
  padding: 16px;
  color: white;
  font-weight: bold;
  font-size: 18px;
  transition: 0.6s ease;
  border-radius: 0 3px 3px 0;
  user-select: none;
}

/* Position the "next button" to the right */
.next {
  right: 0;
  border-radius: 3px 0 0 3px;
}

/* On hover, add a black background color with a little bit see-through */
.prev:hover, .next:hover {
  background-color: rgba(0,0,0,0.8);
}

/* Caption text */
.text {
  color: #f2f2f2;
  font-size: 15px;
  padding: 8px 12px;
  position: absolute;
  bottom: 8px;
  width: 100%;
  text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
  color: #f2f2f2;
  font-size: 12px;
  padding: 8px 12px;
  position: absolute;
  top: 0;
}

/* The dots/bullets/indicators */
.dot {
  cursor: pointer;
  height: 15px;
  width: 15px;
  margin: 0 2px;
  background-color: #bbb;
  border-radius: 50%;
  display: inline-block;
  transition: background-color 0.6s ease;
}

.active, .dot:hover {
  background-color: #717171;
}

/* Fading animation */
.fade {
  animation-name: fade;
  animation-duration: 1.5s;
}

@keyframes fade {
  from {opacity: .4}
  to {opacity: 1}
}
</style>

<div class="slideshow-container">

  <!-- Full-width images with number and caption text -->
  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="../Restricted-Network-ppt/cover.png" style="width:100%">
    <div class="text">Intro</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="../Restricted-Network-ppt/pic1.png" style="width:100%">
    <div class="text">Caption Text</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="../Restricted-Network-ppt/pic2.png" style="width:100%">
    <div class="text">Caption Text</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="../Restricted-Network-ppt/pic3.png" style="width:100%">
    <div class="text">Caption Text</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="../Restricted-Network-ppt/pic4.png" style="width:100%">
    <div class="text">Caption Text</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="../Restricted-Network-ppt/pic5.png" style="width:100%">
    <div class="text">Caption Text</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="../Restricted-Network-ppt/pic6.png" style="width:100%">
    <div class="text">Caption Text</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="../Restricted-Network-ppt/pic7.png" style="width:100%">
    <div class="text">Caption Text</div>
  </div>

  <div class="mySlides fade">
    <div class="numbertext">1 / 3</div>
    <img src="../Restricted-Network-ppt/pic8.png" style="width:100%">
    <div class="text">Caption Text</div>
  </div>

  <!-- Next and previous buttons -->
  <a class="prev" onclick="plusSlides(-1)">&#10094;</a>
  <a class="next" onclick="plusSlides(1)">&#10095;</a>
</div>
<br>


<!-- The dots/circles -->
<div style="text-align:center">
  <span class="dot" onclick="currentSlide(1)"></span>
  <span class="dot" onclick="currentSlide(2)"></span>
  <span class="dot" onclick="currentSlide(3)"></span>
  <span class="dot" onclick="currentSlide(4)"></span>
  <span class="dot" onclick="currentSlide(5)"></span>
  <span class="dot" onclick="currentSlide(6)"></span>
  <span class="dot" onclick="currentSlide(7)"></span>
  <span class="dot" onclick="currentSlide(8)"></span>
  <span class="dot" onclick="currentSlide(9)"></span>
</div>
<!-- JS FOR SLIDESHOW-->
<script>
let slideIndex = 1;
showSlides(slideIndex);

// Next/previous controls
function plusSlides(n) {
  showSlides(slideIndex += n);
}

// Thumbnail image controls
function currentSlide(n) {
  showSlides(slideIndex = n);
}

function showSlides(n) {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  if (n > slides.length) {slideIndex = 1}
  if (n < 1) {slideIndex = slides.length}
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " active";
}

</script>
<!-- END OF JS-->


## Overview
Deploying OpenShift in a restricted network (air-gap), can be done with the Daffy Restricted Network scripts. This page will primarly focus on the steps to perform aa Airgap install; however, please note the Proxy Install approach can be a viable option and is a more simple approach. Regardless, of which one you choose, both install options will result in a OpenShift cluster with restricted network access. Also, note that the Airgap install is more complicated and will require a JUMP BOX that has internet access to the Quay Repository.

***There are two basic options for deployment***

* Option 1.) **Airgap Install**
* Option 2.) **Proxy Install**  


### Proxy install

OpenShift environments can deny direct access to the internet and instead have an HTTP or HTTPS proxy available. This can be done during an cluster installation. This would allow the cluster to be in a restricted network but gain access to public registries via proxy server.  The bastion and cluster you build must also have direct access to the proxy server. This proxy server can then control what access is granted via whitelist.

If you are doing proxy install, you only need one bastion and no jump box.  This bastion must have access to the restricted network and the proxy server as well.


```
#Airgap - Proxy Install#
######################################################################################
OCP_PROXY_HTTP_PROXY=
OCP_PROXY_HTTPS_PROXY=
OCP_PROXY_NO_PROXY=
```

!!! Info
      At this point for a proxy install, you can skip the following steps and move to the last step and install your cluster.


### Airgap install
OpenShift environments can deny direct access to the internet completely. With this method you must replicate or mirror the public registries local in your restricted network.  
To do this we will use the following terms:

1. **Jump box** - Machine that will have direct access to the internet to mirror(download) public registry software.
2. **Bastion**  - Machine that will install the cluster and have direct access to the restricted network where the cluster will run.

#### Requirements
1. **Jump Box**  - 4X32 100GB Disk (Disk depending on what you plan to mirror)
    1.  Default will need storge **/data/export** and **/mirror/registry**
2. **Bastion**   - 4X32 100GB Disk (Disk depending on what you plan to mirror)
    1.  Default will need storge **/data/import** and **/mirror/registry**



#### Environment File
You should build your environment file based the final install you want to  build and should include those values in this file as well.  

The following values are required specifical for **Airgap** install.

**LOCAL_REGISTRY_ENABLED=**Do you want this to be an airgap install true|false.  **Lower case**   
**LOCAL_REGISTRY_DNS_NAME=**This is your jump box DNS name. If you not have DNS, you can also put the ip address   
**LOCAL_REGISTRY_IP=**This is your jump box IP address    
**LOCAL_AIRGAP_REGISTRY_DNS_NAME=**This is your restricted network bastion box DNS name. If you not have DNS, you can also put the ip    address    
**LOCAL_AIRGAP_REGISTRY_IP=**This is your restricted network bastion box IP address   

```
#Local Registry Info
###############################
LOCAL_REGISTRY_ENABLED=<true|false>
LOCAL_REGISTRY_DNS_NAME=
LOCAL_REGISTRY_IP=
LOCAL_AIRGAP_REGISTRY_DNS_NAME=
LOCAL_AIRGAP_REGISTRY_IP=
```

>##### Overrides
Current values that you can add to your own environment file to override if needed but not required:
<details>
<summary>Click to expand!</summary>
```
#Catalogs to mirror
####################
OCP_CATALOG_MIRRORS="compliance-operator,container-security-operator,file-integrity-operator,local-storage-operator,ocs-operator"

#Directory Info
####################
OCP_REGISTRY_ROOT="/mirror/registry"
OCP_AIRGAP_EXPORT="${DATA_DIR}/export/airgap"
OCP_AIRGAP_IMPORT="${DATA_DIR}/import/airgap"
OCP_AIRGAP_EXPORT_FREE_DISK_SIZE_NEEDED="100"
OCP_AIRGAP_IMPORT_FREE_DISK_SIZE_NEEDED="100"

#Cert Info
####################
CA_CERT_OU="ca.${CLUSTER_NAME}.${BASE_DOMAIN}"
LOCAL_REGISTRY_CERTS_FOLDER="${DATA_DIR}/${PROJECT_NAME}/certs"

#Registry Info
####################
LOCAL_REGISTRY_PORT="8443"
LOCAL_OCP_REPOSITORY_NAME="ocp4/openshift4"
LOCAL_OLM_MIRROR_REPOSITORY_NAME="olm-mirror"

```
</details>

#### Mirror locally

From your jump box run the following command:
```
/data/daffy/ocp/registry/build.sh <ENVIRONMENT_NAME>
```

#### Export Files
After the first command runs, it will display all the files that it created and you will now need to move them to your bastion box in the restricted network. You can do this via portable USB disk, scp, etc.  You just need to move these files any way you can to your restricted network bastion.

#### Move Files
In our example we will move via scp because our jump box has access to the bastion.  This could be via firewall or it has dual NIC cards (Public Nic/Private Nic)

```
ssh <BASTION-IP> mkdir -p /data/import/airgap
scp /data/export/airgap/* <BASTION-IP>:/data/import/airgap
```


#### Prepare Bastion
Once all the files are on the bastion in the restricted network, you can run the script that was build from the previous step and copied over.  This will untar all files, install all command line tools and also install daffy locally.
!!! Info
    It does not mirror the registry or build the local registry, but gets the bastion ready for that next step

```
/data/import/airgap/airgap-prep.sh
```



#### Build Local Mirror
From your bastion box run the following command:
```
/data/daffy/ocp/registry/build.sh <ENVIRONMENT_NAME>
```
## Install Cluster

No you would just follow the normal steps to build your OpenShift registry.  

```
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME>
```

## Demo Video
!!! Info
      No voice over yet in video!


<html>
   <head>
      <title>HTML Video embed</title>
   </head>
   <body>
      <center>
        <iframe width="560" height="315" src="https://www.youtube.com/embed/stDQ1mxumKA" frameborder="0" allowfullscreen></iframe>
      </center>
   </body>
</html>

<html>
