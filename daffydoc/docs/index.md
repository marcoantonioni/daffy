---
#template: home.html
title: Deployment Automation Framework For You
hide:
  - toc
  - navigation
  - footer
---

<style>
  [dir="ltr"] .md-sidebar--primary:not([hidden]) ~ .md-content > .md-content__inner { margin-left: 0;}

  :root >* {
    --md-default-bg-color: #161616; /* background */
    --md-primary-bg-color: #fff; /* Title bar text */
    --md-typeset-a-color: #aaa; /* Additional header text */
    --md-typeset-color: #fff; /* nav text normal */
    --md-accent-fg-color: #392fa4; /* text hover + highlight*/
    --md-default-fg-color--lighter: #33f; /* Nav scroll bar */
    --md-primary-bg-color--light: #fff; /* Search bar text */
    --md-default-fg-color: #fff; /* Search result box section header */
    --md-default-fg-color--light: #eee; /* Search box result text */

  }

  div.md-source-file {color: black; margin-left: 1rem;}
</style>

<div class="home-hero" style="margin:0 !!important">
  <div class="home-hero-text">
    <h1 style="display: inline"></h1>
  </div>
  <div class="home-hero-image"></div>

  <div class=home-description>
    <div class='row'>
      <div class='column'>
        <p align = "right">
          <img src='./images/ducks.png'  align="left" width="200"
          height="100" style = "float">
        </p>
        <button onclick="location.href='Deploying-OCP/Pre-Req/'" class="custom-btn btn-7"><span>New User</span></button>
        <button onclick="location.href='Deploying-OCP/'" class="custom-btn btn-7"><span>Experienced User</span></button>
      </div>

      <div class='column'>
        <p style="margin:0;">
          Daffy is <b>D</b>eployment <b>A</b>utomation <b>F</b>ramework <b>F</b>or <b>Y</b>ou. A tool to do all the heavy lifting of the OpenShift and IBM Cloud Pak installs. The National Market Top Team created Daffy to assist the technical sales teams with the progression of IBM Cloud Pak opportunities. The goal is to provide the technical sales with a set of (easy to use) scripts that will aid in the installation of OpenShift and the IBM Cloud Pak's.
        </p>
      </div>
    </div>
  </div>
  <div class='home-purpose'>
    <div class='row'>
      <div class='column'>
        Fit for purpose
      </div>
      <div class='column'>
        Using Daffy IBMers, business partners and customers are onboarded to IBM Cloud Pak's in less than a few hours, removing challenges that previously existing setting up OpenShift.
      </div>
    </div>
  </div>
</div>

<div class="dave-page" markdown='block'>

</div>

<style>

.frame {
  width: 90%;
  margin: 40px auto;
  text-align: left;
}
button {
  margin: 5px;
}
.custom-btn {
  width: 200px;
  height: 40px;
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


!!! Warning "Important"
    ###Daffy scripts were designed to help pre-sales(CTP/BP) with POC deployments. If you choose to use this in a production environment, you may, but it will be on the installer for support of that installation.  IBM can not give support for daffy itself. As it relates to OpenShift and Cloud pak deployments, you can open ticket with IBM Support. The installer/business partner would need to verify  the environment that it meets all HA , best practices, management aspects and security requirements. As this is a scripting engine, you have full access to the logic/code and have ability to make any changes you feel fit. If you do make any changes to the daffy engine outside of your cluster environment file, you are on your own, we will not be able to assistant with that environment.  Please Refer to the Production Deployment Guides for the recommended approach when advising customers on how to deploy a Production Ready Environment.
