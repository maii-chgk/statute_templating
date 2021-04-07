all: statute.html statute.docx
statute.pdf: statute.md
	pandoc --variable mainfont=Georgia --pdf-engine=xelatex --number-sections --standalone $< -o $@
statute.docx statute.html: statute.md
	pandoc --number-sections --standalone $< -o $@
statute.md: statute.mustache.md *.md.mustache data.json
	mustache data.json statute.mustache.md > $@
clean:
	rm -f statute.md statute.pdf statute.docx statute.html
