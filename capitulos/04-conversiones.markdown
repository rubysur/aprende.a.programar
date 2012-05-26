# Conversiones

Hemos revisado distintos tipos de objetos ([números]() y [texto]()), y hemos hecho que
[variables]() apunten a ellos; lo que queremos hacer después es que funcionen
todos juntos.

Hemos visto que si queremos que un programa imprima `25`, lo que sigue ***no***
funciona, porque no puedes sumar números y texto:

    var1 = 2
    var2 = '5'
  
    puts var1 + var2
    # => TypeError: String can't be coerced into Fixnum

Parte del problema es que tu computadora no sabe si estabas tratando de obtener `7`
(`2 + 5`), o si querías obtener `'25'` (`'2' + '5'`).

Antes de poderlos sumar, necesitamos alguna forma de conseguir la representación
textual (en 'letras') de `var1`, o la representación numérica de `var2`.

## Conversiones

Para obtener la representación en texto de un objeto, simplemente escribimos `.to_s`
después de el:

    var1 = 2
    var2 = '5'
    
    puts var1.to_s + var2
    # => 25

De la misma manera,, `to_i` devuelve la versión numérica entera de un objeto y `to_f`
devuelve la versión de punto flotante, o sea, la que lleva decimales. Veamos que hacen
estos tres métodos (y lo que *no* hacen) un poco más de cerca:

    var1 = 2
    var2 = '5'
    
    puts var1.to_s + var2
    # => 25

    puts var1 + var2.to_i
    # => 7

Nota que, inclusive después de que obtuvimos la versión en texto de `var1` al llamar
`to_s`, `var1` siempre apuntó a `2`, y nunca a `'2'`. A menos que reasignes
explícitamente `var1` (lo que requiere de un signo `=`), apuntará a `2` durante la
duración del programa.

Ahora probemos conversiones más interesantes (y un poco raras):

    puts '15'.to_f
    # => 15.0

    puts '99.999'.to_f
    # => 99.999

    puts '99.999'.to_i
    # => 99

    puts '5 is my favorite number!'.to_i
    # => 5

    puts 'Who asked you about 5 or whatever?'.to_i
    # => 0

    puts 'Your momma did.'.to_f
    # => 0.0

    puts 'stringy'.to_s
    # => stringy

    puts 3.to_i
    # => 3

Esto probablemente te ha sorprendido un poco. El primero es bastante estándar,
devolviendo `15.0`. Después de eso, convertimos el texto `'99.999'` a un número de
punto flotante y a un entero. El primero hizo lo que esperábamos; el entero fue,
como siempre, redondeado hacia abajo.

Luego, tuvimos ejemplos de algunos textos... *inusuales* ...  convertidos a números
`to_i` ignora lo primero que no entienda, y el resto del texto a partir de ahí. Así
que lo primero va a ser convertido a `5`, pero los otros, ya que comenzaban con letras,
fueron ignorados completamente... así que la computadora simplemente elige usar cero.

Finalmente, vimos que las últimas dos conversiones no hacían nada, tal como
esperábamos.

Hay algo extraño en nuestro método favorito... Mira esto:

    puts 20
    # => 20

    puts 20.to_s
    # => 20

    puts '20'
    # => 20

¿Por qué estas tres líneas retornan el mismo resultado? Bueno, las últimas dos deberían,
ya que `20.to_s` *es* `'20'`. Pero, ¿Qué pasa con la primera, el entero `20`}? Para tal
caso, ¿Qué significa escribir *el entero* 20? Cuando escribes *2* y luego *0* en un
papel, estas escribiendo texto, no un entero. *El entero* 20 es el número de dedos
que tengo; no es *2* seguido de un *0*.

Bueno, ahí está el secreto de nuestro amigo, `puts`: Antes de que `puts` trate de
imprimir un objecto, usa `to_s` para obtener la vesión en texto de ese objeto. De
hecho, la *s* en `puts` significa *string* (que en español significa texto); `puts`
realmente significa *put string* (que en español significa imprimir texto).

Esto puede no parecer muy emocionante ahora, pero hay muchos, *muchos* objetos en
Ruby (¡inclusive vas a aprender a crear tus propios objetos!), y es bueno saber que
va a pasar cuando trates de ejecutar `puts` con un objeto bastante raro, como la
foto de tu abuela, o un archivo de música, etc. Pero eso vendrá después...

Mientras tanto, tenemos unos cuantos métodos para ti, y ellos nos permiten
escribir todo tipo de programas divertidos...

## Los Métodos `GETS` and `CHOMP`

Si `puts` significa *put string*, estoy seguro que puedes adivinar que significa
`gets` (recibir texto). Y así como `puts` siempre devuelve texto, `gets` solo funciona
con texto. ¿Y de donde lo recibe?

¡De ti! Bueno, de tu teclado, en realidad. Ya que tu teclado solo escribe texto,
todo funciona bien. Lo que realmente pasa es que `gets` simplemente espera,
leyendo todo lo que tipeas hasta que presionas `Enter`. Intentémoslo:

    puts gets

    > Is there an echo in here?
    # => Is there an echo in here? 

Por supuesto, lo que sea que escribas simplemente será impreso en pantalla por ti.
Ejecútalo unas cuantas veces e intenta escribir cosas distintas.

¡Ahora podemos escribir programas interactivos! En este caso, escribe tu
nombre y te saludará:

      puts 'Hello there, and what\'s your name?'
      name = gets
      puts 'Your name is ' + name + '?  What a lovely name!'
      puts 'Pleased to meet you, ' + name + '.  :)'

*Eek!* I just ran it, I typed in my name, and this is what happened:

      # => Hello there, and what's your name?
      > Chris
      # => Your name is Chris? What a lovely name!
      # => Pleased to meet you, Chris. :)

Hmmm... parece que cuanto escribí las letras *C*, *h*, *r*, *i*, *s*, y luego presioné
`Enter`, `gets` recibió todas las letras de mi nombre *y* el <kbd>Enter</kbd>! Afortunadamente, hay un método para este
tipo de cosas: `chomp`. Esto elimina cualquier <kbd>Enter</kbd>
al final del texto. Intentémoslo de nuevo, pero con `chomp` para
que nos ayude:

    puts 'Hello there, and what\\'s your name?'
    name = gets.chomp
    puts 'Your name is ' + name + '?  What a lovely name!'
    puts 'Pleased to meet you, ' + name + '.  :)'

¡Mucho mejor! Nota que ya que `name` apunta a
`gets.chomp`, no tenemos que usar `name.chomp`;
`name` ya fue procesado por `chomp.

## Algunas cosas para intentar

* Escribe un programa que pregunta por el nombre de una persona,
luego el segundo nombre y luego el apellido. Finalemente, debería saludar
a la persona con el nombre completo.

* Escribir un programa que pregunta por el número favorito del
usuario. Has que tu programa agregue un número, luego sugiera el resultado
como el número favorito pero <em>más grande y mejorado</em>.
(Pero hazlo con tacto.)

Una vez que hayas terminado los dos programas (y otroas que hayas
intentado), tratemos de aprender más (y más sobre ellos)
<a href="https://github.com/rubyperu/aprende_a_programar/blob/master/capitulos/05_acerca_de_metodos.markdown">
métodos</a>.
