# Updating Program Learning Outcomes
?> Applies to [catalog.piedmontu.edu](https://catalog.piedmontu.edu)

## Process
### SQL Server
Run the following SQL SELECT statement on the primary Jenzabar database to get the contents of the CATALOG_MASTER table in the necessary format:

```
SELECT p1.MAJOR_CDE,
LTRIM((SELECT STUFF((SELECT  '| ' + p2.PLO_DESC
    FROM PIU_PROGRAM_LEARNING_OUTCOMES p2
	WHERE p2.MAJOR_CDE=p1.MAJOR_CDE and p2.PLO_STS='A'
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
When adding/modifying programs, program learning outcomes will need to be associated with a given program by their major code. Use the following table to locate the desired major code (based on the major name) which is entered into the **Program Learning Outcomes** field in the Drupal UI.

|  Major Code |  Major Description |  Degree Code/Minor |
|---|---|---|
|AABI |Bible (AA)|AA |
|ACMD |Accelerated MDIV - Church Ministry|MINOR|
|AECE |Early Childhood Education|AA |
|AMIN |Ministries (AA)|AA |
|APMD |Accelerated MDIV - Pastoral Studies|MINOR|
|ASLN |American Sign Language|MINOR|
|BACJ |BA Criminal Justice|BA |
|BACM |BA Christian Ministry|BA |
|BAPS |Psychology|BA |
|BBAD |Business Administration|BBA|
|BBAM |Business Administration w/ Minor|BBA|
|BBED |Biblical Education|MINOR|
|BBES |Esports|BBA|
|BBSM |Bible w/ Selected Minor|BA |
|BCM  |Ministry|BA |
|BICM |Bible (Christian Ministry Emphasis MDIV)|MINOR|
|BILA |Biblical Languages|MINOR|
|BINS |Information Systems|BS |
|BIPE |Biblical Studies (Pastoral Studies Emphasis MDIV)|MINOR|
|BIST |Biblical Studies|BA |
|BMIN |Ministry (Double Minor)|BA |
|BSES |Esports|BA |
|BSHP |BS Health & Physical Education|BS |
|BSM  |Bible (Selected Minor)|BA |
|BSNU |Nursing|BS |
|BSPH |Public Health|BS |
|BSPS |Psychology|BS |
|BSSE |BS Secondary English Education|BS |
|CBSM |Certificate in Biblical Studies|MINOR|
|CBWA |Adv Certificate Biblical Worldview|ND |
|CBWB |Basic Certificate Biblical Worldview|ND |
|CED  |Church Education|MINOR|
|CHM  |Children's Ministry|MINOR|
|CJUM |Criminal Justice|MINOR|
|CMUS |Church Music|BA |
|CNTG |Certificate of New Testament & Greek|ND |
|COTH |Certificate of Old Testament & Hebrew|ND |
|COUN |Counseling|MINOR|
|CREC |Coaching and Recreation|MINOR|
|DMIN |Doctor of Ministry|DMIN|
|DSCS |Deaf Studies - Deaf Community Services|BS |
|DSSL |Deaf Studies - Sign Language Interpreting|BS |
|ELEM |Elementary Education|BS |
|ELWM |Elementary Education with Missions Emphasis|BS |
|ENGN |English|MINOR|
|EXPB |Expanded Bible|MINOR|
|GMN  |General Ministry|MINOR|
|GMN2 |General Ministry 1|MINOR|
|HIS  |History|MINOR|
|HUMN |Humanities|MINOR|
|INDS |Interdisciplinary Studies|BA |
|INTS |Intercultural Studies|MINOR|
|ISRS |Israel Studies|MINOR|
|ITDS |Interdisciplinary Studies|MINOR|
|JCFM |Christian Ministries-Family Ministry-JWU Teach-Out|MINOR|
|JCMC |Christian Ministries-Counseling-JWU Teach-Out|MINOR|
|JCPM |Christian Ministries-Past. Ministry-JWU Teach-Out|MINOR|
|JCWA |Christian Ministries-Worship Arts-JWU Teach-Out|MINOR|
|LEAD |Leadership|MA |
|MABS |Biblical Studies|MA |
|MACO |Counseling|MA |
|MAMN |Ministry|MA |
|MBAD |Master of Business Administration|MBA|
|MBEX |Bible Exposition|MA |
|MBIS |Master of Arts in Biblical Studies|MA |
|MDIV |Master of Divinity|MDIV|
|MFNP |Management for Nonprofits|MINOR|
|MGBE |Management & Business Ethics|BA |
|MISS |Missions|MINOR|
|MODS |Data Science|MS |
|MOED |Master of Education|MOED|
|MOFP |Financial Planning|MS |
|MSNU |Nursing|MS |
|MSPH |Public Health|MS |
|MUED |Music Education|BS |
|MUS  |Music|MINOR|
|MUSI |Music|BA |
|NACP |North American Church Planting|MINOR|
|PAS  |Pastoral Studies|MINOR|
|PHDB |Biblical Studies|PHDB|
|PHDL |Leadership|MINOR|
|PHDP |Leadership Prep|MINOR|
|REST |Religious Studies|AA |
|SCBE |Secondary Bible Education|MINOR|
|SLIA |Sign Language Interpreting - Track 1|BS |
|SLIB |Sign Language Interpreting - Track 2|BS |
|SM   |Student Ministry|MINOR|
|SOCI |Sociology|BA |
|SPMG |Sports Management|MINOR|
|TBBY |BA Bible (TTU) Youth Ministry|MINOR|
|WART |Worship Arts|MINOR|
|WL   |Worship Leadership|MINOR|
