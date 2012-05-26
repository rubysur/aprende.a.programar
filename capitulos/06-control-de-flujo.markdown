# Control de Flujo

Ahhhh, control de lujo. Acá es donde todo empieza a encajar. A pesar que este capítulo sea más corto y facil que el capítulo de #{makeLink 'methods', :generateMethods}, te abrirá un nuevo mundo de posibilidades para programar.

Luego de este capítulo, seremos capaces de escribes programas realmente interactivos; previamente hemos creado programas que <em>dicen</em> distintas cosas dependiente de lo que ingreses en tu teclado, pero luego de este capítulo estos realmente <em>harán</em> distintas cosas, también. Pero antes que podamos hacer eso, necesitamos ser capaces de comparar objectos en nuestros programas. Necesitamos... 

## Métodos de comparasión

Avancemos rapidamente por esta sección para que podamos ir a la siguiente, <strong>Ramificaciones</strong>, donde todas las cosas geniales ocurren.  Entonces, para ver si un objeto es mayor o menor que otro, usaremos los métodos `>` y `<`, así:

    puts 1 > 2
    puts 1 < 2

Ningún problem. De igual manera, podemos identificar si un objeto es mayor-o-igual-que otro (o menor-o-igual-que) con los métodos `>=` y `<=`

    puts 5 >= 5
    puts 5 <= 4

Finalmente, podemos ver si dos objetos son iguales o no utilizando `==` (que significa "¿son éstos iguales?") y `!=` (que significa "¿son éstos diferentes?").

Es importante no confundir `=` con `==`.
`=` se utiliza para decirle a una variable a que objeto apuntar
(asignación), y `==` se utiliza para responder la pregunta: "¿Son estos dos objetos iguales?"


    puts 1 == 1
    puts 2 != 1

Por supuesto, podemos comparar cadenas también. Cuando las cadenas se comparan, comparan su <dfn>ordenamiento lexicográfico</dfn>, que básicamente significa su orden en un diccionario.  `gato`
aparece antes que `perro` en el diccionario, así que:

    puts 'gato' < 'perro'

Hay algo que tener en cuenta, sin embaro: la manera en que las computadoras normalmente realizan las cosas es asumir que las letras mayúsculas vienen antes que las minúsculas (Así es como almacenan los caracteres en las fuentes, por ejemplo: los caracteres en mayúscula primero y los en minúscula luego.)

Esto significa que pensará que `'Zoológico'` aparece antes que `'ave'`, así que si quieres encontrar que palabra aparecería antes en un diccionario real, asegúrate de utilizar `downcase` (o `upcase` o `capitalize`) en ambas palabras antes de tratar de compararlas.

Un ultimo comentario antes de <strong>Ramificaciones</strong>: Los métodos de comparación no nos están dando las cadenas `'true'` o
`'false'` ("verdadero" y "falso" en inglés); nos están dando los objetos especiales `true` y `false`.  (Por supuesto, , `true.to_s` nos devuelve `'true'`, que es por lo que `puts` imprimió `'true'`.)

`true` y `false` se utilizan todo el tiempo en...

## Ramificaciones

Las Ramificaciones son un concepto simple, pero poderoso. De hecho, es tan simple que no necesario explicarlo; solo te lo mostraré:

    run1 = {:input => ['Chris']}
    run2 = {:input => ['Chewbacca'], :remark => 'Pero si ponemos otro nombre...`

    puts 'Hola, cual es tu nombre?'
    name = gets.chomp
    puts 'Hola, ' + name + '.'
    if name == 'Chris'
      puts 'Que nombre tan hermoso!'
    end

Y eso es una ramificación. Si lo que viene luego del `if` es
`true` (es decir, cierto), se ejecutará el código entre el
`if` y el `end`. Si lo que viene luego del `if` es `false` (falso), no. Más facil imposible.

He indentado el código entre `if` y el `end` solo porque me parece que es más 
facil leer las ramificaciones de esa manera. Casi todos los programadores lo hacen 
así, sin importar el lenguaje en que estén programando. No parece ser de mucha ayuda 
en este ejemplo tan simple, pero cuando las cosas se vuelven complejas, es una gran diferencia.

Varias veces nos gustaría que un programa haga alguna cosa si una expresión 
es `true`, y otra cosa si es que es `false`.  Para eso es que existe `else`:

    run1 = {:input => ['Chris']}
    run2 = {:input => ['Ringo'], :remark => 'Ahora probemos otro nombre...`
    progN run1, run2 do <<-END_CODE
      puts 'Soy un adivino. Dime tu nombre:'
      name = gets.chomp
      if name == 'Chris'
        puts 'Veo grandes cosas en tu futuro.'
      else
        puts 'Tu futuro es... ¡Oh! ¡Mira la hora!'
        puts 'Realmente debo irme, ¡lo siento!'
      end
      END_CODE
    end

Las ramificaciones son como encontrar una bifurcación en el código: ¿Seguimos el camino de las personas cuyo `name == 'Chris'`, o `else` (en lugar) el camino de aquellas que no?

Y como las ramas de un arbol, puedes tener ramificaciones que a su vez tengan otras ramificaciones:

    run1 = {:input => ['chris', 'si']}
    run2 = {:input => ['Chris'], :remark => 'Ok, voy a ponerlo en mayusculas...`
    progN run1, run2 do <<-END_CODE
      puts 'Hola, y bienvenido a la clase de 7mo año.'
      puts 'Me llamo Mrs. Gabbard. Tu nombre es...?'
      name = gets.chomp
      
      if name == name.capitalize
        puts 'Por favor, toma asiento, ' + name + '.'
      else
        puts name + '?  Quieres decir ' + name.capitalize + ', ¿cierto?'
        puts 'No sabes escribir tu propio nombre??'
        reply = gets.chomp
        
        if reply.downcase == 'si'
          puts 'Hmmph!  Bueno, ¡sientese!'
        else
          puts '¡¡SALGA DEL SALON!!'
        end
      end
      END_CODE
    end

Algunas veces se puede poner algo confuso entender donde todos los `if`s, `else`s, y
`end`s van.  Lo que yo hago es escribir el `end`
<em>al mismo tiempo</em> que escribo el `if`.  Así que, mientras
iba escibiendo el programa de arriba, así es como se veía al principio: 

    puts 'Hola, y bienvenido a la clase de 7mo año.'
    puts 'Me llamo Mrs. Gabbard. Tu nombre es...?'
    name = gets.chomp
    
    if name == name.capitalize
    else
    end

Entonces lo llené con <dfn>comentarios</dfn>, cosas en el código que la computadora ignorará:

    puts 'Hola, y bienvenido a la clase de 7mo año.'
    puts 'Me llamo Mrs. Gabbard. Tu nombre es...?'
    name = gets.chomp
    
    if name == name.capitalize
      #  Me trata como una persona normal.
    else
      #  Se vuelve loca.
    end

Todo lo que aparezca luego de un `#` se considera un comentario  (a menos, claro, 
que estés en una cadena de texto). Después de eso, reemplacé los comentarios con 
código funcional. Algunas personas prefieren dejar los comentarios; personalmente, 
pienso que un código bien escrito normalmente habla por si mismo. Solía utilizar más 
comentarios, pero mientras más "flúido" me volvía con Ruby, menos los utiliza. 
Actualmente los encuentro algo distrayentes la mayor parte del tiempo. Es una opción 
personal; tu encontrarás tu propio estilo (siempre en evolución). Así que mi siguiente 
paso se veía así:

    puts 'Hola, y bienvenido a la clase de 7mo año.'
    puts 'Me llamo Mrs. Gabbard. Tu nombre es...?'
    name = gets.chomp

    if name == name.capitalize
      puts 'Por favor, toma asiento, ' + name + '.'
    else
      puts name + '?  Quieres decir ' + name.capitalize + ', ¿cierto?'
      puts 'No sabes escribir tu propio nombre??'
      reply = gets.chomp

      if reply.downcase == 'si'
      else
      end
    end

De nuevo, escribí los `if`, `else`, y 
`end` juntos. Realmente me ayuda para saber 
"donde estoy" en el código. Tambien permite que el
trabajo parezca más sencillo ya que me permite enfocarme en una 
pequeña parte, como en llenar el código entre `if` y el
`else`. El otro beneficio de realizarlo de esta manera es que el computador puede entender 
el programa  en cualquier etapa. Cualquiera de las versiones incompletas del programa 
que te mostrén se podrían ejecutar. No estaban finalizadas, pero eran programas funcionales. 
De esa manera, podría probarlo mientras lo escribo, lo que ayuda a ver como iba avanzando 
y donde aún necesitaba trabajo. Cuando pasó todas las pruebas, sé que había terminado.

Estos tipos te ayudarán a escribir programas con ramificaciones pero también te ayudarán 
con otros tipos de control de flujo:

## Bucles

A veces querrás que tu computadora haga la misma acción una y otra vez&mdash;después de 
todo, se supone que eso es donde son buenas las computadoras.

Cuando le dices a la computadora que siga repitiendo algo, también debes decirle cuando 
parar. Las computadoras nunca se aburren asi que si no le indicas cuando hacerlo, nunca 
lo harán. Nos aseguramos que esto no pase al indicarle a la computadora que repita ciertas 
partes de un programe mientras (`while`) una cierta condición sea cierta. Esto funciona de 
manera muy similar a como lo hace `if`:

    prog ['Hola?', 'Hola!', 'Un gusto conocerlo', 'Oh... que amabe!', 'adios'] do <<-END_CODE
      command = ''
      
      while command != 'adios'
        puts command
        command = gets.chomp
      end
      
      puts '¡Vuelve pronto!'
      END_CODE
    end

Y eso es un bucle. (tal vez te haz dado cuenta de la línea vacía que sale al inicio del resultado; viene de ejecutar el primer `puts`, antes del primer `gets`. ¿Cómo cambiarías el programa para eliminar esa primera línea? ¡Pruébalo! ¿Funcionó <em>exactamente</em> igual que el programa de arriba, sin contar la primera línea blanca?)

Los bucles nos permiten hacer una serie de cosas interesantes, como estoy seguro te podrás imaginar. Sin embargo, también pueden causar problemas si cometes un error. ¿Qué pasaría si tu computadora se queda atrapado en un bucle infinito? Si piensas que eso te ha ocurrido, solo presiona la tecla
<kbd>Ctrl</kbd> y luego la <kbd>C</kbd>.

Antes de empezar a jugar con los bucles, aprendadmos un par de cosas que nos permitirán hacer nuestro trabajo más facil. 

## Un poco de lógica

Echémosle un vistazo a nuestro primer programa de condicionales una vez más. ¿Qué pasaría si mi esposa llega a casa, ve el programa, lo prueba y este no le dice que <em>ella</em> tiene un nombre hermoso? Yo no querría herir sus sentimientos (o dormir en el sillón) así que reescribámoslo: 

    prog ['Katy'] do <<-END_CODE
      puts 'Hola, cual es tu nombre?'
      name = gets.chomp
      puts 'Hola, ' + name + '.'
      if name == 'Chris'
        puts 'Que nombre tan hermoso!'
      else
        if name == 'Katy'
          puts 'Que nombre tan hermoso!'
        end
      end
      END_CODE
    end

Bueno, funciona... pero no es un programa muy bonito. ¿Por qué no? Bueno, la mejor regla que he aprendido de programación es la regla <dfn>DRY</dfn>:
<dfn>Don't Repeat Yourself</dfn> (No te repitas, en español). Probablemente podría escribir un libro pequeño sobre por qué es tan buena regla. En nuestro caso, hemos repetido la línea `puts 'Que nombre tan hermoso!'`. ¿Por qué es tan problemático esto? Bueno, que pasaría si cometiera un error al escribir los textos cuando reescribí el programa? ¿Que tal si hubiera querido cambiar de `'hermoso'` a `'bonito'` en ambas líneas?

Soy flojo, ¿recuerdas? Básicamente si quisiera que el programa haga lo mismo cuando reciba `'Chris'` o `'Katy'`, entonces realmente debería hacer exactamente<em>la misma cosa</em>:

    prog ['Katy'] do <<-END_CODE
      puts 'Hola, cual es tu nombre?'
      name = gets.chomp
      puts 'Hola, ' + name + '.'
      if (name == 'Chris' or name == 'Katy')
        puts 'Que nombre tan hermoso!'
      end
      END_CODE
    end

Mucho mejor. Para hacer que funcione, he utilizado el operador `or`. Los otros <em>operadores lógicos</em> son `and` y `not`. Siempre es una buena idea usar los paréntesis cuando trabajamos con éstos. Veamos como funcionan:

    prog do <<-END_CODE
      soy_chris          = true
      soy_morado         = false
      me_gusta_la_comida = true
      como_rocas        = false
      
      puts (soy_chris and me_gusta_la_comida)
      puts (me_gusta_la_comida and como_rocas)
      puts (soy_morado and me_gusta_la_comida)
      puts (soy_morado and como_rocas)
      puts
      puts (soy_chris or me_gusta_la_comida)
      puts (me_gusta_la_comida or como_rocas)
      puts (soy_morado or me_gusta_la_comida)
      puts (soy_morado or como_rocas)
      puts
      puts (not soy_morado)
      puts (not soy_chris 
      END_CODE
    end

El único de esos que te podría confundir es el
`or`. En español normalmente decimos "uno u otro, pero no los dos". Por ejemplo, you mamá podría decir "Para postre, puedes pedir pie o torta". ¡Ella <em>no</em> quiso decir que podrías tener ambos!

Una computadora, por otro lado, usa `or` (o) para decir "uno u otro o los dos"  (Otra manera de decirlo es "al menos una de estas debe ser cierta"). Es por eso que las computadoras son más divertidas que mamá.

## Algunas cosas para probar

&bull; <em>"99 botellas de cerveza en la pared..."</em> Escribe un programa que imprima las líricas del clásico en viajes "99 botellas de cerveza en la pared"

&bull; Escribe un programa de la Abuela Sorda. Lo que sea que le digas a la abuela (lo que sea que escribas), ella deberá responder con
HUH?!  ¡HABLA MAS FUERTE, HIJO!`, a menos que le grites (escribas todo en mayúsculas) Si le gritas, ella te escuchará (o al menos creerá eso) y te gritará de vuelta NO, ¡NO DESDE 1938!`. Para hacer el programa <em>realmente</em> creíble, haz que la abuela grite un año distinto cada vez; tal vez un año aleatorio entre 1930 y 1950.  (Esta parte es opcional y sería mucho más facil si lees la sección sobre generadores de números aleatorios de Ruby al final del capítulo 
<a href="https://github.com/rubyperu/aprende_a_programar/blob/master/capitulos/05_acerca_de_metodos.markdown">
métodos</a>
chapter.) No podrás dejar de hablar con la abuela hasta que le grites `ADIOS`.<br />
<em><strong>Pista:</strong> ¡No olvides de
</em>`chomp`<em>!  ¡</em>`'ADIOS'`<em>con un Enter no es lo mismo que </em>`'ADIOS'`<em> sin uno!</em><br />
<em><strong>Pista 2:</strong> Trata de pensar en que partes del programa deberían suceder una y otra vez. Todas ellas deberían estar en tu bucle</em>`while`

&bull; Extiende el programa de la Abuela Sorda. ¿Qué pasaría si la abuela no quiere que te vayas? Cuando le grites `ADIOS`, ella podría pretender que no te escucha. Cambia el programa previo para que tengas que gritas `ADIOS` tres veces <em>seguidas</em>. Asegúrate de programa tu programa: si gritas ADIOS` tres veces, pero no seguidas, deberías seguir hablando con la abuela.

&bull; Años bisiestos. Escribe un programa que pregunte por un año de inicio y uno de fin, y luego imprime (`puts`) todos los años bisiestos que han ocurrido entre ellos (incluyéndolos si también han sido estos años bisiestos). Los años bisiestos son divisibles entre cuatro (como 1984 y 2004). Sin embargo, los años divisibles entre 100 <em>no</em> son años bisiestos (como 1800 y 1900) <strong><em>a menos</em></strong> que sean divisibles por 400 (como 1600 y 2000, los cuales fueron, de hecho, bisiestos).
<em>(Si, todo es bastante confuso, pero no tanto como tener Julio en medio del inviertno, lo cual es algo que a veces sucede)</em>

Cuando termines con ellos, ¡tómate un descanso! Haz aprendido un montón hasta ahora. ¡Felicitaciones! ¿Estás sorprendido de la cantidad de cosas que le puedes pedir hacer a una computadora? Unos capítulos más y serás capaz de programar cualquier cosas. ¡En serio! Solo mira la cantidad de cosas que puedes hacer ahora que no podías antes sin bucles y ramificaciones. 

Ahora, aprendamos sobre un nuevo tipo de objeto, que permite tener control de listas de otros objetos:
<a href="https://github.com/rubyperu/aprende_a_programar/blob/master/capitulos/07_arrays.markdown">
matrices</a>.