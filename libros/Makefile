MD = ../capitulos/00-inicio.md \
	../capitulos/01-numeros.md \
	../capitulos/02-textos.md \
	../capitulos/03-variables.md \
	../capitulos/04-conversiones.md \
	../capitulos/05-acerca-de-metodos.md \
	../capitulos/06-control-de-flujo.md \
	../capitulos/07-matrices.md \
	../capitulos/08-metodos-propios.md \
	../capitulos/09-clases.md \
	../capitulos/10-bloques-y-procs.md \
	../capitulos/11-despues-de-esta-guia.md
	
HTML = $(MD:.md=.html)

all: aap.html aap.mobi aap.epub clear

regenerate: clean all
	git commit -a -m "Regenerando libros" && echo done

aap.html: $(HTML)
	@echo "\n... generando $@"
	echo $(HTML) > aap.html
	cat cabecera.html $(HTML) > aap.html

%.html: %.md
	ronn --pipe --fragment $< | sed -r 's/<h1>([^ ]+) - /<h1>/' > $@

aap.mobi:
	@echo "\n... generando $@"
	ebook-convert aap.html aap.mobi \
	--output-profile kindle \
	--title "Aprende a Programar" \
	--authors "Chris Pine" \
	--cover imagenes/cover.jpg

aap.epub:
	@echo "\n... generando $@"
	ebook-convert aap.html aap.epub \
	--title "Aprende a Programar" \
	--no-default-epub-cover \
	--authors "Chris Pine" \
	--language es \
	--cover imagenes/cover.jpg

clean:
	rm -f aap.*
	rm ../capitulos/*.html

clear:
	rm ../capitulos/*.html

.PHONY: view clean regenerate
