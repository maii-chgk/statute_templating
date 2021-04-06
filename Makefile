all: statute.html statute.docx
statute.pdf: statute.md
	pandoc --variable mainfont=Georgia --pdf-engine=xelatex --standalone $< -o $@
statute.docx statute.html: statute.md
	pandoc --standalone $< -o $@
statute.md: *.mustache.md data.json
	mustache data.json statute.mustache.md > $@
clean:
	rm -f statute.md statute.pdf statute.docx statute.html
