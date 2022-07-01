#Your environment file name must follow simple rules.

All lower case no spaces
Alphanumeric  or - (no special characters)
Must end in -env.sh
Environment name is the prefix for the file name

| Environment Name   | File Name          | Status | Reason |
| :---            |    :----:     |   :----:     |   :----:     |  
| lab12           | /data/daffy/env/lab12-env.sh | VALID | Perfect|
| lab12          | /data/daffy/env/lab12-env | INVALID |Does not end in .sh|
| lab12          |/data/daffy/env/lab12|INVALID |Does not end in -env.sh
| lab12          |/data/daffy/env/Lab 12-env.sh|INVALID |Upper case and Space in name
| lab12          |/data/daffy/env/lab-env.sh|INVALID |Environment name does not match file prefix
| lab12          |/data/daffy/lab12-env.sh|INVALID |Not in the /data/daffy/env folder
