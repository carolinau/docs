# Introduction to Git
?> Applies to all sites.

> Git is a  [free and open source](https://git-scm.com/about/free-and-open-source)  distributed version control system designed to handle everything from small to very large projects with speed and efficiency.  

## Installing Git
You will need Git installed on your development machine to make any code changes. Select your operating system and the download will automatically begin:
*  [macOS](https://git-scm.com/download/mac) 
*  [Windows](https://git-scm.com/download/win) 
*  [Linux](https://git-scm.com/download/linux) 

## Cloning the Site Codebase
Git versioning is handled entirely locally on your computer, from where you push changes to your remote server. Because of this, you will need to clone the site’s codebase to your computer.
For all the Drupal sites on Pantheon, follow these steps.
1. Sign into the Pantheon site dashboard and navigate to the desired site
2. Locate the **Clone with Git** button and copy the command in the box
3. Navigate to your desired directory in Terminal and run the command
!> You must have your development machine configured with an SSH key in order for this to work. Refer to the [Pantheon documentation](https://pantheon.io/docs/ssh-keys) for instructions.

## Typical Workflow
A typical workflow of the Git process looks like this:

* Make and save changes in local IDE (integrated development environment).
* `cd` into project directory within Terminal.
* `git commit -am ‘Your commit message’ ` to commit the changes to the repository. The `-am` combines two commands, `-a` to stage all files, and `-m` to add a commit message.
* `git push` to push the changes to either a GitHub repository or the Pantheon Dev environment of a given site.