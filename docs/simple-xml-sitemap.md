# Simple XML Sitemap
The Simple XML Sitemap is a key module to keeping search engine results up to date. A sitemap generates a master list of all the nodes present on the site, and is viewable at [piedmontu.edu/sitemap.xml](https://piedmontu.edu/sitemap.xml) (swap the base URL for the desired site).

By navigating to the Simple XML Sitemap module via the configuration admin menu item, you can set the global settings and regenerate the sitemap.

## Settings Overview
### Cron
To ensure that the sitemap stays up to date, it is generated every three hours on every cron run.

### Default base URL
The default base URL is a key setting when working with multiple domains and development environments. When developing sites on a Pantheon development URL, set the default base URL to the final URL of the live site. That way, when the site is live, all the URLs will be for the public URL and not the Pantheon live site URL. For sites with multiple domains (e4/pt/es), choose a primary domain and set that as the default base URL.

## Overriding Defaults
Only content nodes are set to be indexed by default. You can toggle if a specific node should be indexed or not by navigating to the edit window of a given node, and on the right side under **Simple XML Sitemap** changing the radio button to **Do not index this basic page entity in variant Default**.