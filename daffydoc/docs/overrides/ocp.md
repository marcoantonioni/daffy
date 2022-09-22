<script>
  document.title = "Overrides - OpenShift";
</script>
## Worker Node Sizing
Default values are based on TShirt Sizing.

To override the default number of workers, just add the value you want to build in your environment file.


| Variable Name               |  Install Type           |  Default Value | Valid Options  |
| :---------                  |  :----                  |  :----         |  :----         |  
| VM_NUMBER_OF_WORKERS_MIN    | VM_TSHIRT_SIZE="Min"    |  3             |  any Number    |
| VM_NUMBER_OF_WORKERS_LARGE  | VM_TSHIRT_SIZE="Large"  |  6             |  any Number    |

```R
VM_NUMBER_OF_WORKERS_LARGE="8"
```

## Master Node Sizing
Default values are based on TShirt Sizing.

To override the default number of masters, just add the value you want to build in your environment file.


| Variable Name               |  Default Value | Valid Options  |
| :---------                  |  :----         |  :----         |  
| VM_NUMBER_OF_MASTERS_MIN    |  3             |  any Number    |
| VM_NUMBER_OF_MASTERS_LARGE  |  3             |  any Number    |

```R
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
