#  Fixed Column Headers
To keep column headers in a fixed position while scrolling, follow these steps:

1. Click into the table
2. Right click on the square in the upper left of the table to open the options
3. Select *Tablix properties* and under **Row Headers** check:
	1. Repeat header rows on each page
	2. Keep header visible while scrolling
Ensure that no boxes are checked under **Column Headers** 
4. Click *OK* to save the changes
5. On the *View* tab in SSRS, make sure that *Grouping* and *Properties* are checked
6. Click into the table again, and at the bottom of the screen you will see *Row Groups* and *Column Groups*. To the right of *Column Groups*, click on the down arrow and click on *Advanced Mode*.
7. In the *Row Groups* pane, select the first *Static* list. In the *Properties* pane, located the **FixedData** property and set it to **True**. Ensure that **KeepWithGroup** is set to **After** and that **RepeatOnNewPage** is set to **True**.

When you run the report, column headers should now stay in a fixed position when scrolling.