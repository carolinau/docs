# Updating Courses from the Catalog
?> Applies to [catalog.piedmontu.edu](https://catalog.piedmontu.edu)

## Process
### SQL Server
Run the following SQL SELECT statement on the primary Jenzabar database to get the contents of the CATALOG_MASTER table in the necessary format:

```
SELECT RTRIM(CRS_CDE) AS CRS_CDE, CONCAT(CRS_TITLE,CRS_TITLE_2) AS CRS_TITLE, DFLT_CREDIT_HRS, LECTURE_LAB_HRS,
CASE WHEN CATALOG_TEXT IS NULL THEN 'No course description found.' ELSE CATALOG_TEXT END AS CATALOG_TEXT
FROM CATALOG_MASTER
WHERE ACTIVE_INACTIVE_ST='A' AND ORG_CDE='*LOCAL'
```

Select all the contents, right click and select “Save Results As…” and save the file as `catalog_master.csv`

Once saved, copy the file locally to your desktop.

### Upload File via SFTP to Website
Open your desired FTP client, such as [FileZilla](https://filezilla-project.org/) on your development machine. Connect to the Catalog website using the SFTP connection information found on the Pantheon Dashboard.

In the remote directory, navigate to `files > csv`. Upload the new *catalog_master.csv* from your machine to the server, making sure to overwrite the file on the server.

### Run Migration
In the Drupal Admin UI, navigate to [Manage > Structure > Migrations](https://catalog.piedmontu.edu/admin/structure/migrate). Click on *List migrations* within the *Courses* migration group. Select *Execute* within the *Import courses* migration task.

For the operation, make sure *Import* is selected. Then, expand the *Additional Execution Options* section and check the *Update* box to update all previously-imported content as well as add new content.

Then, click the *Execute* button and keep the screen open while the migration runs (typically takes 2-4 minutes). Once finished, verify that everything imported correctly.