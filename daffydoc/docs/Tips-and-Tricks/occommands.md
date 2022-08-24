<script>
  document.title = "OC Commands";
</script>
##Get Login token

At certain parts of the install of cloud paks, you may need to get a login token and give to daffy.  This will show you how to do this.

1) Login to our cluster UI
??? Info "Screenshot"

    <img src='../images/oclogin-0.jpg'   align="top" style = "float">

2) Top right of your screen, select the drop down menu for your user
??? Info "Screenshot"

    <img src='../images/oclogin-1.jpg'   align="top" style = "float">

3) From the menu, select the "Copy login command"
??? Info "Screenshot"

    <img src='../images/oclogin-2.jpg'   align="top" style = "float">

4) This will open a new browser tab, click the "Display Token" link
??? Info "Screenshot"

    <img src='../images/oclogin-3.jpg'   align="top" style = "float">    

5) It will now show the token command.  copy the **oc** login section only
??? Info "Screenshot"

    <img src='../images/oclogin-4.jpg'   align="top" style = "float">    

6) Once you copied the oc command, go back to your bastion and past it into terminal console. You will see a successful login after the command.
??? Info "Screenshot"

    <img src='../images/oclogin-5.jpg'   align="top" style = "float">   
##Get Cluster Name

Sometimes you will use existing cluster for daffy, but daffy still needs to match your cluster name in the environment file with your runtime. There is an oc command that will display your cluster name.

```R
oc describe infrastructure/cluster | grep "Infrastructure Name"
```
##Get Worker Nodes

Daffy will require your environment file to match your runtime environment. One area it checks is the number of worker nodes you have.  They must match.  Here is a command you can run to get the your worker nodes for your running cluster
```R
oc get nodes | grep "worker"
```
