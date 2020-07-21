# Customizing the Theme
All of the sites are built on a custom Bootstrap 3 based theme, **PIU Theme**. The majority of the theme is identical between carolinau.edu and the rest of the microsites, with the bulk of the difference being in the menus and any special CSS for certain paragraphs or modules.

All the styling for the sites lives in a single `style.css` file inside the `/themes/custom/piu/css` directory.

Having a basic understanding of CSS and proper CSS structuring, is essential to making changes to this stylesheet.

The basic structure of this stylesheet resembles that of a webpage — global styles, header styles, body styles, footer styles. When adding new code, place it in the appropriate section.

While there is no comprehensive guideline for naming classes, stick to short classes that are human readable. For example, the faculty/staff styles are abbreviated to **FS**. Always use lowercase characters, and separate words by a hyphen (-).

For indentation, always use tabs, never spaces. Classes should not be indented unless they are within a `@media` query. Styles should always be indented once, twice if they are inside a `@media` query.