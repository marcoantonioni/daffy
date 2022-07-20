<script>
  document.title = "Supporting Software - Bastion";
</script>
## What is a bastion server?

A bastion host is **a server whose purpose is to provide access to a private network from an external network,** such as the Internet. Because of its exposure to potential attack, a bastion host must minimize the chances of penetration. Openshift uses a bastion to help create a running cluster. A bastion can be reused for multiple clusters. In some scenarios for POC purposes such as User Provisioned Infrastructure (UPI), the bastion can be used as the proxy to the cluster.

Bastion servers can be installed anywhere. This guide assumes the bastion server is Ubuntu 20.04 Minimal and will be in the IBM Cloud.

Requirements for completing this task is to have an IBMid, an IBM cloud account, and a local SSH key. For more information, go to **Daffy Prerequisites.**

Detailed below are the instructions to build your own bastion to do an IPI or MSP install.

## IBM Cloud

1. First, open a web browser and go to http://cloud.ibm.com

2. Enter your id and click **'Continue'**

![1.png](../images/SupportingSoftware/CreateYourOwnBastion/1.png)

3. Once logged in, select **'Catalog'** in the top menu bar

![2.png](../images/SupportingSoftware/CreateYourOwnBastion/2.png)

4. Once the Catalog is loaded, select **'Compute'** or search the catalog for Virtual Servers. Select **'Virtual Server for Classic'**

![3.png](../images/SupportingSoftware/CreateYourOwnBastion/3.png)

Alternative: Skip step 3 and search for "virtual server", choosing "virtual server for classic". Both options achieve the same thing.  

![4.png](../images/SupportingSoftware/CreateYourOwnBastion/4.png)

5. Fill out the details. (Public, hostname can be anything, and so can domain – feel free to leave what is there originally for your domain). Choose your billing method based on needs to be either **Hourly** or **Monthly (~$40/mo.)** and choose a **Location.**

![5.png](../images/SupportingSoftware/CreateYourOwnBastion/5.png)

6. Scroll down and fill out the remainder of the information. Choose a **server type** and select your **SSH key** so you can login. Finally, make sure you have the **Ubuntu 20.04** Operating System selected.

**Note:** You can use any other available tool to create a key if needed

![6.png](../images/SupportingSoftware/CreateYourOwnBastion/6.png)

7. Click the **agreement** on the right-hand pane and select **'Create'**

![7.png](../images/SupportingSoftware/CreateYourOwnBastion/7.png)

8. This will take you to a **device page.** You can search for your bastion you have created. Once your server is done provisioning and has a **start date,** you can login to it via Termius using the **Public IP address.**

**If connecting to a VPN to connect to the network, you will use the Private IP address, but Public will be used more frequently.

![8.png](../images/SupportingSoftware/CreateYourOwnBastion/8.png)

9. Create a new host in Termius: use your **SSH key as the password**, use **root as the username**, input the **Public IP Address** from the device list as your host's address, and **create a label.**

![9.png](../images/SupportingSoftware/CreateYourOwnBastion/9.png)

**If you don't use a SSH Key, you can go into the details of the bastion you created by double clicking on it and going to the passwords section. This password will not show until provisioning is complete.

10. Once you have connected your bastion to **Termius**, install **Daffy** to the terminal of your newly created host.

## IBM Technology Zone

An alternative to creating a bastion using a paid IBM Cloud account is to use **IBM Technology Zone.**
There are three options with TechZone
!!! Warning   
      For internal IBM or Business partner use only

1. Use this link to navigate to **IBM Technology Zone:** https://techzone.ibm.com/collection/base-images

2. Scroll down to environments, and choose **IBM Virtual Server Instance (Classic)**

![10.png](../images/SupportingSoftware/CreateYourOwnBastion/10.png)

3. From there, complete your reservation. Make sure to **fill out items 1 – 4**, leaving the other fields **blank**.

![11.png](../images/SupportingSoftware/CreateYourOwnBastion/11.png)
