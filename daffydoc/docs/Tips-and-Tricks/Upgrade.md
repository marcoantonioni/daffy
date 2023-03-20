<script>
  document.title = "Upgrade Daffy";
</script>
##Updating Daffy

There are two ways to update existing daffy. Both process will replace the code of daffy but leave your environment files as is.  It will require you to accept the daffy warranty.


### Upgrade
1) Run the Refresh script in the daffy home directory

```console
/data/daffy/refresh.sh

```

??? Screenshot
      <img src='../../images/tips/daffyUpgrade1.jpg'   align="top"  style = "float">

### Downgrade
2) If you want to install older version of daffy from existing installed daffy:

```console
/data/daffy/refresh.sh --list

```
This will give you a list of older version of daffy to downgrade to:
??? Screenshot
      <img src='../../images/tips/daffyUpgrade2.jpg'   align="top"  style = "float">


!!! Warning
    If you have downgrade to older version of daffy and want to install another older version, you need to first upgrade to the lasted version then downgrade the other version you want.

## Install Older
If you want to install an older version from the begining, you can with this command:

```console
curl http://get.daffy-installer.com/download-scripts/daffy-init.sh | sudo -E bash -s -- v2023-01-11.tar
```
??? note "Version name format"
    Just supply the name of the tar version you want to install.

    Format  <font color="orange">v</font><font color="blue">${YEAR}</font><font color="red">-${MONTH}</font><font color="green">-${DAY}</font>.tar </font>

