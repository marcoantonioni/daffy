---
hide:
  - footer
---
<script>
  document.title = "Cloud Pak - WebSphere Automation";
</script>
Cloud Pak for WebSphere Automation {: style="text-align: left;"}
===============
<img src='../images/WSA.png'
       style="width:100px;height:100px;"/>

At this point, you have a working OCP cluster on your platform of choice. Your <**ENVIRONMENT_NAME**>-env.sh configuration file will contain details of the platform and OCP installation. You will now add to this file, the details of:

1) The Cloud Pak info that you wish to install

2) The services that you wish to install on the Cloud Pak


## Step 2: Deploy WSA

Deploying WebSphere Automation only requires **one** entry to your environment file (/data/daffy/env/<**ENVIRONMENT_NAME**>-env.sh)

**CPWSA_VERSION=<version>**

You can copy the following to your <**ENVIRONMENT_NAME**>-env.sh

```

CPWSA_VERSION=1.3
```

With this one value, the daffy engine will be able to install the version of WebSphere Automation.

The service consist of the following products.

WebSphere Automation Small Profile (consists of):

- WebSphere Automation

- WebSphere Health

- WebSphere Secure



WSA Supported Versions	OCP Versions
1.3  	4.8  
1.2  	4.8

Run the following command to deploy WebSphere Automation

```

/data/daffy/wsa/build.sh <ENVIRONMENT_NAME>
```

When this step is complete, up to an hour depending on your environment, you have basics of WebSphere Automation running. This will install all of the operators including foundational services. The cluster is now ready to deploy additional services and or demos.  At this stage, the cluster consists  of common services and WebSphere Automation operators and some services in the following projects:

**websphere-automation**

**ibm-common-services**

## Step 3: Deploy Services

Currently there one service / demos for WebSphere Automation. We are adding new features on a regular basis, please stay tuned.  If you have a feature request for an additional service or demo, please fill out a request.

## Step 3a: Status

The service can take a few hours to complete. To help monitor the status of the service/pattern deployment you can run the help flag to see what flags you can use to get information on your service/pattern deployment.

```

/data/daffy/wsa/build.sh <ENVIRONMENT_NAME> --help
```

**Run the following commands** to check the WebSphere Automation installation progress.

```

/data/daffy/wsa/service.sh <ENVIRONMENT_NAME> --status
```

If you want to have a running job to refresh every few seconds,  you can run the status script using the watch command.

```

watch -c /data/daffy/wsa/service.sh <ENVIRONMENT_NAME> --status
```

To find out the connection info to your new service/pattern, you can run the console flag to get user names, passwords and URLs to connect to.

```

/data/daffy/wsa/build.sh <ENVIRONMENT_NAME> --console
```
