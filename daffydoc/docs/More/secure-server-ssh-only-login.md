
# Enable SSH Key ONLY Login - Disable Password 
It is highly recommended that you disable passwword login for root access and ONLY allow login with ssh key. To do that follow these steps. 


!!! warning
	As a recommmendation, it is advised that you have a second session open while you are making these chagnes. Once you enable the above changes you will no longer be able to log into the server using passwords. If your ssh key configuration is not corrrect, you will not be able to log in. Leave the second session open until you verify that you can in fact log in with your ssh key.  

## Setup SSH
create new authorized_keys file 

	 mkdir -p /root/.ssh
	 touch authorized_keys

verify you can log in with your ssh key

## Edit the ssh configuration
Edit the ssh configuratioh file
	  
	 vim /etc/ssh/sshd_config

Modify these to values.
	  
	  ChallengeResponseAuthentication no
     PasswordAuthentication no

## Reload the SSH Config
Execute the reload command to enable the changes. 
     
     /etc/init.d/ssh reload
 
    