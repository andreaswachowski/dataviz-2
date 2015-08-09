# Coursera Data Visualization Assignment 2

A force-directed layout visualization created with [D3.js](http://d3js.org/)
for an assignment during [Coursera's data visualization
course](https://www.coursera.org/course/datavisualization).

The result can look similar to this:

<img src="https://github.com/andreaswachowski/dataviz-2/blob/master/screenshot.png" height=auto width="100%">

## Explanation

The visualization is based on the [Books about US
politics](http://www-personal.umich.edu/~mejn/netdata/polbooks.zip) dataset
(unpublished), compiled by Valdis Krebs,
[http://www.orgnet.com/](http://www.orgnet.com/), retrieved from
[http://www-personal.umich.edu/~mejn/netdata/](http://www-personal.umich.edu/~mejn/netdata/)
on August 9th 2015.

The original description provided with the dataset reads as follows:

> Nodes represent books about US politics sold by the online bookseller
> Amazon.com. Edges represent frequent co-purchasing of books by the same
> buyers, as indicated by the "customers who bought this book also bought
> these other books" feature on Amazon.
> 
> Nodes have been given values "l", "n", or "c" to indicate whether they are
> "liberal", "neutral", or "conservative".  These alignments were assigned
> separately by Mark Newman based on a reading of the descriptions and
> reviews of the books posted on Amazon.

The visualization uses color to indicate the political orientation. I use
yellow for liberal (an orangy yellow to keep the contrast acceptable), dark
blue for conservative, and grey for neutral, but that can be debated (see
[Wikipedia: "Political
colour"](https://en.wikipedia.org/wiki/Political_colour)).

The node's size increases with its number of edges.

Zooming and dragging is possible. Mouse over a node to see the 

### Development
Development started with [d3noob's block #5141278](http://bl.ocks.org/d3noob/5141278), which is explained in detail in
[d3noob's blog entry "d3.js force directed graph example (basic)"](http://www.d3noob.org/2013/03/d3js-force-directed-graph-example-basic.html).

Further inspiration was taken from [David Graus' blog entry
"Force-Directed Graphs: Playing around with
D3.js"](http://graus.nu/blog/force-directed-graphs-playing-around-with-d3-js/).

## Ideas for improvement
  * Add a legend
  * Make tooltips nicer
  * Automatically center and scale the graph appropriately during first load
