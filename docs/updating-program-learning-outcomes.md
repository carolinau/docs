# Updating Program Learning Outcomes
?> Applies to [catalog.piedmontu.edu](https://catalog.piedmontu.edu)

## Process
### SQL Server
Run the following SQL SELECT statement on the primary Jenzabar database to get the contents of the CATALOG_MASTER table in the necessary format:

```
SELECT p1.MAJOR_CDE,
LTRIM((SELECT STUFF((SELECT  '| ' + p2.PLO_DESC
	FROM PIU_PROGRAM_LEARNING_OUTCOMES p2 WHERE p2.MAJOR_CDE=p1.MAJOR_CDE
	FOR XML PATH('')), 1, 1, ''))) AS PLO_DESC
	FROM PIU_PROGRAM_LEARNING_OUTCOMES p1
	GROUP BY MAJOR_CDE
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
When adding/modifying programs, program learning outcomes will need to be associated with a given program by their major code. Use the following table to locate the desired major code based on the major name which is entered into the **Program Learning Outcomes**field in the Drupal UI.

| Major Code | Major Name |
|-|-|
| MGBE | Management & Business Ethics |
| BBED | Biblical Education |
| BCM | Ministry |
| BICM | Bible (Christian Ministry Emphasis MDIV) |
| MUED | Music Education |
| MUSI | Music |
| BIPE | Biblical Studies (Pastoral Studies Emphasis MDIV) |
| BIST | Biblical Studies |
| BSM | Bible (Selected Minor) |
| CMUS | Church Music |
| REST | Religious Studies |
| ELEM | Elementary Education |
| ELWM | Elementary Education with Missions Emphasis |
| MAMN | Ministry |
| MABS | Biblical Studies |
| DSCS | Deaf Studies - Deaf Community Services |
| DSSL | Deaf Studies - Sign Language Interpreting |
| DMIN | Doctor of Ministry |
| MDIV | Master of Divinity |
| PHDL | Leadership |
| PHDB | Biblical Studies |
| ITDS | Interdisciplinary Studies |
| LEAD | Leadership |
| CBSM | Certificate in Biblical Studies |
| AMIN | Ministries (AA) |
| BMIN | Ministry (Double Minor) |
| APMD | Accelerated MDIV - Pastoral Studies |
| ACMD | Accelerated MDIV - Church Ministry |
| JCMC | Christian Ministries-Counseling-JWU Teach-Out |
| JCFM | Christian Ministries-Family Ministry-JWU Teach-Out |
| JCPM | Christian Ministries-Past. Ministry-JWU Teach-Out |
| JCWA | Christian Ministries-Worship Arts-JWU Teach-Out |
| TBBY | BA Bible (TTU) Youth Ministry |
| INDS | Interdisciplinary Studies |
| MBEX | Bible Exposition |
| CBWA | Adv Certificate Biblical Worldview |
| CBWB | Basic Certificate Biblical Worldview |
| CNTG | Certificate of New Testament & Greek |
| COTH | Certificate of Old Testament & Hebrew |
| MBIS | Master of Arts in Biblical Studies |
| BBAD | Business Administration |
| BBAM | Business Administration w/ Minor |
| AABI | Bible (AA) |
| AECE | Early Childhood Education |
| BACM | BA Christian Ministry |
| BBSM | Bible w/ Selected Minor |
| BSHP | BS Health & Physical Education |
| BSSE | BS Secondary English Education |
| MBAD | Master of Business Administration |
| BACJ | BA Criminal Justice |
| MOED | Master of Education |
| SLIB | Sign Language Interpreting - Track 2 |
| SLIA | Sign Language Interpreting - Track 1 |
| PHDP | Leadership Prep |
| BSNU | Nursing |
| MSNU | Nursing |
| SOCI | Sociology |
| BAPS | Psychology |
| BSPS | Psychology |
| BSPH | Public Health |
| MACO | Counseling |
| MODS | Data Science |
| MOFP | Financial Planning |
| MSPH | Public Health |
| BBES | Esports |
| BSES | Esports |
| BINS | Information Systems |