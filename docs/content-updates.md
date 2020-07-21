# Content Updates
There are two ways that content on all of the sites are managed. The first is via templated content types. These include:
- Faculty/Staff
- Programs
- Standard Pages (carolinau.edu only)

The second method is via Paragraphs. Paragraphs are used primarily on:
- Basic Pages

?> Paragraphs is a module that allows site builders to use pre-defined “content blocks” to create the design and layout of a page.

## Paragraphs
The primary benefit to Paragraphs is that it allows for easy customization of design and layout while maintaining brand colors and consistency with the rest of the website. A Paragraph is essentially a block of content that takes many different forms. All of the websites are equipped with the Paragraph module and several default Paragraphs, such as Content, H2 Title, Video, Block, Colored CTA, Featured Image Header. Each Paragraph is also equipped with the Paragraphs Grid module, which utilizes the Bootstrap layout flexibility to adjust how many columns the specified Paragraph takes up.

## Templated Content Types
For content that shouldn’t have variation between different [nodes](https://www.drupal.org/docs/8/core/modules/node/about-nodes), a standard content type is used with a set display. The benefit of this method is that UI changes can be made to the template and easily rolled out to all the sites, without having to update individual nodes. The downside to this method is that one-off changes aren’t easily possible.

## Editing Content
Editing content follows the same procedure, no matter if the page is created using Paragraphs or not. Simply navigate to the page while logged in, scroll to the bottom and in the footer locate the **Edit** tab and click on that. Find the content you are looking to edit, make the change, and click **Save**.

## Adding Paragraphs
To add a new Paragraph, first navigate to the page you wish to edit and select the **Edit** tab to launch the editing screen. Then, scroll to the bottom until you see the **Add New Paragraph** button. Click on the drop down arrow to find the specific Paragraph type you want, and then click on that to add a new one to the page. Proceed to fill it out as desired, and click **Save** once finished.

## Links
When creating links that go to pages on the same site, always use relative URLs. For the academics page, this would look like `/academics` . When linking to sites at a separate domain or subdomain, use the full absolute URL: `https://carolinau.edu/academics`. 