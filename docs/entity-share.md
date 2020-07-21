# Entity Share
> [Entity Share](https://www.drupal.org/project/entity_share) is an all in one module allowing you to share some entities like node, field collection, taxonomy, medias etc between different Drupal instances.  

## About the Plugin
On the CU websites, Entity Share is primarily used for common taxonomy terms and faculty and staff nodes. It exists to eliminate manually duplicating content across sites and ensures a consistent quality of content between all of the microsites.

Entity Share scans both the server and the client for identical content, and any content that is not identical gets marked as *entities not synchronized*. Identical entities get marked as *entities synchronized*.

All content should be identical between all of the sites.  Even thought not all content is used on a given microsite, all content should be synced.

The plugin works through the JSON API. carolinau.edu is the **server** and all the microsites are the **clients**. There is an account on carolinau.edu named **webmaster**. This account has permissions only for the Entity Share module and its’ username and password are entered in on each microsite in order to utilize the JSON API. Do not delete this account, else the Entity Share functionality will break. This account should also not be used for any other purpose besides Entity Share in order to keep security as a top priority.

## Using the Plugin
To use the plugin, navigate to **content** in the Drupal administrative interface. Navigate to the **Entity Share** tab at the top. Then, select the server (Carolina University) and choose your desired channel. Each channel is a different content type or taxonomy vocabulary. One the desired channel has been selected, click through the pages to locate the node that you would like to sync. The most recently updated nodes often are on the last page. Simple select the nodes you would like to sync, and click **Synchronize Entities**. The system will override the client content with the server content, and provided there are no mismatches with the fields, it will complete after a few seconds.

## Important Considerations
In order for Entity Share to work, the machine names of the fields with content types must be *identical* between the server and client sites. It is often easiest to match the field names themselves, too. The content type as a whole must be identical between the server and client websites, otherwise Entity Share will not work.

Files and images do transfer between sites. Entity Share nodes look just like any other node on both the server and client sites. Their URLs are specific to the site the content lives on, not the server site. So with the example of a faculty profile, even though they may only display on the Business website, the same entity lives on the server site and all the client sites.

Entity Share is still under development, as such it is not completely stable. With this in mind, do not process more than 25 entities at any given time.

If you delete a node from the server, it will cease to show up in the pull entities list on the client sites. You will need to manually delete the desired entity from all sites. Do this by going to Content and searching for the desired node, then clicking on the arrow to the right of **Edit** and clicking **Delete**.