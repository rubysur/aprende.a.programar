Conversiones
============

Hemos revisado distintos tipos de objetos ([números](/aprende.a.programar/capitulos/numeros.html)
y [textos](/aprende.a.programar/capitulos/textos.html))
y hemos hecho que [variables](/aprende.a.programar/capitulos/variables.html)
apunten a ellos; lo que queremos hacer después es que funcionen todos juntos.

Hemos visto que si queremos que un programa imprima `25`, lo que sigue ***no***
funciona, porque no puedes sumar números y texto:

*Código:*

```ruby
var1 = 2
var2 = '5'

puts var1 + var2
```

*Resultado:*

```html
in `+': String can't be coerced into Fixnum (TypeError)
```

Parte del problema es que tu computadora no sabe si estabas tratando de obtener `7`
(`2 + 5`) o si querías obtener `'25'` (`'2' + '5'`).

Antes de poderlos sumar, necesitamos alguna forma de conseguir la representación
textual (en 'letras') de `var1`, o la representación numérica de `var2`.

## Conversiones

Para obtener la representación en texto de un objeto, simplemente escribiendo `.to_s`
después del objeto:

*Código:*

```ruby
var1 = 2
var2 = '5'

puts var1.to_s + var2
```

*Resultado:*

```html
25
```

De la misma manera, `to_i` devuelve la versión numérica entera de un objeto y `to_f`
devuelve la versión de punto flotante, o sea la que lleva decimales. Veamos que hacen
estos tres métodos (y lo que *no* hacen) un poco más de cerca:

*Código:*

```ruby
var1 = 2
var2 = '5'

puts var1.to_s + var2
puts var1 + var2.to_i
```

*Resultado:*

```html
25
7
```

Nota que, inclusive después de que obtuvimos la versión en texto de `var1` al llamar
`to_s`, `var1` siempre apuntó a `2`, y nunca a `'2'`. A menos que reasignes
explícitamente `var1` (lo que requiere de un signo `=`), apuntará a `2` durante la
duración del programa.

Ahora probemos conversiones más interesantes (y un poco raras):

*Código:*

```ruby
puts '15'.to_f
puts '99.999'.to_f
puts '99.999'.to_i
puts '5 es mi número favorito.'.to_i
puts '¿Quién pregunta acerca de 5 o lo que sea?'.to_i
puts 'Tu mamá hizo.'.to_f
puts 'fibroso'.to_s
puts 3.to_i
```

*Resultado:*

```html
15.0
99.999
99
5
0
0.0
fibroso
3
```

Ésto probablemente te ha sorprendido un poco. El primero es bastante estándar,
devolviendo `15.0`. Después de eso, convertimos el texto `'99.999'` a un número de
punto flotante y a un entero. El primero hizo lo que esperábamos; el entero fue,
como siempre, redondeado hacia abajo.

Luego, tuvimos ejemplos de algunos textos... *inusuales*...  convertidos a números
`to_i` ignora lo primero que no entienda, y el resto del texto a partir de ahí. Así
que lo primero va a ser convertido a `5`, pero los otros, ya que comenzaban con letras,
fueron ignorados completamente... así que la computadora simplemente elige usar cero.

Finalmente, vimos que las últimas dos conversiones no hacían nada, tal como
esperábamos.

Hay algo extraño en nuestro método favorito... Mira esto:

*Código:*

```ruby
puts 20
puts 20.to_s
puts '20'
```

*Resultado:*

```html
20
20
20
```

¿Por qué estas tres líneas retornan el mismo resultado? Bueno, las últimas dos deberían,
ya que `20.to_s` *es* `'20'`. Pero, ¿qué pasa con la primera, el entero `20`? Para tal
caso, ¿qué significa escribir *el entero* 20? Cuando escribes *2* y luego *0* en un
papel, estás escribiendo texto, no un entero. *El entero* 20 es el número de dedos
que tengo; no es *2* seguido de un *0*.

Bueno, ahí está el secreto de nuestro amigo `puts`. Antes de que `puts` trate de
imprimir un objeto, usa `to_s` para obtener la versión en texto de ese objeto. De
hecho, la *s* en `puts` significa *string* (que en español significa texto); `puts`
realmente significa *put string* (que en español significa *imprimir texto*).

Esto puede no parecer muy emocionante ahora, pero hay muchos, *muchos* objetos en
Ruby (¡inclusive vas a aprender a crear tus propios objetos!), y es bueno saber que
va a pasar cuando trates de ejecutar `puts` con un objeto bastante raro, como la
foto de tu abuela o un archivo de música, etc. Pero eso vendrá después ...

Mientras tanto, tenemos unos cuantos métodos para ti, y ellos nos permiten
escribir todo tipo de programas divertidos...

Los Métodos `gets` y `chomp`
----------------------------

Si `puts` significa *put string*, estoy seguro que puedes adivinar que significa
`gets`, *get string* (recibir texto). Y así como `puts` siempre devuelve texto,
`gets` sólo funciona con texto. ¿Y de dónde lo recibe?

¡De ti! Bueno, de tu teclado, en realidad. Ya que tu teclado sólo escribe texto,
todo funciona bien. Lo que realmente pasa es que `gets` simplemente
lee todo lo que tipeas hasta que presionas `Enter`. Intentémoslo:

*Código:*

```ruby
puts gets
```
*Resultado:*

```html
*¿Hay eco aquí?*
¿Hay eco aquí?
```

Por supuesto, lo que sea que escribas simplemente será impreso en pantalla por ti.
Ejecútalo unas cuantas veces e intenta escribir cosas distintas.

¡Ahora podemos escribir programas interactivos! En este caso, escribe tu
nombre y te saludará:

```ruby
puts 'Hola, ¿cuál es tu nombre?'
name = gets
puts '¿Tu nombre es ' + name + '?  ¡Es un nombre adorable!'
puts 'Encantado de conocerte, ' + name + '.  :)'
```

*Uhm!* Acabo de ejecutarlo, escribí mi nombre y esto es lo que he obtenido:

```html
Hola, ¿cuál es tu nombre?
*Chris*
¿Tu nombre es Chris
?  ¡Es un nombre adorable!
Encantado de conocerte, Chris
.  :)
```

Hmmm... parece que cuando escribí las letras *C*, *h*, *r*, *i*, *s*, y luego presioné
`Enter`, `gets` recibió todas las letras de mi nombre *y* el `Enter`! Afortunadamente,
hay un método para este tipo de cosas: `chomp`. Ésto elimina cualquier `Enter`
al final del texto. Intentémoslo de nuevo, pero con `chomp` para
que nos ayude:

*Código:*

```ruby
puts 'Hola, ¿cuál es tu nombre?'
name = gets.chomp
puts '¿Tu nombre es ' + name + '?  ¡Es un nombre adorable!'
puts 'Encantado de conocerte, ' + name + '.  :)'
```

*Resultado:*

```html
Hola, ¿cuál es tu nombre?
Chris
¿Tu nombre es Chris?  ¡Es un nombre adorable!
Encantado de conocerte, Chris.  :)
```

¡Mucho mejor! Nota que ya que `name` apunta a `gets.chomp`, no tenemos que usar
`name.chomp`; `name` ya fue procesado por `chomp`.

Algunas cosas por intentar
--------------------------

* Escribe un programa que pregunte por el nombre de una persona,
luego el segundo nombre y luego el apellido. Finalmente, debería saludar
a la persona con el nombre completo.

* Escribe un programa que pregunte por el número favorito del
usuario. Haz que tu programa agregue un número, luego sugiere el resultado
como el número favorito pero _más grande y mejorado_ (Pero hazlo con tacto).

Una vez que hayas terminado los dos programas (y otros que hayas
intentado), tratemos de aprender más (y más sobre)
[¡métodos!](/aprende.a.programar/capitulos/metodos.html).
