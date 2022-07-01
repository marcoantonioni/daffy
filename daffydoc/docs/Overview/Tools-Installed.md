Thought out the Daffy process,  it will install all support tools it would need. Depending on the step of daffy you are running and feature it uses, the tools are different.
<b>****If the tool is present already and correct version, it will not be installed.</b>

## Core
| Tool   | 	When |
| :---      |    :----:     |  
|oc|always
|openshfit-install|always
|kubectl|always
nmon | always
|curl| always
|nano| always
|vim| always
|tree| always
|wget| always
|jq| always
|expect| always
|apache2-util| always
|unzip| always
|git| always
|dnsutils| always
|openssh-client| always
|grepcidr| always
|nfs-kernel-server|NFS Option only
|nfs-common|NFS Option only

## Cloud CLI
| Tool   | 	When |
| :---      |    :----:     |  
|awscli |AWS Install only
|azure-cli |Azure Install only
|gcloud |GCP Install only
|cloudctl |Cloud Pak install if Flag is set
|python2 |Cloud Pak install if cloudctl Flag is set (< 4.0.6)
|python3 |Cloud Pak install if cloudctl Flag is set (>= 4.0.6)
|pip2 |Cloud Pak install if Flag is set (< 4.0.6)
|pip3 |Cloud Pak install if Flag is set (>= 4.0.6)
|ibmcloud |ROKS Install and IBM DNS Used
|ibm-cp-automation |CP4BA Install Only
|podman |CP4BA Install or mirror local registry
