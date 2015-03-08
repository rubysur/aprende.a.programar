Métodos
=======

Hemos visto diferentes métodos: `puts`,  `gets`,
etc. (***Prueba:*** *Listar todos los métodos que hemos
visto hasta ahora!. Hay diez de ellos, la respuesta está abajo*), pero no hemos
realmente hablado sobre que hacen los métodos. Sabemos que hacen, pero no lo que son.

Pero realmente, esto *es* lo que son: cosas que generan otras.
Si objetos (como textos, enteros y flotantes) son los sujetos en
el lenguaje Ruby, entonces los métodos son como verbos. Y, justo como en el
español, tú no puedes tener un verbo sin un sustantivo para *hacer* algo.
Por ejemplo, tic-tac no es algo que sólo ocurre; un reloj (o algo) tiene que hacer
esto. En español podemos decir: "El reloj hace tic-tac". En Ruby podemos decir
`clock.tick` (asumiendo por supuesto que `clock` es un objeto Ruby).
Los programadores pueden decir que estamos "llamando el método `tick` de
`clock`" o llamamos al "`tick` de `clock`".

Entonces, ¿has hecho la prueba? Bien. Bueno, estoy seguro que
recordarás los métodos `puts`, `gets` y
`chomp`; dado que ya hablamos sobre ellos.
Probablemente también recuerdas los métodos de conversión
`to_i`, `to_f`, y `to_s`. Sin embargo,
¿has visto los otros cuatro? Porque, estos no son otros que
nuestros viejos amigos para la aritmética ¡`+`,
`-`, `*` y `/`!

Entonces, como cada verbo necesita un sustantivo,
entonces cada método necesita un objeto. Esto es generalmente fácil de
indicar: es el que viene justo antes de un punto, como nuestro
ejemplo `clock.tick`, o en `101.to_s`.
Algunas veces, sin embargo, esto no es tan obvio; como con los métodos
aritméticos. Como resulta, `5 + 5`  es solo otra forma fácil de
escribir `5.+ 5`.
Por ejemplo:

*Código:*

```ruby
puts 'hola '.+ 'mundo'
puts (10.* 9).+ 9
```

*Resultado:*

```html
hola mundo
99
```

Esto no es muy lindo, por lo que no vamos a escribir siempre como ahora;
sin embargo, es importante para entender que sucede *realmente*.

Esto también nos da un profundo entendimiento de porque podemos hacer
`'pig'*5` pero no podemos hacer `5*'pig'`: `'pig'*5`
está diciendo a `'pig'` de hacer de multiplicando, pero `5*'pig'`
está diciendo a `5` de hacer de multiplicando. `'pig'` sabe como
hacer `5` copias de si mismo y agregar todos ellos juntos; sin embargo,
`5` tendrá mucha más dificultad en tiempo de hacer `'pig'` copias
de si *mismo* y sumarlos a todos juntos.

Y, por supuesto, continuaremos teniendo `puts` y `gets` para explicar.
¿Dónde están sus objetos? En español, puedes algunas veces dejar fuera el sustantivo;
por ejemplo, si un villano grita "¡Muere!", el sustantivo implícito es a quien él
está gritando. En Ruby, si digo `puts 'ser o no ser'`, lo que realmente estoy
diciendo es `self.puts 'ser o no ser'`.

Entonces ¿qué es `self`? Ésta es una variable especial que apunta al objeto en
el que estás. No siempre sabemos como estar *en* un objeto, pero hasta que nos
demos cuenta, siempre iremos a estar en un gran objeto que es... ¡el programa entero! (sin
embargo en este caso no es posible llamarlo en forma explícita).
Observa lo siguiente:

*Código:*

```ruby
NoPuedoCreerQueUnaVariableConNombreTanLargoApunteA3 = 3
puts NoPuedoCreerQueUnaVariableConNombreTanLargoApunteA3
self.puts NoPuedoCreerQueUnaVariableConNombreTanLargoApunteA3
```

*Resultado:*

```html
3
in `<main>': private method `puts' called for main:Object (NoMethodError)
```

Si no alcanzaste a comprender todo, está bien. Lo importante es que
todo método está siendo propiedad de un objeto, incluso si no tiene
un punto enfrente de éste. Si entiendes esto estás preparado.

Métodos imaginativos acerca de Strings
--------------------------------------

Vamos a aprender unos pocos pero interesantes métodos. No tienes
porque memorizar todos; puedes mirar esta página de nuevo si te
olvidas de alguno. Yo sólo quiero mostrarte una *pequeña*
parte de lo que puede hacer un texto. De hecho, no recuerdo ni
siquiera la mitad de los métodos para textos; pero está bien, porque
hay buenas referencias en internet con todo acerca de textos
listados y explicados (Voy a mostrarte donde encontrar esas referencias
al final del tutorial).

Realmente, tampoco *quiero* saber todo acerca de los métodos para textos;
sino sería como tratar de conocer cada palabra en el diccionario. Puedo hablar
español bien sin conocer cada una de las palabras del diccionario... ¿y no es
ese realmente el objetivo del diccionario? Entonces ¿no *tienes*
que conocer que hay en éste?

Entonces, nuestro primer método para texto es `reverse`,
el cual nos da una version invertida de un texto:

*Código:*

```ruby
var1 = 'parar'
var2 = 'subrayado'
var3 = 'Puedes pronunciar esta oración al revés?'

puts var1.reverse
puts var2.reverse
puts var3.reverse
puts var1
puts var2
puts var3
```

*Resultado:*

```html
rarap
odayarbus
?séver la nóicaro atse raicnunorp sedeuP
parar
subrayado
Puedes pronunciar esta oración al revés?
```

Como puedes ver, `reverse` no revierte el orden en el string original; éste
sólo hace una nueva versión de éste en reversa. Esto es porque `var1` continua
`'parar'` aún después de que llamamos  `reverse` sobre  `var1`.

Otro método para texto es `length`, el cual nos dice el número de caracteres
(incluyendo espacios) en el texto:

*Código:*

```ruby
puts '¿Cuál es tu nombre completo?'
name = gets.chomp
puts '¿Sabes que hay ' + name.length + ' caracteres en tu nombre, ' + name + '?'
```

*Resultado:*

```html
¿Cuál es tu nombre completo?
Christopher David Pine
in `+': no implicit conversion of Fixnum into String (TypeError)
```

¡¡Uhh!! Algo salió mal, y esto parece que ocurrió después la línea
`name = gets.chomp`... ¿Puedes ver el problema? Fijate si puedes darte cuenta.

El problema es con `length`: esto te devuelve un número, pero nosotros queremos
un texto. Esto es fácil, necesitamos solo agregar `to_s` (y cruzar nuestros dedos):

*Código:*

```ruby
puts '¿Cuál es tu nombre completo?'
name = gets.chomp
puts '¿Sabías que hay ' + name.length.to_s + ' caracteres en tu nombre, ' + name + '?'
```

*Resultado:*

```html
¿Cuál es tu nombre completo?
Christopher David Pine
Sabías que hay 22 caracteres en tu nombre, Christopher David Pine
```

No, no conocía esto.  **Nota:** esto es el número de
*caracteres* en mi nombre, no el número de *letras*. Supongo
que podríamos escribir un programa el cual nos pregunte por nuestro primer
nombre, segundo nombre y apellidos individualmente, y entonces sumar estos tamaños
todos juntos... hey, ¡porque no haces esto! Comienza, esperaré.

¿Lo hiciste? ¡Bien! Es un lindo programa, ¿no? Después de unos pocos capítulos más,
pienso, estarás sorprendido de lo que podrás hacer.

Entonces, hay también un número de métodos para texto los cuales cambian
el contenido (mayúsculas y minúsculas) de tu texto. `upcase`
cambian cada minúscula por mayúscula. `swapcase` cambia en cada
letra en el string("Hola".swapcase  #=> "hOLA"), y finalmente, `capitalize`
es como `downcase`, excepto que esto cambia solo el primer carácter a
mayúsculas (si es una letra).

*Código:*

```ruby
letters = 'aAbBcCdDeE'
puts letters.upcase
puts letters.downcase
puts letters.swapcase
puts letters.capitalize
puts ' a'.capitalize
puts letters
```

*Resultado:*

```html
AABBCCDDEE
aabbccddee
AaBbCcDdEe
Aabbccddee
 a
aAbBcCdDeE
```

Esto es bastante estándar. Como puedes ver desde la linea `puts ' a'.capitalize`,
el método `capitalize` sólo deja en mayúsculas el primer *carácter*, no
la primera *letra*. También, como hemos visto antes, en todas estas llamadas a
métodos, `letters` permanece igual. No quiero ser pesado con esto,
pero es importante entenderlo. Hay algunos métodos los cuales *hacen* cambios a los
objetos asociados, pero no los hemos visto aún, y no lo haremos por algún tiempo.

El último tipo de métodos que veremos son los de formato visual. El primero es, `center`,
suma espacios al comienzo y final para hacer que esté centrado. Sin embargo, sólo tienes
que decir `puts` a lo que quieres imprimir, y `+` a lo que quieres sumar, pero
tienes que decir a `center` que ancho tiene que tener el string centrado. Entonces si quiero
centrar las lineas de un poema, debería hacer algo como esto:

*Código:*

```ruby
lineWidth = 50
puts(                'Old Mother Hubbard'.center(lineWidth))
puts(               'Sat in her cupboard'.center(lineWidth))
puts(         'Eating her curds an whey,'.center(lineWidth))
puts(          'When along came a spider'.center(lineWidth))
puts(         'Which sat down beside her'.center(lineWidth))
puts('And scared her poor shoe dog away.'.center(lineWidth))
```

*Resultado:*

              Old Mother Hubbard
             Sat in her cupboard
          Eating her curds an whey,
           When along came a spider
          Which sat down beside her
      And scared her poor shoe dog away.

Mmmm.. no pienso que esto es un campamento de verano, pero estoy muy
cansado para buscar esto. (Entonces, quise alinear la parte
`.center lineWidth` , entonces puse esos espacios extras antes
de los textos. Esto es así sólo porque pienso que es más lindo de
esta forma. Los programadores generalmente tienen duros conceptos acerca
de que es lindo en un programa, y a menudo confrontan acerca de esto.
Cuanto más programes, más lograrás tu propio estilo.)  Hablando de ser
perezoso a la hora de programar, lo cual no es siempre algo malo en
programación. Por ejemplo, fíjate como guardé el ancho del poema en la
variable  `lineWidth`? Esto es que si entonces quiero regresar
más tarde y hacer el poema más ancho, solo tengo que cambiar la variable
al comienzo del programa, antes que en cada línea. Con un poema muy largo,
esto podría ahorrarme un montón de tiempo. Este tipo de pereza es realmente
una virtud en programación.

Entonces, acerca del centrado... tú te darás cuenta que esto no es muy
lindo como podría serlo un procesador de texto. Si realmente quieres un
perfecto centrado (y quizás una fuente más linda), entonces deberías
¡sólo usar un procesador de textos!. Ruby es una herramienta maravillosa,
pero no la herramienta correcta para *cualquier* trabajo.

Los otros dos métodos de formato de textos son `ljust` y
`rjust`, lo cual significan *justificado izquierdo* y
*justificado derecho*. Estos son similares a `center`,
excepto que ellos rellenan los lados derecho e izquierdo respectivamente.
Vamos a verlos en acción:

*Código:*

```ruby
lineWidth = 40
str = '--> text <--'
puts str.ljust  lineWidth
puts str.center lineWidth
puts str.rjust  lineWidth
puts str.ljust(lineWidth/2) + str.rjust(lineWidth/2)
```

*Resultado:*

    --> text <--
                  --> text <--
                                --> text <--
    --> text <--                --> text <--

Algunas cosas por intentar
--------------------------

* Escribe un programa `Jefe Enojado`. Este debe preguntar de mala
manera qué quieres. Cualquier cosa que consultes, el Jefe Enojado deberá
devolverte la consulta de mala forma, y luego despedirte. Por ejemplo,
si tu escribes `Quiero un aumento.`, deberá contestarte
`PERO QUE DICES HOMBRE "¿¡¿QUIERES UN AUMENTO."?!?  ¡¡ESTAS DESPEDIDO!!`

* Entonces aquí hay algo para que puedas jugar un poco más con
`center`, `ljust`, y `rjust`: Escribe un programa el
cual muestre una Tabla de Contenidos que se parezca a lo siguiente:

Listado:

                    Tabla de Contenidos

    Capítulo 1:  Números                        página 1
    Capítulo 2:  Letras                        página 72
    Capítulo 3:  Variables                    página 118

Matemáticas Avanzadas
---------------------

*(Esta sección es totalmente opcional. Asume un conocimiento
previo de matemáticas. Si no estás interesado, puedes ir directamente
al siguiente capítulo [Condicionales](/aprende.a.programar/capitulos/condicionales.html)
sin problemas. Aunque, una rápida vista de esta sección sobre
**Números aleatorios** debería venir bien.)*

No hay tantos métodos numéricos como los hay para textos (pienso
que aun no los conozco a todos sin recurrir a la ayuda de documentación).
Aquí, vamos a mirar el resto de los métodos aritméticos, un generador
de números aleatorios, y el objeto `Math` , con sus métodos trigonométricos
y transcendentales.

Más de aritmética
-----------------

Los otros dos métodos aritméticos son `**` (potencia) y `%`
(módulo). Entonces si quieres decir "cinco al cuadrado" en Ruby, deberías
escribir algo así `5**2`. También puedes usar flotantes para tus
exponentes, entonces si quieres una raíz cuadrada de 5, deberías escribir
`5**0.5`. Los métodos módulo te dan el sobrante después de una división
por un número. Entonces, por ejemplo, si divido 7 por 3, obtengo 2 con un remanente
de 1. Vamos a ver como es que trabaja en un programa:

*Código:*

```ruby
puts 5**2
puts 5**0.5
puts 7/3
puts 7%3
puts 365%7
```

*Resultado:*

```html
25
2.23606797749979
2
1
1
```

De la última línea, aprendimos que un año (no bisiesto) tienen algún
número de semanas, más un día. Entonces si tu cumpleaños fue un Martes
este año, el próximo año será un Miércoles. Tu también puedes usar
flotantes con el método módulo (`%`). Básicamente, funciona de una manera
lógica... pero voy a mostrar un poco más como trabajar con esto.

Hay un último método para mencionar: `abs`. Éste sólo toma el valor
absoluto de un número:

*Código:*

```ruby
puts((5-2).abs)
puts((2-5).abs)
```

*Resultado:*

```html
3
3
```

Números aleatorios
------------------

Ruby viene con un lindo generador de números aleatorios. El método para obtener
un número aleatorio es `rand`. Si llamas `rand` , obtendrás un
número flotante mayor o igual a `0.0` y menor a `1.0`. Si
le proporcionas a `rand` un número entero (`5` por ejemplo),
esto te devolverá un entero mayor o igual a `0` y menor a `5`
(entonces son cinco números posibles, de `0` a `4`).

Vamos a ver `rand`  en acción.

*Código:*

```ruby
puts rand
puts rand
puts rand
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(1))
puts(rand(1))
puts(rand(1))
puts(rand(99999999999999999999999999999999999999999999999999999999999))
puts('El pronosticador del tiempo dijo que hay '+rand(101).to_s+'% chances de que llueva,')
puts('pero nunca debes confiar en él.')
```

*Resultado:*

```html
0.866769322351658
0.155609260113273
0.208355946789083
61
46
92
0
0
0
22982477508131860231954108773887523861600693989518495699862
El pronosticador del tiempo dijo que hay 47% chances de que llueva,
pero nunca debes confiar en él.
```

Fijate que utilicé `rand(101)` para obtener números entre `0`
y `100`, y que el `rand(1)` siempre devuelve `0`. No
entender el rango posible de retorno de valores es el error más grande que veo
en gente que hace `rand`; aún programadores profesionales, más aún en
productos finalizados que puedes comprar. Incluso tenía un reproductor de CD
que si se configuraba en "Reproducción aleatoria," reproducía
todas las canciones menos la última ... (Me pregunto ¿qué hubiera pasado si hubiera
puesto un CD con sólo una canción en ella?)

Algunas veces querrás que `rand` retorne el *mismo*
random de números incluso en la misma secuencia en dos diferentes ejecuciones
de tu programa. (Por ejemplo, una vez estaba utilizando números generados
aleatoriamente para crear un mundo al azar para un juego de computadoras.
Encontré un mundo que realmente me gustó, quizás me hubiera gustado jugar de nuevo
con éste o enviarlo a un amigo.) Con el fin de hacer esto, tu necesitas configurar
la *"generación de éste"*, lo que se puede hacer con `srand`. Como
lo siguiente:

*Código:*

```ruby
srand 1776
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts ''
srand 1776
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
puts(rand(100))
```

*Resultado:*

```html
24
35
36
58
70

24
35
36
58
70
```

Esto hará la misma cosa cada vez que inicies con el mismo número. Si quieres
obtener diferentes números (como pasaría si nunca utilizaras `srand`),
entonces sólo llamas a `srand 0`. Esto inicializa con un número
realmente raro, utilizando (además de otras cosas) la hora actual de tu
computadora, hasta los milisegundos.

El Objeto `Math`
----------------

Finalmente, vamos a echar un vistazo al objeto `Math`. Deberíamos
ir directamente a este:

*Código:*

```ruby
puts(Math::PI)
puts(Math::E)
puts(Math.cos(Math::PI/3))
puts(Math.tan(Math::PI/4))
puts(Math.log(Math::E**2))
puts((1 + Math.sqrt(5))/2)
```

*Resultado:*

```html
3.14159265358979
2.71828182845905
0.5
1.0
2.0
1.61803398874989
```

Como puedes ver, `Math` tiene todas las cosas que podrías
esperar de una calculadora científica decente. Y como siempre, los
flotantes están *realmente cerca* de ser la respuesta
correcta.

Entonces ahora vamos a ver [control de flujo](/aprende.a.programar/capitulos/condicionales.html).
