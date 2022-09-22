<script>
  document.title = "Overrides - Daffy";
</script>
## General

### DEBUG
If set to true, this will tell the daffy system to stop at the beginning of each major section of the process.  It will allow you to view each step before it executes.  You will have to hit any key on your keyboard to continue each step.  If not set in your environment file or set to any other value the true, it will disable debug. This is great option for your first install to slowly go thru each step to understand what the daffy process is doing.

!!! Info
    <font color=red>Must be all lower case <b>true</b></font>

| Variable Name   |  Default Value | Valid Options  |
| :---------      |  :----         |  :----         |  
| DEBUG           |  false         |  true or false |

```R
DEBUG="true"
```
