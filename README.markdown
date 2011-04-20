# Split-It: Vim plugin that makes creating split based layouts easier than shit.

This Vim plugin is dead simple. And by dead simple I mean if you can't understand it I swear I will find you and kill you.

Anyways...

Split-It creates multiple split viewports by taking in a variable amount of arguments. Each argument passed represents a column and it's value is the number of rows in that column. It's probably easier to understand with an example so check these examples out:

## Create a single column with a top and bottom viewport.

    :SplitIt 2

## Create 2 columns with 2 rows.

    :SplitIt 2 2

## Create a single tall view on the left and 3 stacked views to the right of that.

    :SplitIt 1 3

NOTE: Right now you can not have rows that span more than a single column. I am currently trying to decide the best way to easally express more advanced viewport layouts in a simple format.
