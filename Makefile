all: statute.pdf statute.html statute.docx
statute.pdf: statute.md
	pandoc --variable mainfont=Georgia --pdf-engine=xelatex --standalone $< -o $@
statute.docx statute.html: statute.md
	pandoc --standalone $< -o $@
statute.md: *.mustache.md data.json
	haskell-mustache -t . statute.mustache.md data.json > $@
clean:
	rm statute.md statute.pdf statute.docx statute.html
