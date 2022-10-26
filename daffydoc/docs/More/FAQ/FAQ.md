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


##Failed to watch *v1.ClusterVersion?
The following error can happen on any platform.  Its not major error, more of an FYI.  Just means that during the cluster setup, the install program was disconnected. Most of the time the install is fine, just a few hiccups. You can ignore this error.
```
E0908 07:05:20.266253 2142422 reflector.go:138] k8s.io/client-go/tools/watch/informerwatcher.go:146: Failed to watch *v1.ClusterVersion: failed to list *v1.ClusterVersion: Get "https://api.lambda02.daffy-installer.com:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": EOF
W0908 07:05:31.158887 2142422 reflector.go:324] k8s.io/client-go/tools/watch/informerwatcher.go:146: failed to list *v1.ClusterVersion: Get "https://api.lambda02.daffy-installer.com:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": EOF
I0908 07:05:31.159042 2142422 trace.go:205] Trace[1375718625]: "Reflector ListAndWatch" name:k8s.io/client-go/tools/watch/informerwatcher.go:146 (08-Sep-2022 07:05:21.098) (total time: 10060ms):
Trace[1375718625]: ---"Objects listed" error:Get "https://api.lambda02.daffy-installer.com:6443/apis/config.openshift.io/v1/clusterversions?fieldSelector=metadata.name%3Dversion&limit=500&resourceVersion=0": EOF 10060ms (07:05:31.158)
Trace[1375718625]: [10.060656161s] [10.060656161s] END
```

##FAILED vCPUs needed
What does this mean?
Precheck IBM Cloud VPC quota (LOG /data/daffy/log/cpdata/ocp/ibmcloud-vpc-quota.log )
################################################################
ibmcloud resource group-create daffy-quota-test
ibmcloud is target --gen 2
ibmcloud is vpc-create daffy-quota-test-vpc —resource-group-name daffy-quota-test
ibmcloud is subnet-create daffy-quota-test-subnet daffy-quota-test-vpc us-south-3 --ipv4-cidr-block 10.240.128.0/18 --resource-group-name daffy-quota-test
❌  FAILED vCPUs needed 176

The IBM VPC zone that you're trying to deploy to does not have enough quota of VPC to have a successful deployment. 
VPC quota is based on the region so you have two options:
1) Deployed to a new zone
2) Request via IBM cloud ticket to increase your quota to 500 (edited)
https://cloud.ibm.com/docs/vpc?topic=vpc-quotas
