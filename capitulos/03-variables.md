Variables
=========

Hasta ahora, cuando usamos `'puts'` para un texto o número, esto
desaparece. A lo que me refiero es que, si queremos imprimir algo dos
veces, necesitamos escribirlo dos veces:

*Código:*

    puts '...puedes decir eso de nuevo...'
    puts '...puedes decir eso de nuevo...'

*Resultado:*

    ...puedes decir eso de nuevo...
    ...puedes decir eso de nuevo...

Sería bueno si pudiesemos escribirlo solo una vez y quedárnoslo...
guardarlo en algún lado. Bueno, sí podemos, por supuesto; de otra
manera, ¡no lo hubiese mencionado!

Para guardar el texto en la memoria de tu computador, necesitamos darle
un nombre al texto. Los programadores se refieren frecuentemente a este
proceso como **asignación** y llaman a los nombres **variables**. Esta variable
puede ser cualquier secuencia de letras o números, pero el primer caracter
necesita ser minúscula. Probemos nuestro programa de nuevo, pero esta vez
voy a darle el nombre `'myString'` al texto (aunque podría haber usado cualquier
nombre, por ejemplo `'str'` or `'myOwnLittleString'` or `'henryTheEighth'`).

*Código:*

    myString = '...puedes decir eso de nuevo...'
    puts myString
    puts myString

*Resultado:*

    ...puedes decir eso de nuevo...
    ...puedes decir eso de nuevo...


En todo momento cuando haces referencia a `'myString'`, el programa usa en su
reemplazo `"'...puedes decir eso de nuevo...'"`. Puedes pensar en la variable
`'myString'` como "apuntando" al texto `"'...puedes decir eso de nuevo...'"`.
Este es un ejemplo un poco más interesante.

*Código:*

    name = 'Patricia Rosanna Jessica Mildred Oppenheimer'
    puts 'Me llamo ' + name + '.'
    puts 'Wow!  "' + name + '" es un nombre realmente largo!'

*Resultado:*

    Me llamo Patricia Rosanna Jessica Mildred Oppenheimer
    Wow! Patricia Rosanna Jessica Mildred Oppenheimer es un nombre realmente largo!

También, así como podemos **asignar** un objeto a una variable,
podemos **reasignar** un objeto diferente a esa variable
(Por eso es que las llamamos variables: porque varían.)

*Código:*

    composer = 'Mozart'
    puts composer + ' fue "el amo", en su día.'

    composer = 'Beethoven'
    puts 'Pero yo prefiero a ' + composer + ', personalmente.'

*Resultado:*

    Mozart fue "el amo", en su día.
    Pero yo prefiero a Beethoven, personalmente.

Por supuesto, las variables pueden apuntar a cualquier tipo de objeto, no
sólo texto:

*Código:*

    var = 'solo otro ' + 'texto'
    puts var

    var = 5 * (1+2)
    puts var

*Resultado:*

    solo otro texto
    15

De hecho, las variables pueden apuntar a casi cualquier cosa...
excepto otras variables. ¿Pero qué pasa si lo intentamos?

*Código:*

    var1 = 8
    var2 = var1
    puts var1
    puts var2

    puts ''

    var1 = 'ocho'
    puts var1
    puts var2

*Resultado:*

    8
    8

    ocho
    8

Primero, cuando tratamos de apuntar `var2` a `var1` en realidad apuntamos a `8` (que
es el valor al cual apuntaba `var1`). Luego cuando apuntamos `var1` a `'ocho'`, el
valor de `var2` no cambia ya que en realidad no estaba apuntando a `var1` sino a `8`.
Ahora que tenemos variables, números y textos, vamos a ver como [mezclarlos](https://github.com/rubyperu/aprende.a.programar/blob/master/capitulos/04-conversiones.md#mezclando).
