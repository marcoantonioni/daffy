<script>
  document.title = "Supporting Software - Instana";
</script>
With the Daffy scripts you can now install Instana monitoring. The scripts support installing both the Instana backend (server) and the Instana agent on OpenShift clusters. 

!!! attention

	When deploying OpenShift, you may enable the Instana Agent for monitoring. This is assuming you already have a remote Instana Platform Server up and the monitoring agent URL is ready to accept monitoring data. 

## Obtain Key

!!! attention

	You will be required to provide an Instana license key to fully enable the 	Instana monitoring platform (backend). The Instana monitoring agent does not require a license key for installation. 

Documentation on how to obtain a license key can be found here

(Seismic Link to how to obtain a Instana License Key)[https://ibm.seismic.com/Link/Content/DCj2qgpG29qPj8cHGVFXH8jppBRj]

If you are looking to gain a license key for Customer Evaluation, you will need access to the Portal. To gain access to the portal you need to request access via AccessHub. Below is documentation on how to request access to the Instana License Portal on AccessHub. 
(AccessHub Access Hub Documentation)[https://ibm.ent.box.com/s/cssvm4bhrij85cijkl25numzcrxv1anm]


## Install 

**_INSTANA BACKEND SERVER PLATFORM - REQUIRED ENVIRONMENT VARIABLES_**

To install the backend platform you must have this variable set in your env file. 

```R
INSTANA_SERVER_INSTALL=true
```

**_INSTANA BACKEND SERVER PLATFORM - OPTIONAL ENVIRONMENT VARIABLES_**

The version of the instana platform will default to the latest version supported by the daffy scripts. You may choose to set it to a specific version, but it must be a version that is supported by the Daffy installer. 

Currently the supported versions for the Instana Backend Platform is: (239 - 246)

```R
INSTANA_VERSION=246
```

**_INSTANA MONITORING - REQUIRED ENVIRONMENT VARIABLES_**

To install the Instana monitoring agent for your OpenShift cluster, you must have this variable in your env file. 

```R
INSTANA_MONITORING=true
```

**_INSTANA MONITORING - OPTIONAL ENVIRONMENT VARIABLES_**

If you are installing the Instana monitoring agent on the same OpenShift cluster as the Instana platform server, you can use this variable. If you are installing just the Instana agent and sending monitoring data to a remote Instna Platform, this variable must be set to the remote Instna Server Agent URL. 

```R
INSTANA_AGENT_URL="agent.instana.apps.${CLUSTER_NAME}.${BASE_DOMAIN}"
```

## Executing Scripts

=== "Instana Platform Backend"

	``` title="Deploy Instana Platform Backend Server"
	/data/daffy/instana/build.sh <env-prefix>
	```

=== "Instana Agent"

	``` title="Deploy Instana Monitoring Agent"
	/data/daffy/instana/service.sh <env-prefix>
	```

## Help

For assistance, please reach out to the slack channel #daffy-user-group. 

!!! note

	Your question may have already been answered, please do a search in this channel before you post a question. 
