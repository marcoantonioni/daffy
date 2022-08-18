---
hide:
  - footer
---
<script>
  document.title = "Tools Installed";
</script>
<head>
<style>
* {
  box-sizing: border-box;
}

.row {
  margin-left:-5px;
  margin-right:-5px;
}

.column {
  float: left;
  width: 50%;
  padding: 5px;
}

/* Clearfix (clear floats) */
.row::after {
  content: "";
  clear: both;
  display: table;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  border: 1px solid #ddd;
}

th, td {
  text-align: left;
  padding: 16px;
}

tr:nth-child(even) {
  background-color: #f2f2f2;
}
</style>
</head>

Throughout the Daffy process, it will install all support tools it would need. Depending on the step of Daffy you are running and feature it is using, the tools will be different. If the tool is present already and the correct version, it will not be installed.

<div class="row">
  <div class="column">Core
    <table>
      <tr>
        <th bgcolor="#FF7C00">Tool</th>
        <th bgcolor="#FF7C00">When</th>
      </tr>
      <tr>
        <td>oc</td>
        <td>always</td>
      </tr>
      <tr>
        <td>openshfit-install</td>
        <td>always</td>
      </tr>
      <tr>
        <td>kubectl</td>
        <td>always</td>
      </tr>
      <tr>
        <td>nmon</td>
        <td>always</td>
      </tr>
      <tr>
        <td>curl</td>
        <td>always</td>
      </tr>
      <tr>
        <td>nano</td>
        <td>always</td>
      </tr>
      <tr>
        <td>vim</td>
        <td>always</td>
      </tr>
      <tr>
        <td>tree</td>
        <td>always</td>
      </tr>
      <tr>
        <td>wget</td>
        <td>always</td>
      </tr>
      <tr>
        <td>jq</td>
        <td>always</td>
      </tr>
      <tr>
        <td>dnsutils</td>
        <td>always</td>
      </tr>
      <tr>
        <td>openssh-client</td>
        <td>always</td>
      </tr>
      <tr>
        <td>grepcidr</td>
        <td>always</td>
      </tr>
      <tr>
        <td>nfs-kernel-server</td>
        <td>NFS Option only </td>
      </tr>
      <tr>
        <td>nfs-common</td>
        <td>NFS Option only </td>
      </tr>
    </table>
  </div>
  <div class="column">Cloud CLI
    <table>
      <tr>
        <th bgcolor="#FF7C00">Tool</th>
        <th bgcolor="#FF7C00">When</th>
      </tr>
      <tr>
        <td>awscli</td>
        <td>AWS Install only</td>
      </tr>
      <tr>
        <td>azure-cli </td>
        <td>Azure Install only </td>
      </tr>
      <tr>
        <td>gcloud</td>
        <td>GCP Install only </td>
      </tr>
      <tr>
        <td>cloudctl</td>
        <td>cloudctl Flag</td>
      </tr>
      <tr>
        <td>python2</td>
        <td>cloudctl Flag</td>
      </tr>
      <tr>
        <td>python3</td>
        <td>cloudctl Flag</td>
      </tr>
      <tr>
        <td>pip2</td>
        <td>cloudctl Flag</td>
      </tr>
      <tr>
        <td>pip3</td>
        <td>cloudctl Flag</td>
      </tr>
      <tr>
        <td>ibmcloud</td>
        <td>ROKS & IBM DNS</td>
      </tr>
      <tr>
        <td>ibm-cp-automation </td>
        <td>CP4BA Install Only</td>
      </tr>
      <tr>
        <td>podman</td>
        <td>CP4BA Install</td>
      </tr>
    </table>
  </div>
  <div class="column">VSphere
    <table>
      <tr>
        <th bgcolor="#FF7C00">Tool</th>
        <th bgcolor="#FF7C00">When</th>
      </tr>
      <tr>
        <td>rhcos-4.6.XX-x86_64-vmware.x86_64.ova</td>
        <td>VSphere IPI only</td>
      </tr>
      <tr>
        <td>rhcos-4.7.XX-x86_64-vmware.x86_64.ova </td>
        <td>VSphere IPI only</td>
      </tr>
      <tr>
        <td>rhcos-4.8.XX-x86_64-vmware.x86_64.ova</td>
        <td>VSphere IPI only </td>
      </tr>
      <tr>
        <td>rhcos-4.9.XX-x86_64-vmware.x86_64.ova</td>
        <td>VSphere IPI only </td>
      </tr>
      <tr>
        <td>rhcos-4.10.XX-x86_64-vmware.x86_64.ova</td>
        <td>VSphere IPI only </td>
      </tr>
      <tr>
        <td>govc</td>
        <td>VSphere Install only</td>
      </tr>
    </table>
  </div>
  <div class="column">Airgap
    <table>
      <tr>
        <th bgcolor="#FF7C00">Tool</th>
        <th bgcolor="#FF7C00">When</th>
      </tr>
      <tr>
        <td>mirror-registry</td>
        <td>build local registry only</td>
      </tr>
      <tr>
        <td>rhcos-4.6.XX-x86_64-live.x86_64.iso </td>
        <td>build local registry only</td>
      </tr>
      <tr>
        <td>rhcos-4.7.XX-x86_64-live.x86_64.iso </td>
        <td>build local registry only</td>
      </tr>
      <tr>
        <td>rhcos-4.8.XX-x86_64-live.x86_64.iso </td>
        <td>build local registry only</td>
      </tr>
      <tr>
        <td>rhcos-4.9.XX-x86_64-live.x86_64.iso </td>
        <td>build local registry only</td>
      </tr>
      <tr>
        <td>rhcos-4.10.XX-x86_64-live.x86_64.iso </td>
        <td>build local registry only</td>
      </tr>
    </table>
  </div>
</div>
<div class="row">
  <div class="column">UPI
    <table>
      <tr>
        <th bgcolor="#FF7C00">Tool</th>
        <th bgcolor="#FF7C00">When</th>
      </tr>
      <tr>
        <td>haproxy</td>
        <td>KVM or VSphere install Only</td>
      </tr>
      <tr>
        <td>dnsmasq</td>
        <td>KVM or VSphere install Only</td>
      </tr>
    </table>
  </div>
  <div class="column">KVM
    <table>
      <tr>
        <th bgcolor="#FF7C00">Tool</th>
        <th bgcolor="#FF7C00">When</th>
      </tr>
      <tr>
        <td>lvm2</td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td>bridge-utils</td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td>qemu-kvm</td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td>virtinst</td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td> libvirt-daemon </td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td> virt-manager </td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td> cifs-utils  </td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td>libosinfo-bin  </td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td>uvtool</td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td>matchbox</td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td> rhcos-live-initramfs.x86_64.img </td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td>rhcos-live-kernel-x86_64 </td>
        <td>KVM install Only </td>
      </tr>
      <tr>
        <td>rhcos-live-rootfs.x86_64.img </td>
        <td>KVM install Only </td>
      </tr>
    </table>
  </div>
  <div class="column">KVM Dashboard
    <table>
      <tr>
        <th bgcolor="#FF7C00">Tool</th>
        <th bgcolor="#FF7C00">When</th>
      </tr>
      <tr>
        <td>apache2</td>
        <td>VMDashboard Only</td>
      </tr>
      <tr>
        <td>php</td>
        <td>VMDashboard Only </td>
      </tr>
      <tr>
        <td>libapache2-mod-php </td>
        <td>VMDashboard Only </td>
      </tr>
      <tr>
        <td>php-mysql </td>
        <td>VMDashboard Only </td>
      </tr>
      <tr>
        <td>php-xml </td>
        <td>VMDashboard Only </td>
      </tr>
      <tr>
        <td>php-libvirt-php </td>
        <td>VMDashboard Only </td>
      </tr>
      <tr>
        <td>python </td>
        <td>VMDashboard Only </td>
      </tr>
    </table>
  </div>
  <div class="column">RPA Server
    <table>
      <tr>
        <th bgcolor="#FF7C00">Tool</th>
        <th bgcolor="#FF7C00">When</th>
      </tr>
      <tr>
        <td><a href="https://developers.redhat.com/blog/2020/10/27/using-microsoft-sql-server-on-red-hat-openshift#" target=_blank>mssql2019</a></td>
        <td>RPA Server Only</td>
      </tr>
      <tr>
        <td><a href="https://hub.docker.com/r/bitnami/openldap/" target=_blank>openldap</td>
        <td>RPA Server Only</td>
      </tr>
    </table>
  </div>
  <div class="column">CP4D
    <table>
      <tr>
        <th bgcolor="#FF7C00">Tool</th>
        <th bgcolor="#FF7C00">When</th>
      </tr>
      <tr>
        <td>
        <a href="https://github.com/IBM/cpd-cli/releases" target=_blan>cpd-cli</a></td>
        <td>CP4D 4.5.X</td>
      </tr>
      <tr>
    </table>
  </div>
</div>
