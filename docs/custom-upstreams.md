# Custom Upstreams
> Custom Upstream: a code repository containing contrib modules and custom themes hosted outside of Pantheon using GitHub, allowing for updates to be rolled out to multiple sites effortlessly.  

The “CU Theme” custom upstream contains contrib modules and the custom CU Theme. This is hosted in GitHub. When a file is updated and pushed to GitHub, the commit becomes available to all the sites that have `cu-theme` set as their custom upstream. To apply the update, go into the dashboard for a specific site and apply the update. This will merge the specific microsites codebase with the `cu-theme` codebase.

The greatest benefit of this is that all the microsites can be maintained using only one codebase, meaning that module updates are easy and style updates can be rolled out in an afternoon.