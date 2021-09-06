# md2tufte

A custom markdown to html + pdf compiler; based on Tufte CSS.

To build all files run `make all` (or `make file.html`, `make file.tex`, `make file.pdf` respectively). Refer to the Makefile to learn what it does.

Look at the [example pdf](https://relikd.github.io/md2tufte/en-example.pdf) and [example html](https://relikd.github.io/md2tufte/bin/en-example.html) output built from the [markdown input](en-example.markdown) file.


## Requirements

You'll need:

- [pandoc](https://pandoc.org/installing.html)
- [Python 3](https://www.python.org/download/releases/3.0/)
- xelatex

Included in the package:

- [Tufte CSS](https://edwardtufte.github.io/tufte-css/)
- Font [Cochineal](https://www.ctan.org/pkg/cochineal), by 	Michael Sharpe
- Font [Roboto](https://github.com/googlefonts/roboto), by Christian Robertson
- Font [Iosevka](https://github.com/be5invis/Iosevka), by Belleve Invis


## Usage

The format is mostly markdown, except for these modifications:

- Use `\,` to insert a non-breaking thin-space.

- To insert a normal-width non-breaking space use `\~` or the actual character (macOS: `Alt + Space`, Linux: `???`, Windows: `???`).

- Use `\newpage` to start a new page in latex (which is ignored in html)

- It supports the latex `\begin{description}` environment by using the html equivalent `<dl><dt><dd>`

- The header always begins and ends with a line of at least five colons `:::::`
  - Each line inside the header has the format `KEY: VALUE`
  - Whitespace around the key and value is discarded
  - Each key is replaced in the template file. The placeholder has the format `<#_KEY_#>`
  - Don't use the `BODY` key, as it is reserved for the generated content
  - No other lines (including blank lines) are allowed. Except multi-line variables.
    - Each ML-variable begins with ` KEY : @@@ ` and ends with a line of just three at-signs (regex: `^@@@$`). No whitespace allowed.
    - multi-line variables may contain a line of colons (the header terminator is ignored here)

- You can add a reference to a title by adding `{#label}` after the title, e.g., `## Title {#title}`
  - other than that, all titles have implicit labels where spaces are replaced with dashes `My Title` becomes `my-title`
  - btw., you can also add classes this way `{.fullwidth}`

- The file prefix, e.g. `en`, is the template file identifier. This can be used for multi-language generation or different types of webpages.

- Use `@== content ==@` to place something in the border margin.
  - multi-line content is allowed.
  - the prefix `@=latex=` will display something in the pdf but not in html. (there is no equivalent for html-only)


## Limitations

This script has not been tested on Linux or Windows. However, Linux should work fine ... in theory.

### Known Issues

__#1__: If using URLs ins the margin, adding a newline before the href will add an unwanted space. e.g.:

```
@==
[multi line, super long name desc!](multi-line-url)
==@
```

will become:

```
|  multi line,
| super long
| name desc!
```

Fix for __#1__: place the beginning of the url on the same line `@==[]()...` (does not have to be closed on the same line)
