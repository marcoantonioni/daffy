---
hide:
  - footer
---
<script>
  document.title = "IBM Cloud Secrets Manager";
</script>
#IBM Cloud Secrets Manager
## Assumptions

With IBM Cloud Secrets Manager, you can create, lease, and centrally manage secrets that are used in IBM Cloud services or your custom-built applications. Secrets are stored in a dedicated instance of Secrets Manager, built on open source HashiCorp Vault.

For daffy to be able to download your certs from IBM Secrets Manager, we just need a few variables.  Below are the variables you will need and how to obtain them from the [IBM Cloud Web Portal IBM ](https://cloud.ibm.com/){target=_blank}.


!!! INFO
    We will not show you how to setup IBM Secrets Manager, Cert Authority or request your certs. Please follow the standard IBM Doc listed in the useful links below.




### Environment variables
| Variable Name                  | Info                                             |  Required     |
| :---------                     |    :---------                                    |    :----      |
| IBM_SECRET_CERT_API_KEY        | The API key that can access your Secrets         |  Yes(Will Prompt at runtime if the other three are present)       |
| IBM_SECRET_SERVICE_API_URL     | The host name for your Secret Service            |  Yes       |
| IBM_SECRET_CERT_ID_INGRESS_API | The ID for your API Cert                         |  Yes       |
| IBM_SECRET_CERT_ID_INGRESS_APPS| The ID for your APPS Cert                        |  Yes       |


### Building Certs

When you build your certs, you have two options.

1.  You can build a cert for each URL (*.apps & api ) 

    1.  Apps Cert 
        1.  **Common Name** - *.apps.${CLUSTER}.${BASE_DOMAIN}
    2.  API Cert 
        2.  **Common Name** - api.${CLUSTER}.${BASE_DOMAIN}


2.  You can build a single cert with both URLs as alt names of the cert
    1.  **Common Name** - ${CLUSTER}.${BASE_DOMAIN}
    2.  **Alt Names**   - ${CLUSTER}.${BASE_DOMAIN}, *.apps.${CLUSTER}.${BASE_DOMAIN}, app.${CLUSTER}.${BASE_DOMAIN}


!!! INFO
    <Font color=red>If you build one cert, you would just use the same cert ID for both apps and api values in env file</Font>


### Find Your Values


#### Cert API Key
<Font color=blue>IBM_SECRET_CERT_API_KEY</Font>

In your IBM Cloud account, you need to create/use an API key that has authority to access your secrets.

- [IBM Cloud API Keys](https://cloud.ibm.com/iam/apikeys){target=_blank}

??? Info "Create Key"
    <img src='../../images/security/ibmsecretsmanager/ibmSecretCertApiKey1.jpg'   align="top"  style = "float">



####Service API Url
<Font color=blue>IBM_SECRET_SERVICE_API_URL</Font>

This is the Service API Url for your Secretes Manger Instance

??? Info "Get Service URL"
    <img src='../../images/security/ibmsecretsmanager/ibmSecretServiceAPIURL.jpg'   align="top"  style = "float">


####Cert ID Ingress API
<Font color=blue>IBM_SECRET_CERT_ID_INGRESS_API</Font>

Each Cert you create has a unique ID, we will use that ID to download the cert via the command line.

??? Info "Secret (Cert) Show Details"
    <img src='../../images/security/ibmsecretsmanager/ibmSecretCertIDIngressAPI1.jpg'   align="top"  style = "float">

??? Info "Secret (Cert) ID"
    <img src='../../images/security/ibmsecretsmanager/ibmSecretCertIDIngressAPI2.jpg'   align="top"  style = "float">



####Cert ID Ingress APPS
<Font color=blue>IBM_SECRET_CERT_ID_INGRESS_APPS</Font>

Each Cert you create has a unique ID, we will use that ID to download the cert via the command line.

??? Info "Secret (Cert) Show Details"
    <img src='../../images/security/ibmsecretsmanager/ibmSecretCertIDIngressAPPS1.jpg'   align="top"  style = "float">

??? Info "Secret (Cert) ID"
    <img src='../../images/security/ibmsecretsmanager/ibmSecretCertIDIngressAPPS2.jpg'   align="top"  style = "float">


<B><Font color=red>There is one important fact about the apps cert.  It needs to be a wild card certs</Font></B>  

*.apps.${CLUSTER_NAME}.${BASE_DOMAIN}
??? Info "Apps Cert Common Name"
    <img src='../../images/security/ibmsecretsmanager/AppsCertCommonName.jpg'   align="top"  style = "float">



## Execution

### Cluster Install Time

If you have your required Environment variables in your file, during the cluster install, it will pick them up and download the certs to the correct location.

  <B>/data/daffy/certs/${CLUSTER_NAME}</B>

!!! INFO
	If you are missing any of the variables, the cluster install process will continue and not download your certs, no errors or warnings. You can run as post cluster install step.



### Post Cluster Install
If you already have a cluster up and running, you can run the build.sh post flag to install download your certs.  Because this is explicit call to download certs, it will precheck to see all of your variables are there.  If not it will give you error and not continue.


```shell
/data/daffy/ocp/build.sh <ENVIRONMENT_NAME> --downloadIBMCloudIngressCerts
```

## Useful Links
- [Getting started with Secrets Manager](https://cloud.ibm.com/docs/secrets-manager?topic=secrets-manager-getting-started&mhsrc=ibmsearch_a&mhq=Secrets+Manager){target=_blank}
- [IBM Cloud Secrets Manger cli](https://cloud.ibm.com/docs/secrets-manager?topic=secrets-manager-cli-plugin-secrets-manager-cli){target=_blank}
