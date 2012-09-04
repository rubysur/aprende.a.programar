# Aprende a Programar

Este proyecto nace con la idea de traducir al español el libro de Chris Pine
llamado "Learn To Program" (que en español significa "Aprende a Programar").
Este libro utiliza un lenguaje llamado Ruby para enseñar los conceptos de
programación. Todos los lenguajes de programación comparten estos casi todos
estos conceptos, pero Ruby es un lenguaje particularmente fácil e intuitivo.

El autor liberó el contenido del libro y nos permitió traducirlo. El ha escrito
una segunda versión, y puede ser comprada (en inglés) en
<http://pragprog.com/book/ltp2/learn-to-program>.

## Plan:

Ya se han traducido todos los capítulos. Ahora estamos armando el sitio web.
Estas son las decisiones tomadas:

1. El sitio estará en http://www.aprendeaprogramar.pe (auspiciado por
[RubyPeru](http://ruby.pe))
2. La página será desarrollada con [stasis](http://stasis.me) y se usará
sintáxis coloeada por rainbow
3. La página será estática, con los ejemplos en archivos para descargar.
4. Terminología: _string_=texto, _array_=matriz, _float_=flotante,
_integer_=entero
5. El discurso del libro es coloquial por lo que se usará "TÚ".
6. El código y los resultados deben colocarse en cuadros separados.
7. El proyecto estará en un nuevo proyecto de Github (mudando el anterior) en
<https://github.com/rubyperu/aprendeaprogramar.pe">

## How To:

Ejecuta en la terminal:

    bundle install
    bundle exec stasis -d 3000

Abre la dirección http://localhost:3000/ en tu navegador preferido.

## Agradecimientos:

En primer lugar, obviamente al autor, por dejarnos usar el contenido libremente,
a [Diego Algorta](http://oboxodo.com) por haber tenido la iniciativa y dar los
primeros pasos, a [César Diaz](https://github.com/cesarediaz),
[Lucas Florio](https://github.com/lucasefe) y a la comunidad de
[Ruby Perú](http://ruby.pe) por ayudar con la traducción, actualización y
mantenimiento del contenido.
