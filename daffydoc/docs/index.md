---
#template: home.html
hide:
  - toc
  - navigation
  - footer
---
<script>
  document.title = "Daffy Home";
</script>
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
  .mainPageLeftColumn {
        width: 20%;
  }
  .mainPageRightColumn {
        width: 80%;
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
      <div class='mainPageLeftColumn'>
        <p align = "right">
        </p>
        <button onclick="location.href='Overview/Process/'" class="custom-btn btn-7"><span>Process</span></button>
        <button onclick="location.href='Deploying-OCP/Pre-Req/'" class="custom-btn btn-7"><span>New User</span></button>
        <button onclick="location.href='Deploying-OCP/'" class="custom-btn btn-7"><span>Experienced User</span></button>
      </div>
      <div class='mainPageRightColumn'>
        <p style="margin:0;">
          Daffy is <b>D</b>eployment <b>A</b>utomation <b>F</b>ramework <b>F</b>or <b>Y</b>ou. A tool to do all the heavy lifting of the OpenShift and IBM Cloud Pak installs. The National Market Top Team created Daffy to assist the technical sales teams with the progression of IBM Cloud Pak opportunities. The goal is to provide the technical sales with a set of (easy to use) scripts that will aid in the installation of OpenShift and the IBM Cloud Pak's.
        </p>
        </p>
        <p style="margin:0;">
          Current Version <font color="#FF7C00" >v2023-06-22 </font><a href="release">(Release Notes)</a></font>
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
        Using Daffy IBMers, business partners and customers are onboarded to IBM Cloud Paks in less than a few hours, removing challenges that previously existed when setting up OpenShift.
      </div>
    </div>
  </div>
</div>
<div class="dave-page" markdown='block'>
</div>

!!! Warning "Important"
    ###Daffy scripts were designed to help pre-sales (CTP/BP) with POC deployments. If you choose to use this in a production environment, you may, but it will be the installer's responsibility to support that installation. IBM can not give support for Daffy itself. As it relates to OpenShift and Cloud pak deployments, you can open a ticket with IBM Support. The installer/business partner would need to verify that the environment meets all HA, best practices, management aspects, and security requirements. As this is a scripting engine, you have full access to the logic/code and have ability to make any changes you feel fit. If you do make any changes to the Daffy engine outside of your cluster environment file, you are on your own, and we will not be able to assist with that environment. Please refer to the Production Deployment Guides for the recommended approach when advising customers on how to deploy a Production Ready Environment.
