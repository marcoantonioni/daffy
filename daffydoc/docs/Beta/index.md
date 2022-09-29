---
hide:
  - footer
---
<script>
  document.title = "Beta";
</script>
#Active Beta Features
!!! Warning   
      Early features - Still in testing mode, may not always work.  User be aware!!!


To get the beta version of Daffy, run the following command on your bastion:
```
curl http://get.daffy-installer.com/download-scripts/daffy-beta-init.sh | bash
```

!!! Warning   
      Please do not share above with others

We update the beta code nightly. If you have the beta versions, you can run this command to get the daily updates to the beta code of daffy:
```
/data/daffy/refresh-beta.sh
```

If you want to switch back to the production of the daffy code, you can run this:
```
/data/daffy/refresh.sh
```

<html>
<body>
<div style="text-align:center">
<button onclick="location.href='./Turbo/'" class="custom-btn btn-7">Turbo</button>
<button onclick="location.href='./IBM/'" class="custom-btn btn-7">IBM IPI</button>
</body>
</html>