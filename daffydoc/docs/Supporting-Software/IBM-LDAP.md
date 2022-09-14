<script>
  document.title = "Supporting Software - IBM LDAP";
</script>

With the Daffy system you can now install IBM LDAP server on a Linux server.  RHEL 8.x. You will need to size the server based on your needs for the Database.   Below are the steps you would need to get the software, install it and check on the status of the install.

## Obtain Software

Before you install IBM LDAP you will need to download the IBM LDAP Software and place the binary's on your Linux server.

1)   Customer can download the software via the [Passport Advantage](https://%20https//www.ibm.com/software/passportadvantage/pao_customer.html){target=_blank} site.

2)  Tech Sellers can download it from [IBM Internal DSW Downloads](https://w3.ibm.com/software/xl/download/ticket.wss){target=_blank}.

You will need to search for two part numbers **CN487ML** and **CN4VJML** , this is the IBM LDAP Software that will be used during the install.

Once you get the software, you will need to upload it to the Linux server where you plan to install it.

By default, it will need to be in the following location:

**/data/software/ldap**



You can override this base location (/data/software) by overriding it in your environment file.

**SOFTWARE_INSTALLS_DIR=**

## Install LDAP

Installing LDAP needs one new values to your environment file (<**ENVIRONMENT_NAME**>-env.sh).

IDS_VERSION=

With this value, the daffy engine will be able to install the version of IDS(LDAP).


**** The IBM LDAP Software is only supported on IBM RHEL.**

<u>Valid Options:</u>

IDS_VERSION              

**6.4**
```
IDS_VERSION="6.4"
```
```
/data/daffy/ldap/build.sh <ENVIRONMENT_NAME>
```

## Help

There are a few options that the Daffy IBM LDAP installer has to help with install and post install.  To see the options you can run the following command:

```
/data/daffy/ldap/build.sh <ENVIRONMENT_NAME> --help
```
If you need to test is you have correct info to install IBM LDAP on this host,  You can run the following command

```
/data/daffy/ldap/build.sh <ENVIRONMENT_NAME> --precheck
```

If you need to display connect info for IBM LDAP , user name password port, etc.  You can run the following command

```
/data/daffy/ldap/build.sh <ENVIRONMENT_NAME> --console
```
