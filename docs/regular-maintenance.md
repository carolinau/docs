# Regular Maintenance
Regular maintenance is crucial to the health and longevity of the sites. Updating modules, themes, dependencies, and Drupal core ensures that the websites will remain secure and efficient. The websites can be broken down into two main categories:
- Custom Upstream Sites
	- [e4.carolinau.edu](https://e4.carolinau.edu)
	- [leadership.carolinau.edu](https://leadership.carolinau.edu)
	- [education.carolinau.edu](https://education.carolinau.edu)
	- [business.carolinau.edu](https://business.carolinau.edu)
	- [divinity.carolinau.edu](https://divinity.carolinau.edu)
	- [sas.carolinau.edu](https://sas.carolinau.edu)
- Non-Custom Upstream Sites
	- [carolinau.edu](https://carolinau.edu)
	- [catalog.carolinau.edu](https://catalog.carolinau.edu)

## Required Tools
In order to do updates on the sites, you will need to have the following tools installed on your local development environment:
- [Git](https://git-scm.com/)
- [Composer](https://getcomposer.org/)
- [Terminus](https://pantheon.io/docs/terminus/install)

A basic understanding of how these tools are used is also essential to the rest of this section. Common commands and procedures will be documented, but these docs don’t go in-depth into how these tools work.

### Cloning Sites Locally
To get started managing any site, you will need to clone it to your development environment. Pantheon provides an easy way to do this. On the Pantheon dashboard, find a site and copy the command found under the **Clone with Git** button. Paste this into your terminal to copy the specified site locally.

## Custom Upstream Sites
All changes made to the custom upstream should not be done in an individual site. Rather, they should be performed in `cu-theme`. All the custom upstream sites pull their code from this single repository.

To clone the `cu-theme` locally, navigate to the [carolinau/cu-theme](https://github.com/piedmontiu/cu-theme) GitHub repository and select the Clone button to clone it to your local machine. Once it's cloned, you can start managing updates or making code updates to the theme.

## Updating Core, Modules, and Themes
To get started with updating Drupal core, modules, and themes, ensure you have the `cu-theme` repository cloned to your local machine. Additionally, for the non-upstream sites (`carolina-university` and `cu-catalog`), ensure you've cloned those sites to your local machine using the "Clone with Git" button in the Pantheon dashboard for the dev environment.

All updates to the custom upstream managed sites get made directly to the `cu-theme` repository, not to the individual sites. `cu-catalog` and `carolina-university` are the exception where updates get made directly to those codebases.

The main site, catalog site, and the custom upstream all use Composer to manage the project dependencies. Therefore, to install updates, the easiest thing to do is run `composer update`. This command will need to be run in the `carolina-university`, `cu-catalog`, and `cu-theme` directories on your local machine.

You can update specific modules by running the command `composer update drupal/MODULE_NAME` if desired.

Once updates have been implemented, and assuming no errors were thrown by Composer, commit and push all the changes. Deploy to a dev or test environment to test before running the deploy all script below.

TL;DR
Run `composer update` in the `cu-theme`, `carolina-university`, and `cu-catalog` directories.

## Deploying Updates to All Sites
The easiest way to deploy updates to all sites is by using a custom bash script. You'll need Terminus configured to use this script. Make sure you are logged into Terminus before running this as well.
Before deploying to all sites, it is recommended to test the updates on the main website to ensure there are no breaking changes.
- [Deploy All](https://webdocs.carolinau.edu/scripts/deployall.sh)

## Other Scripts
Here are some additional scripts to accomplish other common maintenance tasks.
- [Clear Cache](https://webdocs.carolinau.edu/scripts/clearcache.sh)
- [Run Cron](https://webdocs.carolinau.edu/scripts/runcron.sh)
- [Open Status Report](https://webdocs.carolinau.edu/scripts/openstatusreport.sh)

Download the script files to your desired directory and execute them by running `bash deployall.sh` (for example).
If the script is not executable, run `chmod +x ./deployall.sh` then try running the script again.

## Troubleshooting
### Out of Memory Error

If you get the error  `Fatal error: Allowed memory size of 1610612736 bytes exhausted (tried to allocate 4096 bytes) in phar:///Users/$USER/composer.phar/src/Composer/DependencyResolver/RuleWatchGraph.php on line 52`  then run the following command, modifying as necessary for the location of Composer on your system (Linux/macOS).
```
export COMPOSER_MEMORY_LIMIT=99999999999 && php -d memory_limit=-1 /Users/$USER/CU/composer.phar update
```
To fix this error on macOS, navigate to `/usr/local/etc/php/8.0/php.ini` and set `memory_limit` to  `-1`.
