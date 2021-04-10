all: statute.ru.html statute.ru.docx statute.de.html statute.de.docx
%.pdf: %.md
	pandoc --variable mainfont=Georgia --pdf-engine=xelatex --number-sections --standalone $< -o $@
%.docx %.html: %.md
	pandoc --number-sections --standalone $< -o $@
statute.ru.md: *.ru.md.mustache data.json
	mustache data.json statute.ru.md.mustache > $@
statute.de.md: *.de.md.mustache data.json
	mustache data.json statute.de.md.mustache > $@
clean:
	rm -f statute.*.md statute.*.pdf statute.*.docx statute.*.html
