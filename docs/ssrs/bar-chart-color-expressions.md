# Bar Chart Color Expressions
If you want the colors of the bar chart to change based on the value of the field, use this expression:

```
=SWITCH(Fields!FIELD_NAME.Value <= 2.333, "#BF0A30",
Fields!FIELD_NAME.Value >= 3.668, "#558B2F",
true, "#FFCA00"
)
```

To enter this expression, right click on the bars, select *Series Properties*, navigate to the *Fill* tab, click the ƒx button and paste the expression in the expression field, swapping out `FIELD_NAME` for the actual field name. Click *OK* on both screens to save.