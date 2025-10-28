SHELL := /bin/bash

.PHONY: pdf pdf-2up clean distclean

pdf:
	@if command -v latexmk >/dev/null 2>&1 && command -v xelatex >/dev/null 2>&1; then \
		latexmk -xelatex -interaction=nonstopmode -halt-on-error cheatsheet.tex; \
	elif command -v latexmk >/dev/null 2>&1; then \
		latexmk -pdf -interaction=nonstopmode -halt-on-error cheatsheet.tex; \
	elif command -v xelatex >/dev/null 2>&1; then \
		xelatex -interaction=nonstopmode cheatsheet.tex >/dev/null; \
		xelatex -interaction=nonstopmode cheatsheet.tex >/dev/null; \
	elif command -v pdflatex >/dev/null 2>&1; then \
		pdflatex -interaction=nonstopmode cheatsheet.tex >/dev/null; \
		pdflatex -interaction=nonstopmode cheatsheet.tex >/dev/null; \
	elif command -v tectonic >/dev/null 2>&1; then \
		tectonic -X compile cheatsheet.tex; \
	else \
		echo "No LaTeX compiler found (latexmk/xelatex/pdflatex/tectonic)."; exit 1; \
	fi

pdf-2up: pdf
	@if command -v latexmk >/dev/null 2>&1; then \
		latexmk -pdf -interaction=nonstopmode -halt-on-error two-up.tex; \
	elif command -v pdflatex >/dev/null 2>&1; then \
		pdflatex -interaction=nonstopmode two-up.tex >/dev/null; \
	elif command -v tectonic >/dev/null 2>&1; then \
		tectonic -X compile two-up.tex; \
	else \
		echo "No LaTeX compiler found (latexmk/pdflatex/tectonic)."; exit 1; \
	fi

clean:
	@rm -f *.aux *.log *.out *.toc *.fls *.fdb_latexmk *.synctex.gz

distclean: clean
	@rm -f cheatsheet.pdf two-up.pdf
