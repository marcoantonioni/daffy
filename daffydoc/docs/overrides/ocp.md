---
hide:
  - footer
---

<script>
  document.title = "Overrides - OpenShift";
</script>
## Worker Node Sizing
Default values are based on TShirt Sizing.

To override the default number of workers, just add the value you want to build in your environment file.


| Variable Name               |  Install Type           |  Default Value | Valid Options  |
| :---------                  |  :----                  |  :----         |  :----         |  
| VM_NUMBER_OF_WORKERS_MIN    | VM_TSHIRT_SIZE="<font color=red>**Min**</font>"    |  3             |  any Number    |
| VM_NUMBER_OF_WORKERS_LARGE  | VM_TSHIRT_SIZE="<font color=red>**Large**</font>"  |  3(+3 if ODF true)             |  any Number    |

```R
#VM_NUMBER_OF_WORKERS_MIN="4"
VM_NUMBER_OF_WORKERS_LARGE="8"
```

## Master Node Sizing
Default values are based on TShirt Sizing.

To override the default number of masters, just add the value you want to build in your environment file.


| Variable Name               |  Install Type           |  Default Value | Valid Options  |
| :---------                  |  :----                  |  :----         |  :----         |  
| VM_NUMBER_OF_MASTERS_MIN    | VM_TSHIRT_SIZE="<font color=red>**Min**</font>"    |  3             |  any Number    |
| VM_NUMBER_OF_MASTERS_LARGE  | VM_TSHIRT_SIZE="<font color=red>**Large**</font>"  |  3             |  any Number    |

```R
#VM_NUMBER_OF_MASTERS_MIN="1"
VM_NUMBER_OF_MASTERS_LARGE="4"
```

## Masters Schedulable
This will tell the cluster if you want the master nodes to preform workload.  Should it be
considered part of the other worker nodes.

| Variable Name               |  Default Value | Valid Options  |
| :---------                  |  :----         |  :----         |  
| OCP_MASTER_NODES_SCHEDULABLE|  false         |  true/false    |

```R
OCP_MASTER_NODES_SCHEDULABLE="true"
```
## TShirt Sizing
If you want to see what the current TShirt sizing is or what values you can override in your env file, just run the following command. It will show you current values and the names you can override in your file.

```R
/data/daffy/ocp/build.sh <env_name> --tshirtSize
```

Example of GCP:

```R
Current T-Shirt Sizing Info
################################################################
Setting VM T-Shirt Size to Large
Google Cloud Platform:
Bootstrap Node type = n1-standard-2
GCP_MACHINE_TYPE_BOOTSTRAP_CPU_LARGE="2"

Master Nodes:
--------------------------------------------------
GCP_MACHINE_TYPE_MASTER_LARGE="n1-standard-8"
VM_NUMBER_OF_MASTERS_LARGE="3"
GCP_MACHINE_TYPE_MASTER_CPU_LARGE="8"

Worker Nodes:
--------------------------------------------------
GCP_MACHINE_TYPE_WORKER_LARGE="n1-standard-16"
VM_NUMBER_OF_WORKERS_LARGE="6"
GCP_MACHINE_TYPE_WORKER_CPU_LARGE="16"

OpenShift Storage Cluster Storage(Block):
--------------------------------------------------
VM_WORKER_DISK2_LARGE="50G"

OpenShift Storage Cluster Storage(Block):
--------------------------------------------------
VM_WORKER_DISK3_LARGE="200G"
```
