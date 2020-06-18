# Composer
?> Applies to piedmontu.edu, catalog.piedmontu.edu

>  [Composer](https://getcomposer.org/)  is a tool for dependency management in PHP. It allows you to declare the libraries your project depends on and it will manage (install/update) them for you. Drupal uses Composer to manage the various libraries that it depends on. Modules can also use Composer to include 3rd party libraries. Drupal site builds can use Composer to manage the various modules the site is composed of.  

Due to necessary complexity on both websites (for example, Solr search), Composer is a necessary tool to use for installing and upgrading modules, themes, core, and any third party dependencies. Composer is exclusively a command line tool.
![](composer/Screen%20Shot%202020-02-19%20at%208.51.43%20AM.png)
*Terminal running Composer*

You do not need to have an extensive knowledge of Composer nor of command line tools in order to use Composer. All the commands you will need to know for a standard module or core update can be found in the [Regular Maintenance](/regular-maintenance?id=composer-managed-sites) section of these docs.

## Installing Composer
### macOS
To download and install Composer, follow the instructions on [getcomposer.org](https://getcomposer.org/download/). 
### Windows
Download and run the [composer-setup.exe](https://getcomposer.org/doc/00-intro.md#installation-windows) file in order to install Composer on a Windows machine.

## Composer Managed Sites vs. Custom Upstream Managed Sites
Websites that are managed via a [Custom Upstream](/custom-upstreams) are not utilizing Composer. However, they are using Git on the command line for version control purposes (see [Introduction to Git](/introduction-to-git) for more information). Composer managed sites also use Git for versioning purposes.
Composer is just one of many tools available on the command line, as is Git. These tools are used side by side on the PIU websites.