# Daffy Pre-Requirements

## Whats is required to use Daffy?

Before you can use the Daffy scripts, you must have the following.

### SSH client on your local workstation
- We highly recommend installing Termius as your SSH client.
- The Termius installer can be found here:  [Windows](https://termius.com/windows){target=_blank} or [Mac](https://termius.com/mac-os){target=_blank}  (Only the Free Version is needed)

### A Bastion Machine
- [Create Bastion Instructions](https://w3.ibm.com/w3publisher/daffy/supporting-software/create-your-own-bastion){target=_blank}
- Ubuntu 20.04 (Minimum Requirements: 2 CPU, 2GB Memory) with full root access  **(VSphere-UPI, *-IPI and *-MSP)**
- Ubuntu 20.04 (Minimum Requirements: 60+ CPU, 128GB+ Memory) with full root access  **(KVM-UPI)**
- RHEL 8.X         (Minimum Requirements: 2 CPU, 2GB Memory) with full root access  **(*-IPI and *-MSP)**

### Red Hat pull secret
1. If you or your customer does not have a Red Hat pull secret.
    1. Sign up for 60 day trail for OpenShift: [RedHat Pull secret Site](https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/auth?client_id=rh-product-eval&redirect_uri=https%3A%2F%2Fwww.redhat.com%2Fwapps%2Feval%2Findex.html%3Fevaluation_id%3D1053&state=65bea41f-d86c-4132-8f2d-7e04fcb04fb1&response_mode=fragment&response_type=code&scope=openid&nonce=f02607dc-794c-4249-8318-40892596b6a4)  
          - **Important:** If your installing on a customer owned platform account or a on-prem customer datacenter, you MUST instruct your customer to register for a trial account and use their pull secret for the install. Do not use your own pull secret for customer engagements.
    2.  ​​​​[Sign up for IBM / Red Hat partner program](https://ibm.seismic.com/app?ContentId=f8d25c6e-5a6e-4db4-b542-dad3e5d902f5#/doccenter/5477419a-9474-4c51-94af-b442e9169fab/doc/%252Fdd98c5a3df-6b7c-1d77-6f07-d12e63954c78%252FdfOTRiYmU4NTQtNWY4NC03Y2QyLWZjYWUtOGIxYmFmZjkyZThk%252CPT0%253D%252CUXVpY2sgcmVmZXJlbmNlIGd1aWRl%252Flf22b694b3-80e0-4332-92ba-4a8183a59396/grid/)
          - **NOTE:** All IBMer's are entitled to the Red Hat partner program. Your Red Hat pull secret can ONLY be used for training and demo purposes. Do not provide your personal pull secret to customers.

  2. If you have a Red Hat account, you can find your existing pull secret here.  
          -  [Login to Red Hat](https://sso.redhat.com/auth/realms/redhat-external/protocol/openid-connect/auth?client_id=cloud-services&redirect_uri=https%3A%2F%2Fconsole.redhat.com%2Fopenshift%2Fdownloads&state=fce85c1f-4592-437e-a1fa-247f3e6e42a3&response_mode=fragment&response_type=code&scope=openid&nonce=962036d3-ef65-4c80-81cb-e608ba9b122b)  
          - Scroll down the page until you see "Tokens" and download the pull secret.

  3. Accessing Red Hat entitlements from your IBM Cloud Paks:
          - [Accessing-red-hat-entitlements-from-your-cloud-paks](https://www.ibm.com/docs/en/cloud-paks/1.0?topic=iocpc-accessing-red-hat-entitlements-from-your-cloud-paks)

### IBM Entitlement Key

1. If you need to get your own IBM entitlement key you can get [ here](https://myibm.ibm.com/products-services/containerlibrary).
     - Copy to clipboard and save to a local file
2. If you need create one for a customer you can submit request here. [here](https://ibm.seismic.com/app#/doccenter/5477419a-9474-4c51-94af-b442e9169fab/doc/%252Fdd98c5a3df-6b7c-1d77-6f07-d12e63954c78%252FdfOTRiYmU4NTQtNWY4NC03Y2QyLWZjYWUtOGIxYmFmZjkyZThk%252CPT0%253D%252CU2VsbGVyIGVuYWJsZW1lbnQ%253D%252Flfd6999bf8-4782-460e-980c-a37faf7b2b69//?mode=view&searchId=76d7b1d4-65bc-4d7d-98f9-fedbcd7fade9).
3. Customer can use these links to request their own trail keys here. [here](https://w3.ibm.com/w3publisher/daffy/faq/ibm-entitlement-keys).
