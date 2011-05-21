# Split-It: Vim plugin that makes creating split window based layouts easier than shit.

This Vim plugin is dead simple. And by dead simple I mean if you can't understand it you should be dead considering how drunk you are.

Anyways...

Split-It creates multiple split viewports by taking in a variable amount of arguments. Each argument passed represents a column and it's value is the number of rows in that column. It's probably easier to understand with an example so check these examples out.

## Stupid Easy Examples

### Create a single column with a top and bottom viewport.

    :SplitIt 2

### Create 2 columns with 2 rows.

    :SplitIt 2 2

### Create a single tall view on the left and 3 stacked views to the right of that.

    :SplitIt 1 3

### Create 3 columns with a single tall viewport on the left, 2 rows in the middle column and 3 rows in the right column.

    :SplitIt 1 2 3

*NOTE*: Right now you can not have rows that span more than a single column. I am currently trying to decide the best way to easally express more advanced viewport layouts in a simple format.

## I'm So Automatic

I like the idea of having a default layout of split viewports that I can load easily without having to call the SplitIt function with the arguments for each column.  For the most part I am going to want one default layout (to begin with anyway). For this reason I added the _SplitItSetLayout_ and _SplitItLayout_ functions. _SplitItSetLayout_ takes the same arguments that the _SplitIt_ function does, only instead of creating the viewports right when it is called it stores the details for later use by the _SplitItLayout_ function. Once a layout is set with _SplitItSetLayout_ you can call _SplitItLayout_ to render the viewport splits.

This allows you to set your layout in your .vimrc like so:

    :SplitItSetLayout 1 1 2


And then you can create that layout by calling `:SplitItLayout` at any time.

## That wasn't Automatic, THIS IS AUTOMATIC!

So... I need it MORE automatic. I'm lazy as shit and I can only assume you are too so I added the ability to have the SplitIt plugin load your layout when it starts (so you don't even have to google instructions how to automatically do something on Vim's new window creation you lazy bastard).

To do this all you have to do is set your layout and turn on _AutoLayout_ in your .vimrc file like so:

    " set my SplitIt and forget it lazzy ass startup layout
    :SplitItSetLayout 1 1 2<CR>
    :SplitItSetAuto

Now whenever you open a new vim window your layout is automatically loaded. No more wasted time loading layouts. It's a miracle.


*NOTE*: I will be adding named layouts allowing you to open different predefined layouts __easier than shit__.
