---
hide:
  - footer
---
<script>
  document.title = "SSL Certificates - BETA";
</script>
#SSL Certificates - BETA

## Cluster Ingress Certificates
The Ingress Operator makes it possible for external clients to access your service by deploying and managing one or more HAProxy-based Ingress Controllers to handle routing. You can use the Ingress Operator to route traffic by specifying OpenShift Container Platform Route and Kubernetes Ingress resources. Configurations within the Ingress Controller, such as the ability to define endpointPublishingStrategy type and internal load balancing, provide ways to publish Ingress Controller endpoints.

By default Openshift will create self-signed, untrusted certs in the cluster.  But if you want to install a trusted cert from a Trusted Certificate Authority(CA), this will allow you to do that.  Daffy supports any valid cert from any Certificate Authority(CA), public or private.  Just needs to be in the PEM format.

For ingress there are two major urls.  

  - *.apps.${CLUSTER_NAME}.${BASE_DOMAIN}
  - api.${CLUSTER_NAME}.${BASE_DOMAIN}

### Assumptions
1.  Must have valid Certificate in PEM format(apps and api)
2.  Must have private key from the cert(apps and api)
3.  Must have trust chain cert form the CA that issued the cert( apps only)
4.  The apps Ingress cert must have wild card Common Name  *.apps.yourcluster.acme.com


#### Location of certs
1. <B><Font color=blue>Apps ingress</Font></B>

    When the daffy process runs, it will look in the certs folder for your certs.  If it finds all three certs, it will apply them to the cluster.

    /data/daffy/certs/${CLUSTER_NAME}/<B><Font color=red>apps</Font></B>.${CLUSTER_NAME}.${BASE_DOMAIN}**.crt**

    /data/daffy/certs/${CLUSTER_NAME}/<B><Font color=red>apps</Font></B>.${CLUSTER_NAME}.${BASE_DOMAIN}**.key**

    /data/daffy/certs/${CLUSTER_NAME}/${OCP_TRUSTE_CA_FILE}**.pem**

2. <B><Font color=blue>API ingress</Font></B>

    When the daffy process runs, it will look in the certs folder for your certs.  If it finds both certs, it will apply them to the cluster.

    /data/daffy/certs/${CLUSTER_NAME}/<B><Font color=red>api</Font></B>.${CLUSTER_NAME}.${BASE_DOMAIN}**.crt**

    /data/daffy/certs/${CLUSTER_NAME}/<B><Font color=red>api</Font></B>.${CLUSTER_NAME}.${BASE_DOMAIN}**.key**


#### Environment variables
| Variable Name           | Info                                          | Default value       | Required    |
| :---------              |    :---------                                 |   :----             |   :----     |
| OCP_TRUSTE_CA_NAME      | The display name of your CA Cert in OpenShift |   lets-encrypt      |   No       |
| OCP_TRUSTE_CA_FILE      | The file name of your CA Cert                 |   lets-encrypt.pem  |   No       |


### Execution

#### Cluster Install Time

If you have your required certs in the location, during the cluster install, it will pick them up and install them after the cluster has been setup and running.

!!! INFO
	If only some of your certs are there or none, the cluster install process will continue, no errors or warnings.


#### Post Cluster Install

If you already have a cluster up and running, you can run the build.sh post flag to install your certs.  Because this is explicit call to install certs, it will precheck to see all of your certs are there and correct location.  If not it will give you error and not continue. You can run as post cluster install step.


```shell
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME> --updateIngressCerts
```


## CP4BA

There are two main ingress access points for CP4BA.

  - cp-console(icp-management-ingress)
  - cpd(ibm-nginx-svc).

By default, these are setup with self-signed certs. If you want to replace them with trusted certs from any major CA, this process will allow that.


For ingress there is a base urls.  

  - *.apps.${CLUSTER_NAME}.${BASE_DOMAIN}


### Assumptions
1.  Must have valid Certificate in PEM format
2.  Must have private key from the cert
3.  Must have trust chain cert form the CA that issued the cert
4.  The apps Ingress cert must have wild card Common Name  *.apps.${CLUSTER_NAME}.${BASE_DOMAIN}


### Location of certs
1. <B><Font color=blue>CP4BA ingress</Font></B>

    When the daffy process runs, it will look in the certs folder for your certs.  If it finds all three certs, it will apply them to the cluster.

    /data/daffy/certs/${CLUSTER_NAME}/<B><Font color=red>apps</Font></B>.${CLUSTER_NAME}.${BASE_DOMAIN}**.crt**

    /data/daffy/certs/${CLUSTER_NAME}/<B><Font color=red>apps</Font></B>.${CLUSTER_NAME}.${BASE_DOMAIN}**.key**

    /data/daffy/certs/${CLUSTER_NAME}/${OCP_TRUSTE_CA_FILE}**.pem**


### Environment variables
| Variable Name           | Info                                          | Default value       | Required    |
| :---------              |    :---------                                 |   :----             |   :----     |
| OCP_TRUSTE_CA_NAME      | The display name of your CA Cert in OpenShift |   lets-encrypt      |   No       |
| OCP_TRUSTE_CA_FILE      | The file name of your CA Cert                 |   lets-encrypt.pem  |   No       |

### Execution

#### Post CP4BA Install Time
For you to run this, the cloud pak must be up and running.  This process can only updated existing pods and secrets.


```shell
/data/daffy/cp4ba/build.sh <ENVIRONMENT_NAME> --updateIngressCerts
```



## Useful Links
- [PEM Certificate](https://aboutssl.org/what-is-pem-certificate-file/){target=_blank}
- [OpenShift Ingress Api](https://docs.openshift.com/container-platform/4.10/security/certificates/api-server.html){target=_blank}
- [OpenShift Ingress Apps](https://docs.openshift.com/container-platform/4.10/security/certificates/replacing-default-ingress-certificate.html){target=_blank}
- [Common Services Ingress](https://www.ibm.com/docs/en/cloud-paks/cp-integration/2022.4?topic=certificates-creating-custom-hostname){target=_blank}
- [CP4BA Services Ingress](https://www.ibm.com/docs/en/cloud-paks/cp-biz-automation/22.0.2?topic=security-customizing-cloud-pak-entry-point){target=_blank}
