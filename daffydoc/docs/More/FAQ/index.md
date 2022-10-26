<script>
  document.title = "FAQ";
</script>
##Why the name Daffy?

Its a great name and mascot.

##What is your favorite Cloud Pak?

Cloud Pak for Business Automation

##Can this be run on the XBOX platform?

No, sorry.

##Daffy Slack Channels:
```
#daffy-user-group
```

##I put invalid or wrong Red Hat Pull Secret during the OCP install process, how do you fix?

You can run the security-cleanup.sh script to remove existing pull secret.

```
/data/daffy/security-cleanup.sh  --pullSecret
```
Follow all the instructions from the above script, then you can run daffy install process again


##I put invalid or wrong IBM Entitlement during the CP install process, how do you fix?

```
/data/daffy/security-cleanup.sh  --ibm
```
Follow all the instructions from the above script, then you can run daffy install process again


##How can I create my own bastion?

We have a document outlining how to create your own bastion in two ways

1.  A paid IBM Cloud Account
2.  IBM Technology Zone

<button onclick="location.href='../../../Supporting-Software/Bastion/'" class="custom-btn btn-7">Create Bastion Steps</button>

##ROKS unbound immediate PersistentVolumeClaims
This means the cluster has requested storage from MSP provider(IBM ROKS) and it is still provisioning it.  It can take a few minutes or hours at times or sometimes never get provisioned.
If it is stuck for more then 60 minutes, best option is to delete the stuck pod requesting storage or you can run the daffy rebuild process to get it working in a few hours.

##What does rebuild.sh do?
Rebuild starts over with your cluster using your environment file.

1.  <B><Font color=red>Delete</font></B> Cluster and all resources it created
2.  Install new Cluster
3.  Install new Cloud Pak
4.  Install all services for your Cloud Pak

rebuild.sh requires your env file, that drives all the info it would need.

As you can see, it will destroy everything and give you new env, nothing will be saved in cluster.
