---
hide:
  - footer
---
<script>
  document.title = "Security - BETA";
</script>
#Security

<html>
<body>
<div style="text-align:center">
<button onclick="location.href='./IBMSecretsManager/'" class="custom-btn btn-7">IBM Secrets Manager</button>
<button onclick="location.href='./SSLCertificates/'" class="custom-btn btn-7">SSL Certificates</button>
</div>
</body>
</html>

## Overview

Trusted certificates can be used to create secure connections to a server via the Internet. A certificate is essential in order to circumvent a malicious party which happens to be on the route to a target server which acts as if it were the target. Such a scenario is commonly referred to as a man-in-the-middle attack. The client uses the CA certificate to authenticate the CA signature on the server certificate, as part of the authorizations before launching a secure connection. Usually, client software—for example, browsers—include a set of trusted CA certificates. This makes sense, as many users need to trust their client software. A malicious or compromised client can skip any security check and still fool its users into believing otherwise.

#   Useful Links
- [SSL Certificates](https://en.wikipedia.org/wiki/Certificate_authority){target=_blank}
- [IBM Secrets Manager](https://cloud.ibm.com/docs/secrets-manager?topic=secrets-manager-getting-started){target=_blank}
