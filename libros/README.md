# Aprende a Programar
Traducción al español del libro *Learn to Program*

## Authors
Chris Pine 

## Formats
Las traducciones están escritas en archivos markdown ubicadas en ./capitulos, los cuales
se convertirán a varios formatos que incluyen MOBI, EPUB y por supuesto HTML.

## Para generar todos los formatos:
    make

## Para generar en HTML
Se requiere para generar en HTML tener la gema ronn.

    gem install ronn
    make aap.html

## Para generar en formato EPUB:
Se requiere tener calibre y haberlo generado en HTML.

    make aap.epub
## Para generar en formato MOBI:
Se requiere tener calibre y haberlo generado en HTML.

    make aap.mobi

## Acerca del formato PDF:
Se puede utilizar htmldoc para generar el archivo PDF, lamentablemente la versión estable de htmldoc no soporta UTF-8 y por ello el archivo resultante muestra las palabras acentúadas en forma incorrecta. Se sugiere usar el archivo HTML para imprimir a un archivo PDF.

