
<script>
  document.title = "Process";
</script>

<p align = "center">
    <img src='../images/process.png'  align="top" style = "float">
</p>

#Where Do I Start
The daffy tool allows you to start at any step.  Before you start, you need to see what your goal are.

1.  Do you need to build the OpenShift Cluster?  **Run Step 1**
2.  Do you need to deploy just the Cloud Pak Operators?  **Run Step 2**
3.  Do you need to deploy cloud Pak Services?  **Run Step 3**
4.  I need to build full stack (OpenShift, Cloud Pak Operators and Cloud Pak Services)  **Run Step 1, 2 and 3**


#Step 1
With Step one you will need information for your provider.  This includes provider ids, secrets, regions, etc.  The items that daffy will need to create your cluster in the given provider. In the end you are asking daffy to do a full install of OpenShift in the provider, so it needs all the info necessary to access the provider and build out infrastructure.


#Step 2
If you are starting at step 2, you would **NOT** need provider info(provider ids, secrets, regions, etc.).  The only thing step 2 needs is OpenShift cluster info.  Access to cluster and cluster and Cloud Pak details. If you used step 1, you already have access to cluster.  But if you are staring at step 2, you first need to logon on to your cluster via the **oc login** command from your bastion host where you plan to run daffy.

#Step 3
If you are starting at step 3, you would **NOT** need provider info(provider ids, secrets, regions, etc.).  The only thing step 3 needs is OpenShift cluster info.  Access to cluster and cluster and Cloud Pak details. But if you are staring at step 3, you first need to logon on to your cluster via the **oc login** command from your bastion host where you plan to run daffy.
