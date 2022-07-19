# Turbonomic

!!! attention 
You will be required to provide a license key to fully enable the Turbonomic Platform. When the platform installation is complete, you will be presented with a URL where you will need to configure the administrator password and provide a valid Turbonomic license key. 

![DeployingTurbonomicsOnOpenShift.png](../images/SupportingSoftware/Turbonomics/DeployingTurbonomicsOnOpenShift.png)

KubeTurbo is the Turbo Metric Collector designed to send metrics and usage data from the Kubernetes environment to a Turbonomic Platform instance. Installing KubeTurbo will require you to provide the Turbonomic Platform topology processor URL and the administrator password. 

!!! info inline end
The default admin username for the Turbonomic Platform is: administrator. 


##TURBONOMIC PLATOFRM 

**_REQUIRED ENVIRONMENT VARIABLES_**

```
TURBO_PLATFORM_VERSION=8.5.4
```

!!! info
There are no optional environment variables for the Turbononmic Platform

##KUBETURBO 

**_REQUIRED ENVIRONMENT VARIABLES_**

```
TURBO_PLATFORM_URL="https://topology-processor-turbo.apps.yourdomain.net"
TURBO_KUBE_CLUSTER_NAME="gamma03"
```

!!! note
The TURBO_PLATFORM_URL will be the "topology-processor" OpenShift ROUTE URL (If using the Turbo Platform Deployed by Daffy). If the Turbo Platform was deployed without DAFFY, the URL may be the nginx endpoint.

**_OPTIONAL ENVIRONMENT VARIABLES_**


```
TURBO_PLATFORM_USERNAME="administrator"
```