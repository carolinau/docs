# Updating Courses from the Catalog
?> Applies to [catalog.piedmontu.edu](https://catalog.piedmontu.edu)

## Process
### SQL Server
Run the following SQL SELECT statement on the primary Jenzabar database to get the contents of the CATALOG_MASTER table in the necessary format:

```
SELECT DISTINCT RTRIM(M.CRS_CDE) AS CRS_CDE, CONCAT(M.CRS_TITLE,M.CRS_TITLE_2) AS CRS_TITLE, M.DFLT_CREDIT_HRS, M.LECTURE_LAB_HRS,
CASE WHEN PREREQ_ADV_REQ_CDE IS NULL THEN '' ELSE LTRIM(((SELECT STUFF((SELECT '|' + RTRIM(M2.CRS_CDE)
FROM PREREQ_ADV_TABLE P2 JOIN CATALOG_MASTER M2 ON P2.PREREQ_ADV_REQ_CDE=M2.ADV_REQ_CDE
WHERE P.ADV_REQ_CDE=P2.ADV_REQ_CDE AND M2.ACTIVE_INACTIVE_ST='A' AND M2.ORG_CDE='*LOCAL'FOR XML PATH ('')), 1, 1, '')))) END AS PREREQ,
CASE
	WHEN M.CATALOG_TEXT IS NULL AND (M.CRS_CDE LIKE 'MC%' OR M.CRS_CDE LIKE 'MF%' OR M.CRS_CDE LIKE 'MU%' OR M.CRS_CDE LIKE 'MR%'
			OR M.CRS_CDE LIKE 'MT%' OR M.CRS_CDE LIKE 'MV%' OR M.CRS_CDE LIKE 'MX%' OR M.CRS_CDE LIKE 'MN%' OR M.CRS_CDE LIKE 'MP%' OR M.CRS_CDE LIKE 'MM%')
	THEN 'This course is instrument and student specific.'
	WHEN M.CATALOG_TEXT IS NULL THEN 'No course description found.'
ELSE M.CATALOG_TEXT END AS CATALOG_TEXT
FROM CATALOG_MASTER M
LEFT JOIN PREREQ_ADV_TABLE P ON M.ADV_REQ_CDE=P.ADV_REQ_CDE
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

## Inactive Courses
When courses are marked as inactive in the catalog, and after an *Import courses* migration has run, you will see **Unprocessed: -x** on the migration screen where x is the number of courses that have been marked as inactive. These courses will need to be manually deleted from the catalog website. To find out which ones have been marked as inactive, connect to the catalog database and open the **migrate_map_catalog_master_c33a9w5** table. Locate all the rows that have **1** in the **source_row_status** column. The **sourceid1** column contains the course code and number of all the courses that have been marked as inactive.

With the database open on one screen, open the Drupal content screen on another and look up all those courses codes that have a **1** in the **source_row_status** column and delete them from the website. Once done, you may delete those rows from the **migrate_map_catalog_master_c33a9w5** table.

Once the nodes on the website have been deleted, go back to the courses migration screen and verify that Unprocessed reads 0.