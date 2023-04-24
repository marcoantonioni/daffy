<script>
  document.title = "Supporting Software - DB2";
</script>
With the Daffy system you can now install DB2 on a Linux server - **RHEL 8.x.** You will need to size the server based on your needs for the Database.   Below are the steps you would need to get the software, install it and check on the status of the install.


## Obtain Software

Before you install DB2, you will need to download the DB2 Software and place the binary's on your Linux server.

1)   Customer can download the software via the [Passport Advantage](https://%20https//www.ibm.com/software/passportadvantage/pao_customer.html){target=_blank} site.

2)  Tech Sellers can download it from [IBM Internal DSW Downloads](https://w3.ibm.com/software/xl/download/ticket.wss){target=_blank}.



You will need to search for the part number **CC1U0ML**, this is the DB2 Software that will be used during the install.

Once you get the software, you will need to upload it to the Linux server where you plan to install it.

By default, it will need to be in the following location:

**/data/software/db2**



You can override this base location (**/data/software**) by overriding it in your environment file.

**SOFTWARE_INSTALLS_DIR=**

## Install DB2

Installing DB2 needs one new values to your environment file (<**ENVIRONMENT_NAME**>-env.sh).

DB2_VERSION

With this value, the daffy engine will be able to install the version of DB2.

<u>Valid Options:</u>

DB2_VERSION:
**11.5**

```
DB2_VERSION="11.5"
```

Once you have the requires values in your environment file and the sofware was placed on the Linux server, you are ready to kick off the install.  Below is the command to kick off the install.  The process should take approx 10 min to install.

```
/data/daffy/db2/build.sh <ENVIRONMENT_NAME>
```
## Help
There are a few options that the Daffy DB2 installer has to help with install and post install.  To see the options you can run the following command:

```
/data/daffy/db2/build.sh <ENVIRONMENT_NAME> --help
```
If you need to test is you have correct info to install DB2 on this host,  You can run the following command

```
/data/daffy/db2/build.sh <ENVIRONMENT_NAME> --precheck
```
If you need to display connect info for DB2, user name password port, etc.  You can run the following command
```
/data/daffy/db2/build.sh <ENVIRONMENT_NAME> --console
```
