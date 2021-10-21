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
- Font [Piazzolla](https://github.com/huertatipografica/piazzolla), by Juan Pablo del Peral


## Usage

The format is mostly markdown, except for these modifications:

- Whitespace
  - Use `\,` to insert a non-breaking thin-space.
  - Use `\~` or the actual character to insert a normal-width non-breaking space (unicode nbsp in macOS: `Alt + Space`, Linux: `???`, Windows: `???`).
  - Use `\newpage` to start a new page in latex (which is ignored in html)

- Use `@== CONTENT ==@` to create a margin element; Text or image or whatever.
  - multi-line content allowed.
  - the prefix `@=latex=` will display its content in pdf only. There is no html-prefix equivalent.

- Use `####` to create paragraphs and `#####` for paragraph-like sections. The latter are displayed in the margin. Like an index for quick reference. In mobile html they are normal `h5` headings.
  - Of course `#`, `##`, and `###` translate to `h1` to `h3` headings.

- You can add a reference-id to a title by adding `{#label}` after the title, e.g., `## Title {#title}`
  - other than that, all titles have implicit labels where spaces are replaced with dashes `My Title` becomes `my-title`
  - btw., you can also add classes this way `{.fullwidth}`
  - Use normal markdown syntax `[name](#ref)` to link to a section (works in both, html and latex)

- Use `<dl><dt><dd>` to create definition lists. This will be translated to a latex `\begin{description}` environment.


## Templating

- The file prefix, e.g. `en`, is the template file identifier. This can be used for multi-language generation or different types of webpages.

- The header always begins and ends with a line of at least five colons `:::::`
  - Each line inside the header has the format `KEY: VALUE`
  - Whitespace around the key and value is discarded
  - Each key is replaced in the template file. The placeholder has the format `<#_KEY_#>`
  - Don't use the `BODY` key, as it is reserved for the generated content
  - No other lines (including blank lines) are allowed. Except multi-line variables.
    - Each ML-variable begins with ` KEY : @@@ ` and ends with a line of just three at-signs (regex: `^@@@$`). No whitespace allowed.
    - multi-line variables may contain a line of colons (the header terminator is ignored here)


## Limitations

This script has not been tested on Linux or Windows. However, Linux should work fine ... in theory.
