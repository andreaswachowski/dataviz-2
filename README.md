# Coursera Data Visualization Assignment 2

A force-directed layout visualization created with [D3.js](http://d3js.org/)
for an assignment during [Coursera's data visualization
course](https://www.coursera.org/course/datavisualization).

The result can look similar to this:

<img src="https://github.com/andreaswachowski/dataviz-2/blob/master/screenshot.png" height=auto width="100%">

## Explanation

The visualization is based on the [Twitter Social circles
dataset](http://snap.stanford.edu/data/egonets-Twitter.html) presented in J.
McAuley and J. Leskovec. [Learning to Discover Social Circles in Ego Networks](http://i.stanford.edu/~julian/pdfs/nips2012.pdf),
NIPS, 2012.

The bash-script `twitter.sh` is used to convert the dataset (specifically the
`*.edges` files), or a subset thereof, into a CSV file which is readable by the
d3.js code.

The nodes of the graph are Twitter participants. An edge from A to B stands for
"A follows B". All edges are assigned the same weight.

The color coding is based on a node's in-degree, ie the number of followers:
The higher that degree, the darker its color.

### Development
Development started with [d3noob's block #5141278](http://bl.ocks.org/d3noob/5141278), which is explained in detail in
[d3noob's blog entry "d3.js force directed graph example (basic)"](http://www.d3noob.org/2013/03/d3js-force-directed-graph-example-basic.html).

Further inspiration was taken from [David Graus' blog entry "Force-Directed
Graphs: Playing around with
D3.js"](http://graus.nu/blog/force-directed-graphs-playing-around-with-d3-js/).

Additional sources are cited in the source code.

## Ideas for improvement
  * Add zoom and drag behaviors
  * Color-code a node: The higher its in-degree, the darker
  * Simplify the graph with an aim for community discovery (as explained in the course)
  * Layout based on betweenness centrality. Alas, so far I haven't found any graph algorithm libraries for JavaScript that would readily solve this (e.g., see [graph.js](https://github.com/devenbhooshan/graph.js). [graphstream](http://graphstream-project.org/) might help, but is in Java.)
  * Improve performance. As stated in the [section "Disadvantages" of Wikipedia's entry on force-directed graph drawing](https://en.wikipedia.org/wiki/Force-directed_graph_drawing#Disadvantages), the typical performance is O(n<sup>3</sup>), hence the time to render a larger graph quickly becomes prohibitive. [Superconductor](http://superconductor.github.io/superconductor/) might be helpful, but doesn't seem to be under development anymore.
  * Present node names and the node's in-degree on mouseover
  * Read and convert the data directly with d3.js instead of using a shell script in between. Provide input fields to customize the data selection (generally, make the data selection interactive).
  * Automatically center the graph
