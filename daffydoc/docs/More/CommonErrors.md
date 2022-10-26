<script>
  document.title = "Common Errors";
</script>

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
```
Precheck IBM Cloud VPC quota (LOG /data/daffy/log/cpdata/ocp/ibmcloud-vpc-quota.log )
################################################################
ibmcloud resource group-create daffy-quota-test
ibmcloud is target --gen 2
ibmcloud is vpc-create daffy-quota-test-vpc —resource-group-name daffy-quota-test
ibmcloud is subnet-create daffy-quota-test-subnet daffy-quota-test-vpc us-south-3 --ipv4-cidr-block 10.240.128.0/18 --resource-group-name daffy-quota-test
❌  FAILED vCPUs needed 176
```
The IBM VPC zone that you're trying to deploy to does not have enough quota of VPC to have a successful deployment.
VPC quota is based on the region so you have two options:

1.  Deployed to a new zone
2.  Request via IBM cloud ticket to increase your quota to 500 (edited)

[https://cloud.ibm.com/docs/vpc?topic=vpc-quotas](https://cloud.ibm.com/docs/vpc?topic=vpc-quotas){target=_blank}
