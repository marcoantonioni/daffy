<script>
  document.title = "Glossary";
</script>
   
# Glossary

## Bastion

A bastion host is a server whose purpose is to provide access to a private/public network from an external/internal network, such as the Internet or private lan. We use this primarily for the install and tempory management of the OpenShift Cluster. The server will have install tools, access to destired openshift cluster network and may be removed post install. 

## Operator catalogs

An Operator catalog is a repository of metadata that Operator Lifecycle Manager (OLM) can query to discover and install Operators and their dependencies on a cluster. OLM always installs Operators from the latest version of a catalog. As of OpenShift Container Platform 4.6, Red Hat-provided catalogs are distributed using index images.

An index image, based on the Operator bundle format, is a containerized snapshot of a catalog. It is an immutable artifact that contains the database of pointers to a set of Operator manifest content. A catalog can reference an index image to source its content for OLM on the cluster.

As catalogs are updated, the latest versions of Operators change, and older versions may be removed or altered. In addition, when OLM runs on an OpenShift Container Platform cluster in a restricted network environment, it is unable to access the catalogs directly from the internet to pull the latest content.

As a cluster administrator, you can create your own custom index image, either based on a Red Hat-provided catalog or from scratch, which can be used to source the catalog content on the cluster. Creating and updating your own index image provides a method for customizing the set of Operators available on the cluster, while also avoiding the aforementioned restricted network environment issues.


## Cloud Pak

IBM Cloud Paks are packaged based on solution domains and harness the combined power of container technology and IBM enterprise expertise to help organizations solve their most pressing challenges:

- IBM Cloud Pak® for Data: Unify cloud storage and simplify the collection, organization and analysis of data.
- IBM Cloud Pak® for Business Automation: Automate business operations to achieve better performance.
- IBM Cloud Pak® for Watson AIOps: Place AI at the core of your IT operations tool chain. Automate operations management decisions while resolving real-world operations management scenarios to deliver actionable insights.
- IBM Cloud Pak® for Integration: Automate application and data flows to improve client experiences. Connect your applications and data wherever they live. Get new tools for automated integrations based on APIs that extend capability and modernize flexibility for ongoing adaption.
- IBM Cloud Pak® for Security: Generate deeper insights into threats, and orchestrate actions for scalability and automated responses.
- IBM Cloud Pak® for Network Automation: Automate networks to deliver zero-touch operations.

## Cloud Provider

A cloud service provider is a third-party company offering a cloud-based platform, infrastructure, application, or storage services. Much like a homeowner would pay for a utility such as electricity or gas, companies typically have to pay only for the amount of cloud services they use, as business demands require.

Besides the pay-per-use model, cloud service providers also give companies a wide range of benefits. Businesses can take advantage of scalability and flexibility by not being limited to physical constraints of on-premises servers, the reliability of multiple data centers with multiple redundancies, customization by configuring servers to your preferences, and responsive load balancing that can easily respond to changing demands. Though businesses should also evaluate security considerations of storing information in the cloud to ensure industry-recommended access and compliance management configurations and practices are enacted and met.

## Cluster

Multiple computing nodes or hosts that work together to support an application or middleware such as a database. A cluster is a group of inter-connected computers or hosts that work together to support applications and middleware (e.g. databases).  In a cluster, each computer is referred to as a “node”. Unlike grid computers, where each node performs a different task, computer clusters assign the same task to each node. Nodes in a cluster are usually connected to each other through high-speed local area networks. Each node runs its own instance of an operating system. A computer cluster may range from a simple two-node system connecting two personal computers to a supercomputer with a cluster architecture. Computer clusters are often used for cost-effective high-performance computing (HPC) and high availability (HA). If a single component fails in a computer cluster, the other nodes continue to provide uninterrupted processing.  A computer cluster can provide faster processing speed, larger storage capacity, better data integrity, greater reliability and wider availability of resources. Computer clusters are usually dedicated to specific functions, such as load balancing, high availability, high performance or large-scale processing.

## Control Plane

In network routing, the control plane is the part of the router architecture that is concerned with drawing the network topology, or the information in a routing table that defines what to do with incoming packets. Control plane functions, such as participating in routing protocols, run in the architectural control element.[1] In most cases, the routing table contains a list of destination addresses and the outgoing interface(s) associated with each. Control plane logic also can identify certain packets to be discarded, as well as preferential treatment of certain packets for which a high quality of service is defined by such mechanisms as differentiated services.

Depending on the specific router implementation, there may be a separate forwarding information base that is populated by the control plane, but used by the high-speed forwarding plane to look up packets and decide how to handle them.

In computing, the control plane is the part of the software that configures and shuts down the data plane.[2] By contrast, the data plane is the part of the software that processes the data requests.[3] The data plane is also sometimes referred to as the forwarding plane.

The distinction has proven useful in the networking field where it originated, as it separates the concerns: the data plane is optimized for speed of processing, and for simplicity and regularity. The control plane is optimized for customizability, handling policies, handling exceptional situations, and in general facilitating and simplifying the data plane processing.[4] [5]

The conceptual separation of the data plane from the control plane has been done for years.[6] An early example is Unix, where the basic file operations are open, close for the control plane and read write for the data plane.[7]

[Control Plane](https://en.wikipedia.org/wiki/Control_planes){target=_blank}


## Domain Name System (DNS)

The Domain Name System (DNS) is the hierarchical and decentralized naming system used to identify computers, servr ices, and other resources reachable through the Internet or other Internet Protocol (IP) networks. The resource records contained in the DNS associate domain names with other forms of information. These are most commonly used to map human-friendly domain names to the numerical IP addresses computers need to locate services and devices using the underlying network protocols, but have been extended over time to perform many other functions as well.

- In a nutshell, its a system where your local computer can call other computers on the internet to translate a website name to a computer IP address.  Think of it as the internet phone book.

[Domain Name System](https://en.wikipedia.org/wiki/Domain_Name_System){target=_blank}


## DNS Registrar/Registry

A domain name **registrar** is a company that manages the reservation of Internet domain names. A domain name registrar must be accredited by a generic top-level domain (gTLD) registry or a country code top-level domain (ccTLD) registry. A registrar operates in accordance with the guidelines of the designated domain name registries.

- In a nutshell, its a company where you can buy and register a website name.   Like **"mywebsite.com"** You would now own that name and can have that name redirected to any computer IP address.

A domain name **registry** is a database of all domain names and the associated registrant information in the top level domains of the Domain Name System (DNS) of the Internet that enables third party entities to request administrative control of a domain name. Most registries operate on the top-level and second-level of the DNS.

- In a nutshell, its where website names are stored and has a mapping from name to IP Address.   Like **"www.mywebsite.com"** points to 169.45.45.55


[Domain Name Registrar](https://en.wikipedia.org/wiki/Domain_name_registrar){target=_blank}


## Enviornment Name/File

You may see reference to **<ENVIRONMENT_NAME>**,  this is what you name your environment and the base name of the file to store your details for that environment.

Example  **gamm01**-env.sh is your file where **gamma01** is your **<ENVIRONMENT_NAME>**

Best practice, but not required, is to name your environment the same as your cluster as this is the core of your environment.

## Ingress Operator

The Ingress Operator makes it possible for external clients to access your service by deploying and managing one or more HAProxy-based Ingress Controllers to handle routing. You can use the Ingress Operator to route traffic by specifying OpenShift Container Platform Route and Kubernetes Ingress resources. Configurations within the Ingress Controller, such as the ability to define endpointPublishingStrategy type and internal load balancing, provide ways to publish Ingress Controller endpoints.

- In a nutshell, it allows external access to your cluster and all the running pods/services/applications. Its basically an inbound router for your OpenShift Cluster.

[Ingress Operator](https://docs.openshift.com/container-platform/4.10/networking/ingress-operator.html){target=_blank}


## Install Type UPI

User-provisioned Infrastructure (UPI) provides the ablith to deploy the Openshift container platform (OCP) on existing infrastuure that you created. The user, will create the VMs, networks, loadbalancer, etc.  You must create all require infrastrue before you can start the openshift install process.  Most users use terraform to build these resources.  

With Daffy, we call it a UPI, but daffy is the user in the perspective.  Daffy will build all the infrastrure components for you.  From the user point of view, with daffy, this performs like an IPI install. 


## Install Type IPI

Installer-provisioned Infrastructure (IPI) provides a full-stack installation and setup of the Openshift container platform (OCP). It creates Bootstrapping node which will take care deploying the cluster. It will create the VMs, networks, loadbalancer, etc.  It creates all require infrastrue during the install for you. With he corrent promission on the provider, this the easiest install.

## Instal Type MSP

Daffy coined this acronym. Managed Service Provider(MSP).  This is when a provider does the heavy lifting of install of Openshift container platform (OCP) and also the management of the running cluster. This includes ROSA(AWS), ROKS(IBM) and ARO(Azure). Daffy will call the exposed API from the provider to provision the cluster for you. 

## Master Node

The master node is responsible for running several Kubernetes processes that are absolutely necessary to run and manage the cluster properly:

- API Server: This is essentially the entry-point to the Kubernates cluster, which itself is a container. This is the process that allows communication between different Kubernetes clients and the cluster. The clients include the UI, if we are using the Kubernetes Dashboard, the API if we are running scripts, or the command-line tool. All these clients talk to the API Server to interact with the cluster.

- Controller Manager: This keeps track of the state of the cluster. It keeps an eye on the cluster and checks whether a node needs to be repaired or restarted.

- Scheduler: Scheduler ensures proper pod placement on the worker nodes based on several factors such as the available resources and the current load on the cluster.

- etcd: This is the key-value storage responsible for holding the state of the cluster at any given time. etcd has the configuration information and status data of each node in the cluster. etcd snapshots allow us to recover the whole cluster state, hence it is used in backing up and restoring a cluster.

## Namespace

What is a namespace in OpenShift?
Namespaces. A Kubernetes namespace provides a mechanism to scope resources in a cluster. In OpenShift Online, a project is a Kubernetes namespace with additional annotations. Namespaces provide a unique scope for: Named resources to avoid basic naming collisions.

[Referance](https://docs.openshift.com/online/pro/architecture/core_concepts/projects_and_users.html#namespaces){target=_blank}

## Node

A node is a virtual or bare-metal machine in a Kubernetes cluster. Worker nodes host your application containers, grouped as pods. The control plane nodes run services that are required to control the Kubernetes cluster. In OpenShift Container Platform, the control plane nodes contain more than just the Kubernetes services for managing the OpenShift Container Platform cluster.

[Referance](https://docs.openshift.com/container-platform/4.10/nodes/index.html#nodes-overview){target=_blank}


## Operator

Red Hat® OpenShift® Operators automate the creation, configuration, and management of instances of Kubernetes-native applications. Operators provide automation at every level of the stack—from managing the parts that make up the platform all the way to applications that are provided as a managed service.

[Referance](https://www.redhat.com/en/technologies/cloud-computing/openshift/what-are-openshift-operators){target=_blank}


## Pod

Pods are the smallest deployable units of computing that you can create and manage in Kubernetes.

A Pod (as in a pod of whales or pea pod) is a group of one or more containers, with shared storage and network resources, and a specification for how to run the containers. A Pod's contents are always co-located and co-scheduled, and run in a shared context. A Pod models an application-specific "logical host" it contains one or more application containers which are relatively tightly coupled. In non-cloud contexts, applications executed on the same physical or virtual machine are analogous to cloud applications executed on the same logical host.

As well as application containers, a Pod can contain init containers that run during Pod startup. You can also inject ephemeral containers for debugging if your cluster offers this.

## Service

A Kubernetes service serves as an internal load balancer. It identifies a set of replicated pods in order to proxy the connections it receives to them. Backing pods can be added to or removed from a service arbitrarily while the service remains consistently available, enabling anything that depends on the service to refer to it at a consistent address. The default service clusterIP addresses are from the OpenShift Online internal network and they are used to permit pods to access each other.

[Referance](https://docs.openshift.com/online/pro/architecture/core_concepts/pods_and_services.html#services){target=_blank}

## Subscription

With OpenShift, you need to have a subscription to deploy and run the cluster. This subscription is tied to a billing account for Yearly bililng and payment.  You cluster is tied to the subscription via the pull secret that is stored in the cluster.  At installed time you supplied this but can change this post install at anytime.


## Storage Class

A StorageClass provides a way for administrators to describe the "classes" of storage they offer. Different classes might map to quality-of-service levels, or to backup policies, or to arbitrary policies determined by the cluster administrators. Kubernetes itself is unopinionated about what classes represent. This concept is sometimes called "profiles" in other storage systems.

## Worker Node

The worker nodes are the part of the Kubernetes clusters which actually execute the containers and applications on them. They have two main components, the Kubelet Service and the Kube-proxy Service.

- Kubelet Service: Each worker node has a Kubelet process running on it that allows the cluster to talk to each other and execute some tasks on the worker nodes, such as running application processes. It listens for instructions from the Api Server and manages containers running on the node.

- Kube-proxy Service: The Kube-Proxy Service is responsible for enabling communication between services within the cluster.

These worker nodes have docker containers for each application running on them. There may be a different number of containers running on each node depending on the distribution of the workload.

Worker nodes are generally more powerful than master nodes because they have to run hundreds of clusters on them. However, master nodes hold more significance because they manage the distribution of workload and the state of the cluster.
