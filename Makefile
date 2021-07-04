.PHONY: help all clean

help:
	@echo
	@echo '  run  make input.{html,tex,pdf}'
	@echo

%.html: %.markdown src/template-*.html src/rules-html-pre.sed src/rules-html-post.sed
	@echo
	@echo "Build HTML: $*.html"
	n="$*"; python3 src/temp_prepare.py src/template-$${n%%-*}.html $*.markdown $*.html.1.tmp
	sed -f src/rules-html-pre.sed $*.markdown.tmp | pandoc -t html -o $*.html.2.tmp
	sed -f src/rules-html-post.sed $*.html.2.tmp > $*.html
	python3 src/temp_combine.py $*.html.1.tmp $*.html
	rm -f $*.markdown.tmp $*.html.1.tmp $*.html.2.tmp
	cp $*.html bin/

%.tex: %.markdown src/template-*.tex src/rules-tex-pre.sed src/rules-tex-post.sed
	@echo
	@echo "Build TEX: $*.tex"
	n="$*"; python3 src/temp_prepare.py src/template-$${n%%-*}.tex $*.markdown $*.tex.1.tmp
	# heading shift needed because tufte doesnt have subsubsection
	sed -f src/rules-tex-pre.sed $*.markdown.tmp | pandoc --shift-heading-level-by=-1 -t latex -o $*.tex.2.tmp
	sed -f src/rules-tex-post.sed $*.tex.2.tmp > $*.tex
	python3 src/temp_combine.py $*.tex.1.tmp $*.tex
	rm -f $*.markdown.tmp $*.tex.1.tmp $*.tex.2.tmp

%.pdf: %.tex
	@echo
	@echo "Build PDF: $*.pdf"
	cp $*.tex bin/
	cd bin && xelatex $*.tex # && xelatex $*.tex
	rm -f bin/*.{aux,log,out,toc,synctex\(busy\),synctex.gz}  # clean up
	rm -f bin/$*.tex  # but keep tex in root
	mv bin/$*.pdf .

all:
	for x in *.markdown; do make "$${x/.markdown}".{html,pdf}; done

clean:
	for x in *.markdown; do rm -f "$${x/.markdown}".{html,tex}; done
