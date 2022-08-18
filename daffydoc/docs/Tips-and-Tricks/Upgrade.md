<script>
  document.title = "Upgrade Daffy";
</script>
##Updating Daffy

There are two ways to update existing daffy. Both process will replace the code of daffy but leave your environment files as is.  It will require you to accept the daffy warranty.
### Upgrade/refresh
1) Run the Refresh script in the daffy home directory

```console
/data/daffy/refresh.sh

```

??? Screenshot
      <img src='../../images/daffyUpgrade1.jpg'   align="top"  style = "float">

### Older version
2) If you want to install older version of daffy.

```console
/data/daffy/refresh.sh --list

```
This will give you a list of older version of daffy to downgrade to:
??? Screenshot
      <img src='../../images/daffyUpgrade2.jpg'   align="top"  style = "float">


!!! Warning
    If you have downgrade to older version of daffy and want to install another older version, you need to first upgrade to the lasted version then downgrade the other version you want. 
