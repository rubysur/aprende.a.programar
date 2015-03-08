Condicionales
=============

Ahhhh, control de flujo. Acá es donde todo empieza a encajar. A pesar que este
capítulo es más corto y facil que el capítulo de [métodos](/aprende.a.programar/capitulos/metodos.html),
te abrirá un mundo nuevo de posibilidades para programar.

Luego de este capítulo, seremos capaces de escribir programas realmente interactivos; previamente
hemos creado programas que _dicen_ distintas cosas dependiente de lo que ingreses en
tu teclado, pero luego de este capítulo estos también _harán_ distintas cosas. Pero
antes que podamos hacer eso, necesitamos ser capaces de comparar objectos en nuestros
programas. Necesitamos...

Métodos de comparación
----------------------

Avancemos rápidamente por esta sección para que podamos ir a la siguiente,
**Ramificaciones**, donde todas las cosas geniales ocurren. Entonces, para ver
si un objeto es mayor o menor que otro, usaremos los métodos `>` y `<`, así:

*Código:*

```ruby
puts 1 > 2
puts 1 < 2
```

*Resultado:*

```html
false
true
```

Sin problemas. De igual manera, podemos identificar si un objeto es mayor-o-igual-que otro o
menor-o-igual-que con los métodos `>=` y `<=`

*Código:*

```ruby
puts 5 >= 5
puts 5 <= 4
```

*Resultado:*

```html
true
false
```

Finalmente, podemos ver si dos objetos son iguales o no utilizando `==` (que
significa "¿son éstos iguales?") y `!=` (que significa "¿son éstos diferentes?").

Es importante no confundir `=` con `==`. `=` se utiliza para decirle a una variable
a que objeto apuntar (asignación) y `==` se utiliza para responder la pregunta:
"¿Son estos dos objetos iguales?".

*Código:*

```ruby
puts 1 == 1
puts 2 != 1
```

*Resultado:*

```html
true
true
```
Por supuesto, podemos comparar textos también. Cuando los textos se comparan,
comparan su _ordenamiento lexicográfico_, que básicamente significa su orden en
un diccionario. `gato` aparece antes que `perro` en el diccionario, así que:

*Código:*

```ruby
puts 'gato' < 'perro'
```

*Resultado:*

```html
true
```

Sin embargo, hay algo que tener en cuenta: la manera en que las computadoras
normalmente asumen que las letras mayúsculas vienen antes que las letras
minúsculas (Así es como almacenan los caracteres en las fuentes, por ejemplo:
los caracteres en mayúscula primero y en minúscula después).

Esto significa que pensará que `'Zoológico'` aparece antes que `'ave'`, así que si
quieres encontrar que palabra aparecería antes en un diccionario real, asegúrate de
utilizar `downcase` (o `upcase` o `capitalize`) en ambas palabras antes de tratar
de compararlas.

Un último comentario antes de revisar **Ramificaciones**: Los métodos de comparación
no nos están dando los textos `'true'` o `'false'` ("verdadero" y "falso" en español);
nos están dando los objetos especiales `true` y `false`. (Por supuesto, `true.to_s`
nos devuelve `'true'`, que es por lo que `puts` imprimió `'true'`.)

`true` y `false` se utilizan todo el tiempo en...

Ramificaciones
--------------

Las Ramificaciones son un concepto simple, pero poderoso. De hecho, es tan simple que no necesito explicarlo,
solo te lo mostraré:

*Código:*

```ruby
puts 'Hola, ¿cual es tu nombre?'
name = gets.chomp
puts 'Hola, ' + name + '.'
if name == 'Chris'
  puts '¡Que nombre tan hermoso!'
end
```

*si respondemos 'Chris':*

```html
Hola, ¿cual es tu nombre?
Chris
Hola, Chris.
¡Que nombre tan hermoso!
```

*pero si ponemos otro nombre:*

```html
Hola, ¿cual es tu nombre?
Chewbacca
Hola, Chewbacca.
```

Y eso es una ramificación. Si lo que viene luego del `if` es `true` (es decir, si es
cierto), se ejecutará el código entre el `if` y el `end`. Y no se ejecutará si lo que
viene luego del `if` es `false` (falso). Más facil imposible.

He indentado el código entre `if` y el `end` solo porque me parece que es más
facil leer las ramificaciones de esa manera. Casi todos los programadores lo hacen
así, sin importar el lenguaje en que estén programando. No parece ser de mucha ayuda
en este ejemplo, pero cuando las cosas se vuelven complejas, es una gran diferencia.

Varias veces nos gustaría que un programa haga alguna cosa si una expresión
es `true`, y otra cosa si es que es `false`.  Para eso es que existe `else`:

*Código:*

```ruby
puts 'Soy un adivino. Dime tu nombre:'
name = gets.chomp
if name == 'Chris'
  puts 'Veo grandes cosas en tu futuro.'
else
  puts 'Tu futuro es... ¡Oh! ¡Mira la hora!'
  puts 'Realmente debo irme, ¡lo siento!'
end
```

*si respondemos 'Chris':*

```html
Soy un adivino. Dime tu nombre:
Chris
Veo grandes cosas en tu futuro.
```

*Si tratamos con un nombre diferente:*

```html
Soy un adivino. Dime tu nombre:
Ringo
Tu futuro es... ¡Oh! ¡Mira la hora!
Realmente debo irme, ¡lo siento!
```

Las ramificaciones son como encontrar una bifurcación en el código:
¿Seguimos el camino de las personas cuyo `name == 'Chris'` o el camino de
aquellas que no (`else`)?

Y como las ramas de un árbol, puedes tener ramificaciones que a su vez tengan
otras ramificaciones:

*Código:*

```ruby
puts 'Hola, y bienvenido a la clase de 7mo año.'
puts 'Me llamo Mrs. Gabbard. ¿Tú nombre es...?'
nombre = gets.chomp

if nombre == nombre.capitalize
  puts 'Por favor, toma asiento ' + nombre + '.'
else
  puts '¿' + nombre + '? Quieres decir ' + nombre.capitalize + ', ¿cierto?'
  puts '¿No sabes escribir tu propio nombre?'
  respuesta = gets.chomp

  if respuesta.downcase == 'si'
    puts '¡Hum!  Bueno, ¡siéntese!'
  else
    puts '¡SALGA DEL SALON!'
  end
end
```

*si respondemos el nombre en minúsculas:*

```html
Hola, y bienvenido a la clase de 7mo año.
Me llamo Mrs. Gabbard. ¿Tú nombre es...?
chris
¿chris? Quieres decir Chris, ¿cierto?
¿No sabes escribir tu propio nombre?
si
¡Hum!  Bueno, ¡siéntese!
```

*y si respondemos el nombre como debe ser:*

```html
Hola, y bienvenido a la clase de 7mo año.
Me llamo Mrs. Gabbard. ¿Tú nombre es...?
Chris
Por favor, toma asiento Chris.
```

Algunas veces puede ser algo confuso entender donde todos los `if`s, `else`s, y
`end`s van. Lo que yo hago es escribir el `end` _al mismo tiempo_ que escribo el
`if`.  Así es que como se veía al principio el programa de arriba según lo iba
escribiendo:

```ruby
puts 'Hola, y bienvenido a la clase de 7mo año.'
puts 'Me llamo Mrs. Gabbard. ¿Tú nombre es...?'
nombre = gets.chomp

if nombre == nombre.capitalize
else
end
```

Entonces lo llené con _comentarios_, cosas en el código que la computadora ignorará:

```ruby
puts 'Hola, y bienvenido a la clase de 7mo año.'
puts 'Me llamo Mrs. Gabbard. ¿Tú nombre es...?'
nombre = gets.chomp

if nombre == nombre.capitalize
  #  Me trata como una persona normal.
else
  #  Se vuelve loca.
end
```

Todo lo que aparezca luego de un `#` se considera un comentario  (a menos, claro,
que estés en un texto). Después de eso, reemplacé los comentarios con
código funcional. Algunas personas prefieren dejar los comentarios; personalmente,
pienso que un código bien escrito normalmente habla por si mismo. Solía utilizar más
comentarios, pero mientras más "fluido" me volvía con Ruby, menos los utilizo.
Actualmente los encuentro algo distractivos la mayor parte del tiempo. Es una opción
personal; tú encontrarás tu propio estilo (siempre en evolución). Así que mi siguiente
paso se veía así:

```ruby
puts 'Hola, y bienvenido a la clase de 7mo año.'
puts 'Me llamo Mrs. Gabbard. ¿Tú nombre es...?'
nombre = gets.chomp

if nombre == nombre.capitalize
  puts 'Por favor, toma asiento ' + nombre + '.'
else
  puts '¿' + nombre + '? Quieres decir ' + nombre.capitalize + ', ¿cierto?'
  puts '¿No sabes escribir tu propio nombre?'
  respuesta = gets.chomp

  if respuesta.downcase == 'si'
  else
  end
end
```

De nuevo, escribí los `if`, `else`, y `end` juntos. Realmente me ayuda para saber
"donde estoy" en el código. Tambien permite que el trabajo parezca más sencillo ya que
me permite enfocarme en una pequeña parte, como en llenar el código entre `if` y el
`else`. El otro beneficio de realizarlo de esta manera es que el computador puede entender
el programa  en cualquier etapa. Cualquiera de las versiones incompletas del programa
que te mostré se podrían ejecutar. No estaban finalizadas, pero eran programas funcionales.
De esa manera, podría probarlo mientras lo escribo, lo que ayuda a ver como voy avanzando
y donde aún necesito trabajar. Cuando pase todas las pruebas sé que he terminado.

Estos tipos te ayudarán a escribir programas con ramificaciones pero también te ayudarán
con otros tipos de control de flujo:

Bucles
------

A veces querrás que tu computadora haga la misma acción una y otra vez &mdash;después
de todo se supone que en eso son buenas las computadoras&mdash;.

Cuando le dices a la computadora que siga repitiendo algo, también debes decirle cuando
parar. Las computadoras nunca se aburren asi que si no le indicas cuando hacerlo nunca
lo harán. Nos aseguramos que esto no pase al indicarle a la computadora que repita
ciertas partes de un programa mientras (`while`) una cierta condición sea cierta.
Esto funciona de manera muy similar a como lo hace `if`:

*Código:*

```ruby
comando = ''

while comando != 'adios'
  puts comando
  comando = gets.chomp
end

puts '¡Vuelve pronto!'
```

*Respuesta:*

```html
¿Hola?
¿Hola?
¡Hola!
¡Hola!
Un gusto conocerlo
Un gusto conocerlo
¡Oh... que amable!
¡Oh... que amable!
adios
¡Vuelve pronto!
```

Y eso es un bucle. (Tal vez te has dado cuenta de la línea vacía que sale al inicio del resultado;
viene de ejecutar el primer `puts`, antes del primer `gets`. ¿Cómo cambiarías el programa
para eliminar esa primera línea? ¡Pruébalo! ¿Funcionó +exactamente+ igual que el programa
de arriba, sin contar la primera línea blanca?)

Los bucles nos permiten hacer una serie de cosas interesantes, como estoy seguro te
podrás imaginar. Sin embargo, también pueden causar problemas si cometes un error.
¿Qué pasaría si tu computadora se queda atrapado en un bucle infinito? Si piensas
que eso te ha ocurrido, solo presiona la tecla +Ctrl+ y luego la +C+.

Antes de empezar a jugar con los bucles, aprendamos un par de cosas que nos
permitirán hacer nuestro trabajo más facil.

Un poco de lógica
-----------------

Echémosle un vistazo a nuestro primer programa de condicionales una vez más.
¿Qué pasaría si mi esposa llega a casa, ve el programa, lo prueba y éste no
le dice que _ella_ tiene un nombre hermoso. Yo no querría herir sus sentimientos
(o dormir en el sillón) así que reescribámoslo:

*Código:*

```ruby
puts 'Hola, ¿cuál es tu nombre?'
nombre = gets.chomp
puts 'Hola, ' + nombre + '.'
if nombre == 'Chris'
  puts '¡Qué nombre tan hermoso!'
else
  if nombre == 'Katy'
    puts '¡Qué nombre tan hermoso!'
  end
end
```

*Respuesta:*

```html
Hola, ¿cuál es tu nombre?
Katy
Hola, Katy.
¡Qué nombre tan hermoso!
```

Bueno, funciona... pero no es un programa muy bonito. ¿Por qué no? Bueno, la mejor
regla que he aprendido de programación es la regla _DRY_: Don't Repeat Yourself ("No
te repitas" en español). Probablemente podría escribir un libro pequeño sobre por qué es tan buena
esta regla. En nuestro caso, hemos repetido la línea `puts 'Qué nombre tan hermoso!'`. ¿Por qué
es tan problemático esto? Bueno, que pasaría si cometiera un error al escribir los textos cuando
reescribí el programa? ¿Qué tal si hubiera querido cambiar de `'hermoso'` a `'bonito'` en ambas líneas?

Soy flojo, ¿recuerdas? Básicamente si quisiera que el programa haga lo mismo cuando reciba `'Chris'`
o `'Katy'`, entonces realmente debería hacer exactamente _la misma cosa_:

*Código:*

```ruby
puts 'Hola, ¿cuál es tu nombre?'
nombre = gets.chomp
puts 'Hola, ' + nombre + '.'
if (nombre == 'Chris' or nombre == 'Katy')
  puts '¡Qué nombre tan hermoso!'
end
```

*Respuesta:*

```html
Hola, ¿cuál es tu nombre?
Katy
Hola, Katy.
¡Qué nombre tan hermoso!
```

Mucho mejor. Para hacer que funcione, he utilizado el operador `or`. Los otros *operadores
lógicos* son `and` y `not`. Siempre es una buena idea usar los paréntesis cuando trabajamos
con éstos. Veamos como funcionan:

*Código:*

```ruby
soyChris        = true
soyMorado       = false
meGustaLaComida = true
comoRocas       = false

puts (soyChris and meGustaLaComida)
puts (meGustaLaComida and comoRocas)
puts (soyMorado and meGustaLaComida)
puts (soyMorado and comoRocas)
puts
puts (soyChris or meGustaLaComida)
puts (meGustaLaComida or comoRocas)
puts (soyMorado or meGustaLaComida)
puts (soyMorado or comoRocas)
puts
puts (not soyMorado)
puts (not soyChris)
```

*Respuesta:*

```html
true
false
false
false

true
true
true
false

true
false
```

La única de esas sentencias que te podría confundir es el `or`. En español normalmente decimos
"uno u otro, pero no los dos". Por ejemplo, tu mamá podría decir "Para postre puedes pedir pie o
torta". ¡Ella *no* quiso decir que podrías tener ambos!

Una computadora, por otro lado, usa `or` (o) para decir "uno u otro o los dos"  (Otra manera de
decirlo es "al menos una de estas debe ser cierta"). Es por eso que las computadoras son más divertidas
que mamá.

Algunas cosas por intentar
--------------------------

&bull;*"99 botellas de cerveza en la pared..."* Escribe un programa que imprima la letra del clásico
en viajes <a href="http://en.wikipedia.org/wiki/99_Bottles_of_Beer">99 botellas de cerveza en la pared"</a>

&bull;Escribe un programa de la Abuela Sorda. Lo que sea que le digas a la abuela (lo que sea que escribas),
ella deberá responder con HUH?!  ¡HABLA MAS FUERTE, HIJO!, a menos que le grites (que escribas todo
en mayúsculas) Si le gritas, ella te escuchará (o al menos creerá eso) y te gritará de vuelta NO, ¡NO
DESDE 1938!. Para hacer el programa *realmente* creíble, haz que la abuela grite un año
distinto cada vez; tal vez un año aleatorio entre 1930 y 1950. (Esta parte es opcional y sería mucho
más fácil si lees la sección sobre generadores de números aleatorios de Ruby al final del capítulo
[métodos](/aprende.a.programar/capitulos/metodos.html)) No podrás dejar de
hablar con la abuela hasta que le grites `ADIOS`.
**Pista:** *¡No te olvides de *`chomp`*!  ¡*`'ADIOS'`*con un Enter no es lo
mismo que *`'ADIOS'`* sin uno!*.
**Pista 2:* *Trata de pensar que partes del programa deberían suceder una y
otra vez. Todas ellas deberían estar en tu bucle* `while`.

&bull; Extiende el programa de la Abuela Sorda. ¿Qué pasaría si la abuela no quiere que te vayas?
Cuando le grites `ADIOS`, ella podría pretender que no te escucha. Cambia el programa previo para
que tengas que gritar `ADIOS` tres veces *seguidas*. Asegúrate que tu programa si gritas `ADIOS`
tres veces, pero no seguidas, deberías seguir hablando con la abuela.

&bull; Años bisiestos. Escribe un programa que pregunte por un año de inicio y uno de fin, y luego
imprima (`puts`) todos los años bisiestos que han ocurrido entre ellos (incluyéndolos si también han
sido estos años bisiestos). Los años bisiestos son divisibles entre cuatro (como 1984 y 2004). Sin
embargo, los años divisibles entre 100 *no* son años bisiestos (como 1800 y 1900) **a
menos** que sean divisibles por 400 (como 1600 y 2000, los cuales fueron, de hecho, bisiestos).
*(Sí, todo es bastante confuso, pero no tanto como tener Enero en medio del invierno, lo cual es
algo que a veces sucede).*

Cuando termines con ellos, ¡tómate un descanso! Haz aprendido un montón hasta ahora. ¡Felicitaciones! ¿Estás
sorprendido de la cantidad de cosas que le puedes pedir hacer a una computadora? Unos capítulos más y
serás capaz de programar cualquier cosa. ¡En serio! Solo mira la cantidad de cosas que puedes hacer ahora
que antes cuando no tenías bucles y ramificaciones.

Ahora, aprendamos sobre un nuevo tipo de objeto, que permite tener control de listas de otros objetos:
[matrices](/aprende.a.programar/capitulos/matrices.html).
