# SSH Keys
## Setting up the SSH Key
For security purposes, and for ease of use, it is recommended to configure the development machine with a SSH key. Follow the [Pantheon documentation on SSH keys](https://pantheon.io/docs/ssh-keys) to complete this step before connecting to the site via SFTP.  The use of an SSH key allows you to connect to the sites via SFTP and via the Terminal without the use of a password.

## Connecting to the Site via SFTP
When uploading files via SFTP, use the Live environment. In the Pantheon dashboard, locate a specific site and navigate to the Live tab*. Click on the **Connection Info** button, and copy the **Host** and **Username** values under SFTP. Using a client such as [Filezilla](https://filezilla-project.org/), paste the values into the appropriate fields. Be sure to set the protocol to **SFTP** and the port number to `2222`.  For Logon Type, select **Key file** and in the Key file field, set the file path of the SSH key you generated in the previous section. If you didn’t change any defaults, this would be `~/.ssh/id_rsa`

*The Live environment is used for SFTP, as files/databases should not be cloned from Dev or Test into Live except in special situations.