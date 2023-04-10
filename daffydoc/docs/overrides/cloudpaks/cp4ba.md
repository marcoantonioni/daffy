---
hide:
  - footer
---

<script>
  document.title = "Overrides - CP4BA";
</script>
#CP4BA Overrides


## Storage

Based on the platform you delopy to, a default storge will be picked. If you want to override any, just add to your environment file based on names below and new stroage class name that is in the cluster. 

There are 6 storage class variables that are set:

| Variable Name                       |Storage Type  | Info  |
| :---------                          |    :------   |       |
CP4BA_AUTO_STORAGE_CLASS_OCP_BLOCK    | Block Storage| This is **<font color=red>block storage</font>**, NFS is not block storage |
CP4BA_AUTO_STORAGE_CLASS_FAST_ROKS    | File Storage |       |
CP4BA_AUTO_STORAGE_CLASS_OCP          | File Storage |       |
CP4BA_AUTO_STORAGE_CLASS_OCP_SLOW     | File Storage |       |
CP4BA_AUTO_STORAGE_CLASS_OCP_MEDIUM   | File Storage |       |
CP4BA_AUTO_STORAGE_CLASS_OCP_FAST     | File Storage |       |

### ROKS
```R
CP4BA_AUTO_STORAGE_CLASS_FAST_ROKS="ibmc-file-gold-gid"
CP4BA_AUTO_STORAGE_CLASS_OCP="ibmc-file-gold-gid"
CP4BA_AUTO_STORAGE_CLASS_OCP_BLOCK="ibmc-block-gold"
CP4BA_AUTO_STORAGE_CLASS_OCP_SLOW="ibmc-file-bronze-gid"
CP4BA_AUTO_STORAGE_CLASS_OCP_MEDIUM="ibmc-file-silver-gid"
CP4BA_AUTO_STORAGE_CLASS_OCP_FAST="ibmc-file-gold-gid"
```
### ROKS VPC2
```R
CP4BA_AUTO_STORAGE_CLASS_FAST_ROKS="ocs-storagecluster-cephfs"
CP4BA_AUTO_STORAGE_CLASS_OCP="ocs-storagecluster-cephfs"
CP4BA_AUTO_STORAGE_CLASS_OCP_BLOCK="ocs-storagecluster-ceph-rbd"
CP4BA_AUTO_STORAGE_CLASS_OCP_SLOW="ocs-storagecluster-cephfs"
CP4BA_AUTO_STORAGE_CLASS_OCP_MEDIUM="ocs-storagecluster-cephfs"
CP4BA_AUTO_STORAGE_CLASS_OCP_FAST="ocs-storagecluster-cephfs"
```

### ROSA
```R
CP4BA_AUTO_PLATFORM=OCP
CP4BA_AUTO_STORAGE_CLASS_FAST_ROKS="efs-nfs-client"
CP4BA_AUTO_STORAGE_CLASS_OCP="efs-nfs-client"
CP4BA_AUTO_STORAGE_CLASS_OCP_BLOCK="gp3"
CP4BA_AUTO_STORAGE_CLASS_OCP_SLOW="efs-nfs-client"
CP4BA_AUTO_STORAGE_CLASS_OCP_MEDIUM="efs-nfs-client"
CP4BA_AUTO_STORAGE_CLASS_OCP_FAST="efs-nfs-client"
```
### All Others
```R
CP4BA_AUTO_STORAGE_CLASS_OCP="ocs-storagecluster-cephfs"
CP4BA_AUTO_STORAGE_CLASS_OCP_BLOCK="ocs-storagecluster-ceph-rbd"
CP4BA_AUTO_STORAGE_CLASS_OCP_SLOW="ocs-storagecluster-cephfs"
CP4BA_AUTO_STORAGE_CLASS_OCP_MEDIUM="ocs-storagecluster-cephfs"
CP4BA_AUTO_STORAGE_CLASS_OCP_FAST="ocs-storagecluster-cephfs"
```      

## Namespace
A default namespace will be used, but if you want to override it, just update the following variable based on your deployment type and your new name in your environment file

### Starter
```R
CP4BA_AUTO_NAMESPACE_STARTER="cp4ba-starter"
```

### Production
```R
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_NAMESPACE="cp4ba-decisions"
CP4BA_DEPLOYMENT_PRODUCTION_CONTENT_NAMESPACE="cp4ba-content"
CP4BA_DEPLOYMENT_PRODUCTION_WORKFLOW_RUNTIME_NAMESPACE="cp4ba-workflow-runtime"
```

## License
By default, daffy will use a non-production license value during deployment. If you wish to change this, add the following varaible and update based on need to your environment file.

| Variable Name                       |Options  |
| :---------                          |    :------   |
CP4BA_DEPLOYMENT_LICENSE    | non-production or production|

```R
CP4BA_DEPLOYMENT_LICENSE="non-production"
```

## ODM Production

### LDAP Overrides
If you have existing LDAP Server and want to integrate with the ODM production deployment, below are the dafault values you can override to point to a new LDAP Server.  Just add variable name and new value to your environment file.
```R
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_OU="${PROJECT_NAME}"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_TYPE="IBM Security Directory Server"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_SERVER=""
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_PORT="389"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_ADMIN_USER="odmAdmin"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_BIND_SECRET="ldap-bind-secret"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_BASE_DN="ou=${PROJECT_NAME},ou=odm,dc=ibm,dc=com"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_SSL_ENABLED="false"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_SECRET_NAME="ldap-ssl-cert"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_USER_NAME_ATTRIBUTE="*:uid"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_USER_DISPLAY_NAME_ATTR="uid"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_GROUP_BASE_DN="ou=Groups,ou=${PROJECT_NAME},ou=odm,dc=ibm,dc=com"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_GROUP_NAME_ATTRIBUTE="*:cn"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_GROUP_DISPLAY_NAME_ATTR="cn"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_GROUP_MEMBERSHIP_SEARCH_FILTER="(|(\&(objectclass=groupofnames)(member={0}))(\&amp;(objectclass=groupofuniquenames)(uniquemember={0})))"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_GROUP_MEMBER_ID_MAP="groupofnames:member"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_TDS_LC_USER_FILTER="(\&amp;(cn=%v)(objectclass=person))"
CP4BA_DEPLOYMENT_PRODUCTION_DECISIONS_LDAP_TDS_LC_GROUP_FILTER="(\&amp;(cn=%v)(|(objectclass=groupofnames)(objectclass=groupofuniquenames)(objectclass=groupofurls)))"
```
