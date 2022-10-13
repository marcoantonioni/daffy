---
hide:
  - footer
---
<script>
  document.title = "AppStore - IBM Daffy CLI Environment Configurator";
</script>

<img src='../images/Daffy Configurator.png'
       style="width:300px;height:300px;"/>

# Info
A command line tool to build a Daffy environment file based on sets of questions. This tool was developed to simplify the creation of an environment file, figure out cluster details, copy to Daffy to run the environment file, and be able to store your environment files to your own GitHub repository.

The Daffy CLI Environment Configurator will walk you through the things it needs for a successful install of OpenShift, CloudPaks, Services, and a combination of any of them that work with the Daffy steps.

## Prerequisites:

You are using a Linux bastion that is supported by Daffy. You can get a bastion through TechZone or following the steps located at https://ibm.github.io/daffy/Supporting-Software/Bastion/. You have Daffy installed on your bastion. The rest of this document assumes that you have both of these.

This tool supports starting at multiple places to meet your end goal of what you want Daffy to build. It can start by building OpenShift or you can bring your credentials for an existing cluster and it will provide details of various things for your environment file to continue to a Cloud Pak or a Service within a cloud pak.  

For more advanced features of this tool, an existing GitHub repository is available and you have a token to login to it.

## Owner/Support
Slack Channel ***#daffy-user-group***

[jimholz@us.ibm.com](mailto:jimholz@us.ibm.com?Subject=Daffy AppStore Help)


## Install Command
```R
/data/daffy/appstore.sh --DaffyCLIConfigurator
```

## Running the tool

The tool by default will be installed in /data/appstore/daffy-cli. It only has one command to use it.
```R
/data/appstore/daffy-cli/create.sh
```

## Other Features

The Daffy CLI Environment Configurator has a few features outside of just running the tool above.
```R
/data/appstore/daffy-cli/create.sh --help
```

To utilize GitHub to store your environment files, you can use these 2 commands
```R
/data/appstore/daffy-cli/create.sh --copytoGitHub
```
```R
/data/appstore/daffy-cli/create.sh --pullfromGitHub
```

To just copy your created environment files to Daffy, can use the following.
```R
/data/appstore/daffy-cli/create.sh --copytoDaffy
```
