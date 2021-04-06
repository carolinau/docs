# Creating the Static Catalog
Permanently archiving the Carolina University Catalog is a crucial step to maintaining accurate records long term. This process is done by converting the entire [catalog.carolinau.edu](https://catalog.carolinau.edu) website into HTML files that are detached from the Drupal CMS.

## Preparing the Catalog for Archiving
Once the catalog has been archived, it is difficult to make changes at scale, as each page will be saved as a HTML page. This first step is critical to ensuring that the HTML functions as expected years into the future.

### Refresh Test Environment
All the procedures outlined in this document should be performed on the test instance of the Catalog website: [staging.catalog.carolinau.edu](https://staging.catalog.carolinau.edu).

Start by cloning the Live database and files into the Test enviroment on the Pantheon dashboard. Then, take a backup of the Test enviroment.

### Simplify Menu Links
The HTML version of the catalog should only have two menu links: *Home* and *Current Catalog*. To make this change, first log into the site and go to *Structure* > *Menus* > *Main navigation* > *Edit menu*. Uncheck the boxes for anything that may change in the future or is not necessary in a year-specific archive. This includes the **Undergraduate Archives**, **Graduate Archives**, and **Search** pages. While on this screen, enable the **Current Catalog** menu item. Leave **Home** enabled. The link to the current catalog should be an absolute URL, pointing to https://catalog.carolinau.edu, where the most recent version will always live. Save the changes once done.

Likewise, the above steps need to be repeated for the *Footer* menu. The footer menu should always mirror the top menu.

### Disable Blocks
Certain blocks will need to be disabled. These include:
- User account menu
- Tabs

To disable these blocks, go to *Structure* > *Block layout*, locate the desired blocks and disable them (*Operations* > arrow > *Disable*)

### Disable Interactive Elements
Any elements like pagers and search bars will need to be disabled.

Pagers are located on the following views:
- Course descriptions
- Addendum (if used for a particular year)

To disable the pager, in the view editing screen, set the **Use pager** > **Items per page** option to 0 for no limit. This will significantly slow down the rendering time for the page, but it will not be slow in the final HTML form.

The search function on the course descriptions view will also need to be disabled. While in the view settings, locate the **Global: Combine fields filter (exposed)** filter criteria. In the configuration for that filter, uncheck the *Expose this filter to visitors, to allow them to change it* option and apply for all displays.

### Unpublish Interactive Pages
Any page that contains exclusively interactive pages will need to be unpublished so that the HTML site exporter does not find the link and archive it. The /user page, of course, cannot be unpublished. As long as no links on the site point to this page, it will not be discovered.

Pages to be unpublished or completely unlinked include:
- PDF Catalog
- Undergraduate Catalog Archives
- Graduate Catalog Archives
- Search (a Search API Pages feature)

### Take Backup
Once all these changes are complete, take another backup of the Test enviroment on the Pantheon dashboard.

## Prepare the Local Machine for Exporting
The archiving of the catalog will need to be performed locally on a macOS machine. The software used for this export is a command line tool, [HTTrack](http://www.httrack.com). It is recommended to install HTTrack using [Homebrew](https://brew.sh). If Homebrew is already installed on your machine, simply run `brew install httrack`.

!> The export of the catalog will take around 4 hours. Be prepared to monitor the command line for this time to answer any prompts.

Once installed, `cd` to the enclosing directory where you would like to download the archived catalog to. Once everything is ready to begin the export, run this command to start the exporting of the catalog site to HTML, ensuring that the correct year is entered between the quotes:

```
 httrack https://staging.catalog.carolinau.edu/ -W -O "2021-2022" -%v --robots=0
```

## Modifications to HTTrack Files

Unfortunately, the files as prepared by HTTrack are not ready for publication. Manual modifications are necessary in order to fully prepare it for publication. This list of fixes may not be comprehensive. The best way to fully prepare the static catalog for publication is to open up the website on your local machine and test key pages to make sure that everything behaves as expected. 

### Fixing index.html
At the bottom of the `index.html` file in the root catalog directory, there will be a line like `<script src="../cdn.jsdelivr.net...</script>`. The problem with this is that the dropdown menus in the sidebar will not work due to it being a local file, not a full URL to the internet resource. To find the correct script URL, go to another page that has the dropdown menus working and replace the line in `index.html` with the line from the other page.

This same modification needs to be done at the top of the `index.html` file with the `bootstrap.min.css` and `drupal-bootstrap.min.css` files. Locate the full URLs for those stylesheets in a page that renders with all styles and copy those lines into the `index.html` file.

### Fixing Course Codes
HTTrack, in an attempt to simplify file names/URLs will remove words like "the" and "is" from the file names. This is a problem for course prefixes THE- and IS-. Thankfully, it is easy to fix. A text editor like [Atom](https://atom.io) works well for this purpose, thanks to its' advanced find and replace options.
- Rename the files in the `catalog/course` directory to contain the correct prefix (can be determined by looking at the file contents or judging the range of course numbers used)
- Update the links in `catalog/course-descriptions.html` to contain the correct prefixes
- Update the links in any applicable program pages, for instance `catalog/program/master-arts/biblical-studies.html` and `catalog/program/bachelor-science/information-systems.html`
