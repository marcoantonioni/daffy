---
hide:
  - footer
---

#Cloud Paks

<html>
<body>
<div style="text-align:center">
<button onclick="location.href='./Business-Automation/'" class="custom-btn btn-7">Business Automation</button>
<button onclick="location.href='./Data/'" class="custom-btn btn-7">Data</button>
<button onclick="location.href='./Integration/'" class="custom-btn btn-7">Integration</button>
<button onclick="location.href='./Watson-AIOPS/'" class="custom-btn btn-7">
Watson AIOps</button>
<div></div>
<button onclick="location.href='WebSphere-Automation/'" class="custom-btn btn-7">
WebSphere Automation</button>

</div>
</body>
</html>

<style>

.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
button {
  margin: 5px;
}
.custom-btn {
  width: 200px;
  height: 50px;
  color: black;
  border-radius: 10px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}

/* 7 */
.btn-7 {
background: linear-gradient(0deg, rgba(255,151,0,1) 0%, rgba(251,75,2,1) 100%);
  line-height: 42px;
  padding: 0;
  border: none;
}
.btn-7 span {
  position: relative;
  display: block;
  width: 100%;
  height: 100%;
}
.btn-7:before,
.btn-7:after {
  position: absolute;
  content: "";
  right: 0;
  bottom: 0;
  background: rgba(251,75,2,1);
  box-shadow:
   -7px -7px 20px 0px rgba(255,255,255,.9),
   -4px -4px 5px 0px rgba(255,255,255,.9),
   7px 7px 20px 0px rgba(0,0,0,.2),
   4px 4px 5px 0px rgba(0,0,0,.3);
  transition: all 0.3s ease;
}
.btn-7:before{
   height: 0%;
   width: 2px;
}
.btn-7:after {
  width: 0%;
  height: 2px;
}
.btn-7:hover{
  color: rgba(251,75,2,1);
  background: transparent;
}
.btn-7:hover:before {
  height: 100%;
}
.btn-7:hover:after {
  width: 100%;
}
.btn-7 span:before,
.btn-7 span:after {
  position: absolute;
  content: "";
  left: 0;
  top: 0;
  background: rgba(251,75,2,1);
  box-shadow:
   -7px -7px 20px 0px rgba(255,255,255,.9),
   -4px -4px 5px 0px rgba(255,255,255,.9),
   7px 7px 20px 0px rgba(0,0,0,.2),
   4px 4px 5px 0px rgba(0,0,0,.3);
  transition: all 0.3s ease;
}
.btn-7 span:before {
  width: 2px;
  height: 0%;
}
.btn-7 span:after {
  height: 2px;
  width: 0%;
}
.btn-7 span:hover:before {
  height: 100%;
}
.btn-7 span:hover:after {
  width: 100%;
}
}
</style>
## What is required to deploy a Cloud Pak?

Before you can deploy a cloud pak, you must have the following:

###  You must have a cluster running    
- An existing cluster in a supported provider
- Can be build with daffy or any other process  
###  IBM entitlement key   
- You can obtain your existing entitlement key here:
- [https://myibm.ibm.com/products-services/containerlibrary](https://myibm.ibm.com/products-services/containerlibrary)

Important: If your installing on a customer owned platform account or an on-prem customer datacenter, you **`MUST`** instruct your customer to register for a trial account and use their pull secret for the install if they don't own the software. Do not use your own pull secret for customer engagements.

NOTE: All IBMer's are entitled to an IBM Entitlement Key. Your key can **`ONLY`** be used for training and demo purposes. Do not provide your personal entitlement key to customers.

******If customer or business partner does not have an IBM entitlement key, go to the following link to get one(IBM Internal Link)

 [IBM Trial Software Process ](https://ibm.seismic.com/Link/Content/DC82Wc9PpPqf68MHHTjBpVC84RBB)
