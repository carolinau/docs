# Updating Catalogs
Applies to:
- [leadership.piedmontu.edu](https://leadership.piedmontu.edu)
- [education.piedmontu.edu](https://education.piedmontu.edu)
- [business.piedmontu.edu](https://business.piedmontu.edu)
- [sas.piedmontu.edu](https://sas.piedmontu.edu)
- [seminary.piedmontu.edu](https://seminary.piedmontu.edu)

The catalogs are stored in `~/files/catalog/`. Due to the nature of linking to the specific pages from the catalogs from all the Program Courses page, the file cannot be uploaded via the Drupal UI. Instead, new catalog revisions must be uploaded to each microsite via FTP.

## Setting up the SSH Key
For security purposes, and for ease of use, it is recommended to configure the development machine with a SSH key. Follow the [Pantheon documentation on SSH keys](https://pantheon.io/docs/ssh-keys) to complete this step before connecting to the site via SFTP. 

## Connecting to the Site via SFTP
When uploading files via SFTP, use the Live environment. In the Pantheon dashboard, locate a specific site and navigate to the Live tab. Click on the **Connection Info** button, and copy the **Host** and **Username** values under SFTP. Using a client such as [Filezilla](https://filezilla-project.org/), paste the values into the appropriate fields. Be sure to set the protocol to **SFTP** and the port number to `2222`.  For Logon Type, select **Key file** and in the Key file field, set the path of the SSH key you generated in the previous section.

## Uploading the Catalog Files
Once connected to the site, navigate to the `~/files/catalog`. Locate the new catalogs on your computer, and *make certain* that the file names of the catalogs on your computer are identical to the files on the server. Do not change the file names of the catalogs on the server; otherwise the links on the program courses pages will break.

Once confirming that the files are same, simply upload the files to the server and ensure that you overwrite what is on the server.