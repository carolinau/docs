# Regular Maintenance
Regular maintenance is very important. Updating modules, themes, dependencies, and core ensures that the websites will remain secure and efficient. This section is broken down into two categories:
- Custom upstream managed sites
	- [hr.carolinau.edu](https://hr.carolinau.edu)
	- [e4.carolinau.edu](https://e4.carolinau.edu)
	- [leadership.carolinau.edu](https://leadership.carolinau.edu)
	- [education.carolinau.edu](https://education.carolinau.edu)
	- [business.carolinau.edu](https://business.carolinau.edu)
	- [divinity.carolinau.edu](https://divinity.carolinau.edu)
	- [sas.carolinau.edu](https://sas.carolinau.edu)
- Composer managed sites
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

## Custom Upstream Managed Sites
All changes made to the custom upstream should not be done in an individual site. Rather, they should be performed in `cu-theme`.

To clone the `cu-theme` locally, navigate to the [carolinau/cu-theme](https://github.com/piedmontiu/cu-theme) GitHub repository and select the Clone button to clone it to your local machine.

Once it has been cloned, navigate to the `cu-theme` directory. You’ll need to add Pantheon’s Upstream as a [remote](https://git-scm.com/docs/git-remote) in order to pull in core Drupal updates to the custom upstream repository. To check if it has already been added, simply run `git remote` in Terminal.

If the Pantheon remote has not been added, only `origin` will return. If that is the case, run this command to add Pantheon as a remote:

```
git remote add pantheon-drops-8 git://github.com/pantheon-systems/drops-8.git
```

You can check to see that it worked by again running `git remote`.

This time, you’ll see:
```
origin
pantheon-drops-8
```

### Updating Modules and Themes
To get started with updating modules and themes on custom upstream managed sites you will need to have cloned the `cu-theme`  locally to your development environment. All module and theme updates should be made to this git repo instead of the individual sites. Making changes to this repo will allow all the microsites to pull from the same codebase.

When there is a module update, download the ZIP file from the Drupal.org website. Unzip the folder and drag it to `cu-theme/modules` to replace the existing folder for that module. The same process applies when installing a new module. For theme updates, download the ZIP file from Drupal.org, unzip the folder, and drag it to `cu-theme/themes/contrib`

### Updating Core
All the custom upstream managed sites have a further upstream of Pantheon’s Drupal 8 git bucket. That is where core updates come from. To update core, run the following commands:
```
git fetch pantheon-drops-8
git merge pantheon-drops-8/master
```
Do not attempt to copy in the official download from Drupal’s website. This will break Pantheon workflow functionality.

Provided no updates happened when running those core updates, proceed to commit the changes.
```
git commit -m ‘Update core to latest version’
```
Then, push the changes to the `cu-theme` bucket using `git push`

### Pulling Updates on Microsites
*Applies to module, theme, and core updates.*
You can run a Terminus command to automatically pull in the updates from the custom upstream and apply them to the dev environments of the respective sites. You will need the [Terminus Mass Update](https://github.com/pantheon-systems/terminus-mass-update) plugin to do so. To apply updates, run this command:
```
terminus site:list --format=list | terminus site:mass-update:apply
```
This will apply any pending updates in the custom upstream managed site dashboards and apply them to the dev environment. Test at least one of the sites in dev and test before deploying all changes to test and then to live.
## Terminus Quick Commands
### Scripts
Download a .sh script that bundles each group below into a script for easy updates.
- [Dev to Test](https://webdocs.carolinau.edu/scripts/devtest.sh)
- [Test to Live](https://webdocs.carolinau.edu/scripts/testlive.sh)
- [Clear Cache](https://webdocs.carolinau.edu/scripts/clearcache.sh)

Download the script files to your desired directory. To make the files executable, run `chmod +x ./devtest.sh` and then to run it, enter `./devtest.sh`

### Deploy from Dev to Test
```
terminus env:deploy carolina-university.test --cc
```
```
terminus env:deploy cu-catalog.test --cc
```
```
terminus env:deploy cu-human-resources.test --cc
```
```
terminus env:deploy e4.test --cc
```
```
terminus env:deploy john-wesley-school-of-leadership.test --cc
```
```
terminus env:deploy moore-school-of-education.test --cc
```
```
terminus env:deploy patterson-school-of-business.test --cc
```
```
terminus env:deploy piedmont-divinity-school.test --cc
```
```
terminus env:deploy school-of-arts-and-sciences.test --cc
```

### Deploy from Test to Live
```
terminus env:deploy carolina-university.live --cc
```
```
terminus env:deploy cu-catalog.live --cc
```
```
terminus env:deploy cu-human-resources.live --cc
```
```
terminus env:deploy e4.live --cc
```
```
terminus env:deploy john-wesley-school-of-leadership.live --cc
```
```
terminus env:deploy moore-school-of-education.live --cc
```
```
terminus env:deploy patterson-school-of-business.live --cc
```
```
terminus env:deploy piedmont-divinity-school.live --cc
```
```
terminus env:deploy school-of-arts-and-sciences.live --cc
```
### Clear Cache

The clear cache Terminus command follows the pattern of
`terminus env:clear-cache $site.$environment`

```
terminus env:clear-cache carolina-university.live
```
```
terminus env:clear-cache cu-catalog.live
```
```
terminus env:clear-cache cu-human-resources.live
```
```
terminus env:clear-cache e4.live
```
```
terminus env:clear-cache john-wesley-school-of-leadership.live
```
```
terminus env:clear-cache moore-school-of-education.live
```
```
terminus env:clear-cache patterson-school-of-business.live
```
```
terminus env:clear-cache piedmont-divinity-school.live
```
```
terminus env:clear-cache school-of-arts-and-sciences.live
```

## Composer Managed Sites
Certain sites are managed with Composer in order to install modules with advanced features that require PHP dependencies.

### Updating Modules and Themes
To update modules, themes, and core, `cd` into the local site directory and install updates for a specific module using this command: `composer update drupal/MODULE_NAME`

### Updating Core and Dependencies
Run the following three commands to update Drupal Core and any PHP dependencies. If the first command does not work, simply run `composer update` and then complete the remainder of the commands.
```
composer update drupal/core --with-dependencies
composer prepare-for-pantheon
composer install --no-dev
```
Following this step, commit the changes and push them to the dev environment.

## Troubleshooting
### Out of Memory Error

If you get the error  `Fatal error: Allowed memory size of 1610612736 bytes exhausted (tried to allocate 4096 bytes) in phar:///Users/$USER/composer.phar/src/Composer/DependencyResolver/RuleWatchGraph.php on line 52`  then run the following command, modifying as necessary for the location of Composer on your system (Linux/macOS).

```
export COMPOSER_MEMORY_LIMIT=99999999999 && php -d memory_limit=-1 /Users/$USER/CU/composer.phar update
```
