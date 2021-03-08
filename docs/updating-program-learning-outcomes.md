# Updating Program Learning Outcomes
?> Applies to [catalog.carolinau.edu](https://catalog.carolinau.edu)

## Process
### SQL Server
Run the following SQL SELECT statement on the primary Jenzabar database to get the contents of the CATALOG_MASTER table in the necessary format:

```
SELECT P1.MAJOR_CDE
	,M.MAJOR_MINOR_DESC
	,LTRIM((
			SELECT STUFF((
						SELECT '| ' + P2.PLO_DESC
						FROM PIU_PROGRAM_LEARNING_OUTCOMES P2
						WHERE P2.MAJOR_CDE = P1.MAJOR_CDE
							AND P2.PLO_STS = 'A'
						FOR XML PATH('')
						), 1, 1, '')
			)) AS PLO_DESC
FROM PIU_PROGRAM_LEARNING_OUTCOMES P1
JOIN MAJOR_MINOR_DEF M
	ON P1.MAJOR_CDE = M.MAJOR_CDE
WHERE P1.PLO_STS = 'A'
GROUP BY P1.MAJOR_CDE
	,M.MAJOR_MINOR_DESC
	ORDER BY MAJOR_CDE
```

Select all the contents, right click and select “Save Results As…” and save the file as `plo.csv`

Once saved, copy the file locally to your desktop.

### Upload File via SFTP to Website
Open your desired FTP client, such as [FileZilla](https://filezilla-project.org/) on your development machine. Connect to the Catalog website using the SFTP connection information found on the Pantheon Dashboard.

In the remote directory, navigate to `files > csv`. Upload the new *plo.csv* from your machine to the server, making sure to overwrite the file on the server.

### Run Migration
In the Drupal Admin UI, navigate to [Manage > Structure > Migrations.](https://catalog.carolinau.edu/admin/structure/migrate) Click on *List migrations* within the *Program Learning Outcomes* migration group. Select *Execute* within the *Import program learning outcomes* migration task.

For the operation, make sure *Import* is selected. Then, expand the *Additional Execution Options* section and check the *Update* box to update all previously-imported content as well as add new content.

Then, click the *Execute* button and keep the screen open while the migration runs (typically takes 2-4 minutes). Once finished, verify that everything imported correctly.

## Assigning a PLO to a Program
When adding/modifying programs, program learning outcomes will need to be associated with a given program by their major code. However, you may search in the entity reference field by either code or major/minor name.
