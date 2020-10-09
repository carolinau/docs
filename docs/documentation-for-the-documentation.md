# Documentation for the Documentation
> How to manage and update the website and marketing docs.  

> Applies to [webdocs.carolinau.edu](https://webdocs.carolinau.edu) and [marketing.carolinau.edu](https://marketing.carolinau.edu)  

The documentation websites serve as an internally focused hub for maintaining the websites and as one source of truth for marketing purposes. Both sites are publicly accessible and all information should be created with this in mind.

## Site Backend
The sites are written in [Markdown](https://www.markdownguide.org/), published to [Carolina University GitHub Repositories](https://github.com/carolinau), and the content is formatted and displayed by [Docsify](https://docsify.js.org/#/).  At minimum, a working knowledge of GitHub and the Markdown formatting language is necessary to maintain the site. Ideally, a [Git managed workflow](https://git-scm.com/) should be used to maintain the sites, but small edits and updates can be made directly from the GitHub user interface.

## Creating Content
If updating content on GitHub, you are limited to GitHub’s user interface features.

However, if you are using a Git workflow, then you may write and edit content in a Markdown editor of choice, such as [Atom](https://atom.io/) or [Bear](https://bear.app/). From these applications you can export the `.md` file to the locally cloned repository and push the changes to GitHub.

## Managing the Site
The appearance of the site, `<head>` content, and other global settings are managed in the `index.html` file located in the root directory. Refer to the Docsifiy documentation for more ways to use this file and customize the site.

## Coverpage and Sidebar Menu
The coverpage and sidebar menu are managed in the `_coverpage.md` and `_sidebar.md` files, respectively. The sidebar menu structure needs to be manually updated whenever pages change. All links in the `_sidebar.md` file are relative to the root directory.

## Troubleshooting
### Content Not Updating
One of the downsides of Docsify is that in order for new content to immediately appear on a client browser, a cache clear and hard refresh is often necessary. Perform a hard refresh using the shortcut `⌘ Command + ⇧ Shift + R` on macOS and `Ctrl + ⇧ Shift + R` on Windows.