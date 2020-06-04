# Updating Program Learning Outcomes
?> Applies to [catalog.piedmontu.edu](https://catalog.piedmontu.edu)

## Process
### SQL Server
Run the following SQL SELECT statement on the primary Jenzabar database to get the contents of the CATALOG_MASTER table in the necessary format:

```
SELECT p1.MAJOR_CDE, m.MAJOR_MINOR_DESC,
LTRIM((SELECT STUFF((SELECT  '| ' + p2.PLO_DESC
    FROM PIU_PROGRAM_LEARNING_OUTCOMES p2
	WHERE p2.MAJOR_CDE=p1.MAJOR_CDE and p2.PLO_STS='A'
    FOR XML PATH('')), 1, 1, ''))) AS PLO_DESC
    FROM PIU_PROGRAM_LEARNING_OUTCOMES p1
	JOIN MAJOR_MINOR_DEF m ON p1.MAJOR_CDE=m.MAJOR_CDE
    GROUP BY p1.MAJOR_CDE, m.MAJOR_MINOR_DESC
```

Select all the contents, right click and select “Save Results As…” and save the file as `plo.csv`

Once saved, copy the file locally to your desktop.

### Upload File via SFTP to Website
Open your desired FTP client, such as [FileZilla](https://filezilla-project.org/) on your development machine. Connect to the Catalog website using the SFTP connection information found on the Pantheon Dashboard.

In the remote directory, navigate to `files > csv`. Upload the new *plo.csv* from your machine to the server, making sure to overwrite the file on the server.

### Run Migration
In the Drupal Admin UI, navigate to [Manage > Structure > Migrations.](https://catalog.piedmontu.edu/admin/structure/migrate) Click on *List migrations* within the *Program Learning Outcomes* migration group. Select *Execute* within the *Import program learning outcomes* migration task.

For the operation, make sure *Import* is selected. Then, expand the *Additional Execution Options* section and check the *Update* box to update all previously-imported content as well as add new content.

Then, click the *Execute* button and keep the screen open while the migration runs (typically takes 2-4 minutes). Once finished, verify that everything imported correctly.

## Assigning a PLO to a Program
When adding/modifying programs, program learning outcomes will need to be associated with a given program by their major code. However, you may search in the entity reference field by either code or major/minor name.