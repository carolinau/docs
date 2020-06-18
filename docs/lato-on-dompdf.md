# Lato on DOMPDF
?> Applies to catalog.piedmontu.edu

If Lato stops working on the *View PDF* function on the catalog website, the Lato files may need to be regenerated. This often happens after the Entity Print module has been updated.

Start by downloading the [load_font.php](https://github.com/dompdf/utils/blob/master/load_font.php) file from the dompdf utils directory.
Change the path at the top of the file to `piu-catalog/vendor/autoload.php`, or wherever the autoload.php file is relative to the location of the load_font.php file.

Open terminal and cd into the same directory as the load_font.php file. Run this command:
`php load_font.php Lato /Lato/Lato-Regular.ttf`

Note, you may have to change the path to the Lato font depending on where it is stored on your development machine. Once that command has been run, you should see an output like this:

```
Unable to find bold face file.
Unable to find italic face file.
Unable to find bold_italic face file.
Copying ~/Lato/Lato-Regular.ttf to ~/piu-catalog/vendor/dompdf/dompdf/lib/fonts/Lato-Regular.ttf…
Generating Adobe Font Metrics for ~/piu-catalog/vendor/dompdf/dompdf/lib/fonts/Lato-Regular…
```

If you see that message, the font generation has been successfully. Simply `cd` into the pie-catalog directory, commit the changes, then push them to the server.