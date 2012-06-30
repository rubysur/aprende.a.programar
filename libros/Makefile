PDF_FLAGS = --fontsize 9.0 \
	--no-links \
	--no-toc \
	--charset iso-8859-1

MD = ../capitulos/00-inicio.html.markdown \
	../capitulos/01-numeros.html.markdown \
	../capitulos/02-textos.html.markdown \
	../capitulos/03-variables.html.markdown \
	../capitulos/04-conversiones.html.markdown \
	../capitulos/05-acerca-de-metodos.html.markdown \
	../capitulos/06-control-de-flujo.html.markdown \
	../capitulos/07-matrices.html.markdown \
	../capitulos/08-metodos-propios.html.markdown \
	../capitulos/09-clases.html.markdown \
	../capitulos/10-bloques-y-procs.html.markdown \
	../capitulos/11-despues-de-esta-guia.html.markdown

HTML = $(MD:.markdown=.html)

all: aap.html aap.pdf aap.mobi aap.epub

regenerate: clean all
	git commit -a -m 'Regenerando libros' && echo done

aap.pdf: $(HTML)
	@echo "\n... generando $@"
	ebook-convert aap.html aap.pdf \
		--title "Aprende a Programar" \
		--authors "Chris Pine" \
		--language es \
		--cover imagenes/cover.jpg \
		--preserve-cover-aspect-ratio 

aap.html: $(HTML)
	@echo "\n... generando $@"
	cat $(HTML) > aap.html

%.html: %.markdown
	ronn --pipe --fragment $< \
		| sed -E 's/<h1>([^ ]+) - /<h1>/' \
		> $@
aap.mobi:
	@echo "\n... generando $@"
	ebook-convert aap.html aap.mobi --output-profile kindle --title "Aprende a Programar" --authors "Chris Pine" --cover imagenes/cover.jpg 

aap.epub:
	@echo "\n... generando $@"
	ebook-convert aap.html aap.epub --title "Aprende a Programar" --authors "Chris Pine" --cover imagenes/cover.jpg 

view: aap.pdf
	open aap.pdf

clean:
	rm -f aap.*

.PHONY: view clean regenerate
