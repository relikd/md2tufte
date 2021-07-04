::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
   TITLE : md2tufte
SUBTITLE : Exemplary overview document
  AUTHOR : relikd
 VERSION : v20210704
     TOC : @@@
<a href="#features">Features</a>
<a href="#requirements">Requirements</a>
<a href="#usage">Usage</a>
@@@
PDF-URL: ../en-example.pdf
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

This document is an exemplary usage of this tool.
Of course it will look better with actual documents when the content is longer and the lines break more nicely.


## Features

This document@=latex=
A HTML version of this document using a responsive layout for small screens is available at [https://relikd.github.io/md2tufte/bin/en-example.html](https://relikd.github.io/md2tufte/bin/en-example.html)
==@
was created with [`md2tufte`](https://github.com/relikd/md2tufte) – a tool which takes a markdown file as input and returns html and pdf as output.
It supports the usual markdown syntax and is augmented with a substitution header.
To place something in the margin, use the `@ ==` syntax.

For further examples, refer to the README file.
You can use in-document references.@==
e.\,g., see section [Requirements](#requirements).
==@

As you see, you can put about anything in the margin.
If you want to control that something should be only visible in the pdf version of the document but not in the html version, use the `@ =latex=` syntax.
Currently there is no inverse, i.\,e., `@ =html=` will **not** work.


## Requirements

@==![](img/example.png)
You can use margin images!==@

- [pandoc](https://pandoc.org/installing.html)
- [Python 3](https://www.python.org/download/releases/3.0/)
- xelatex

## Usage

<dl>
  <dt>make all</dt>
  <dd>builds all *.markdown files in the directory.</dd>
  <dt>make file.html</dt>
  <dd>just build the html version of a specific file.</dd>
  <dt>make file.pdf</dt>
  <dd>equivalently build pdf.</dd>
  <dt>make file.tex</dt>
  <dd>build the intermediate file only.</dd>
</dl>