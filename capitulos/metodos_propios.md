Métodos Propios
===============

Como hemos visto anteriormente, los bucles e iteradores
nos permiten hacer lo mismo (o ejecutar el mismo código) una y
otra vez.  Sin embargo, a veces queremos hacer algo una determinada
cantidad de veces pero desde distintos lugares en el
programa. Por ejemplo, supongamos que estamos escribiendo un
programa que hace un cuestionario para un estudiante de
sicología. De los estudiantes de sicología que he conocido y
de los cuestionarios que me han dado, esto sería algo similar
a:

*Código:*

```ruby
puts 'Hola, y gracias por tomarse el tiempo para'
puts 'que me ayude con este experimento. Mi experimento'
puts 'tiene que ver con tu gusto acerca de'
puts 'la comida mexicana. Basta con pensar en la comida mexicana'
puts 'y tratar de contestar todas las preguntas con honestidad,'
puts 'ya sea con un "sí" o un "no". Mi experimento'
puts 'no tiene nada que ver con mojar la cama.'
puts

#  Preguntaremos, pero ignoraremos sus respuestas.

buenaRespuesta = false
while (not buenaRespuesta)
  puts '¿Te gusta comer tacos?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
  else
    puts 'Por favor, responda "si" o "no".'
  end
end

buenaRespuesta = false
while (not buenaRespuesta)
  puts '¿Te gusta comer burritos?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
  else
    puts 'Por favor, responda "si" o "no".'
  end
end

#  Presta atención a *esta* respuesta.
buenaRespuesta = false
while (not buenaRespuesta)
  puts '¡Mojas la cama?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
    if respuesta == 'si'
      mojasLaCama = true
    else
      mojasLaCama = false
    end
  else
    puts 'Por favor, responda "si" o "no".'
  end
end

buenaRespuesta = false
while (not buenaRespuesta)
  puts '¿Te gusta comer chimichangas?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
  else
    puts 'Por favor, responda "si" o "no".'
  end
end

puts 'Solo una cuantas preguntas más...'

buenaRespuesta = false
while (not buenaRespuesta)
  puts '¿Te gusta comer sopapillas?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
  else
    puts 'Por favor, responda "si" o "no".'
  end
end

#  Preguntas otras cosas sobre la comida mexicana.

puts
puts 'Interrogatorio:'
puts 'Gracias por tomarse el tiempo para ayudar con'
puts 'este experimento. De hecho, este experimento'
puts 'no tiene nada que ver con la comida mexicana. Es'
puts 'un experimento sobre mojar la cama. La comida mexicana'
puts 'ahí para atraparte con la guardia baja'
puts 'con la esperanza de que respondería más'
puts 'honestamente. Gracias de nuevo.'
puts
puts mojasLaCama
```

*Resultado:*

```html
Hola, y gracias por tomarse el tiempo para
que me ayude con este experimento. Mi experimento
tiene que ver con tu gusto acerca de
la comida mexicana. Basta con pensar en la comida mexicana
y tratar de contestar todas las preguntas con honestidad,
ya sea con un "sí" o un "no". Mi experimento
no tiene nada que ver con mojar la cama.

¿Te gusta comer tacos?
si
¿Te gusta comer burritos?
si
¡Mojas la cama?
de ninguna manera
Por favor, responda "si" o "no".
¡Mojas la cama?
NO
¿Te gusta comer chimichangas?
si
Solo una cuantas preguntas más...
¿Te gusta comer sopapillas?
si

Interrogatorio:
Gracias por tomarse el tiempo para ayudar con
este experimento. De hecho, este experimento
no tiene nada que ver con la comida mexicana. Es
un experimento sobre mojar la cama. La comida mexicana
ahí para atraparte con la guardia baja
con la esperanza de que respondería más
honestamente. Gracias de nuevo.

false
```

Ese fue un programa bastante largo, con mucha repetición.
(Todas las secciones de código sobre las preguntas de comida
mexicana eran idénticas, y la pregunta sobre mojar la cama fue
la única pregunta algo diferente).
La repetición es mala. Sin embargo, no podemos transformar el
código en un gran bucle o iterador, porque a veces queremos
hacer algo entre las preguntas. En situaciones como estas,
es mejor escribir un método. Aquí está como:

```ruby
def decirMu
  puts 'muuuuuu...'
end
```

Uy... nuestro programa no hizo `muuuuuu`. ¿Por qué no?, Porque no le dijimos que lo hiciera.
Le dijimos *cómo* hacer `muuuuuu`, pero nunca le dijimos en realidad que lo *haga*.
Intentemos otra vez:

*Código:*

```ruby
def decirMu
  puts 'muuuuuu...'
end

decirMu
decirMu
puts 'coin-coin'
decirMu
decirMu
```

*Resultado:*

```html
muuuuuu...
muuuuuu...
coin-coin
muuuuuu...
muuuuuu...
```

Ah, mucho mejor. (En caso que no hables francés, eso fue un pato francés en medio del programa. En
Francia los patos dicen *coin-coin*.)

Por lo tanto, `def`inimos el método de `decirMu`. (Nombres de los métodos, al igual que
los nombres de variables, comienzan con letras minúsculas. Hay unas pocas excepciones, tales
como `+` o `==`.) ¿Pero los métodos no siempre tienen que estar asociados con objetos?.
Bueno, sí, y en este caso (como sucede con `puts` y `gets`), el método sólo está
asociado con el objeto que representa la totalidad del programa. En el próximo
capítulo veremos cómo agregar métodos a otros objetos. Pero primero ...

## Parámetros del Método

Habrás notado que algunos métodos (como `gets`, `to_s`, `reverse`...) solo pueden
ser llamados en un objeto. Sin embargo, otros métodos (como `+` , `-` , `puts`...) toman
los *parámetros* para decir al objeto que hacer con el método. Por ejemplo, no sólo
le diría `5+`, ¿verdad? Le estás pidiendo 5 que agregue, pero no le estás diciendo
lo que va a agregar.

Para agregar un parámetro a `decirMu` (digamos, el número de muuuuuu), haríamos lo siguiente:

*Código:*

```ruby
def decirMu numeroDeMus
  puts 'muuuuuuu...'*numeroDeMus
end

decirMu 3
puts 'oink-oink'
decirMu  #  Esto debería dar un error porque falta el parámetro.
```

*Resultado:*

```html
muuuuuuu...muuuuuuu...muuuuuuu...
oink-oink
in `decirMu': wrong number of arguments (0 for 1) (ArgumentError)
```

`numeroDeMus` es una variable que apunta al parámetro que se le ha pasado, lo voy a decir de nuevo,
pero es un poco confuso: `numeroDeMus` es una variable que apunta al parámetro pasado. Por lo
tanto, si digito `decirMu 3`, el parámetro es 3, y la variable `numeroDeMus` apunta a 3.

Como puedes ver, el parámetro es ahora *requerido*. Después de todo, lo que `decirMu` hace es multiplicar
`'muuuuuu...` ¿pero, si no le dan un parámetro? Tu pobre computadora no tiene ni idea de que hacer.

Si los objetos en Ruby son como los nombres en español, y los métodos son como los verbos,
entonces se puede pensar en parámetros como adverbios (como con `decirMu`, donde el parámetro
nos dice como se afecta `decirMu`) o a veces como objetos directos (por ejemplo con ´puts´, donde
el parámetro es lo que se *muestra*)

## Variables Locales

En el siguiente programa hay dos variables:

*Código:*

```ruby
def duplicaEsto num
  numeroVeces2 = num*2
  puts num.to_s+' el doble es '+numeroVeces2.to_s
end

duplicaEsto 44
```

*Resultado:*

```html
44 el doble es 88
```

Las variables son `num` y `numeroVeces2`.
Los dos se encuentran dentro del método `duplicaEsto`. Estas (y todas las variables
que hemos visto hasta ahora) son las *variables locales*. Esto significa que ellos viven
dentro del método y no pueden salir. Si lo intentas obtendrás un error:

*Código:*

```ruby
def duplicaEsto num
  numeroVeces2 = num*2
  puts num.to_s+' el doble es '+numeroVeces2.to_s
end

duplicaEsto 44
puts numeroVeces2.to_s
```

*Resultado:*

```html
44 el doble es 88
in `<main>': undefined local variable or method `numeroVeces2' for main:Object (NameError)
```

Variable local no definida ... De hecho, nos *hicieron* definir esa variable local, pero
no es local donde traté de usarlo, es local en el método.

Esto podría ser un inconveniente, pero en realidad es bastante bueno. Significa que no tienes
acceso a las variables dentro de los métodos y también significa
que ellos no tienen acceso a *tus* variables y por lo tanto no pueden meter la pata:

*Código:*

```ruby
def pequenaMascota var
  var = nil
  puts '¡HAHA!  ¡He malogrado tu variable!'
end

var = '¡Tu ni siquiera puedes tocar mi variable!'
pequenaMascota var
puts var
```

*Resultado:*

```html
¡HAHA!  ¡He malogrado tu variable!
¡Tu ni siquiera puedes tocar mi variable!
```

En realidad, hay *dos* variables en el programa que se llaman `var`: uno en el
interior de `pequenaMascota` y otro fuera de él. Cuando llamamos a `pequenaMascota var`, nosotros
en realidad pasamos de un `var` a otro de manera que ambos están apuntando al mismo texto.
Luego `pequenaMascota` apuntó a su propio `var` local a `nil`, pero que no hizo nada al `var`
que está fuera del método.

## Valores de Retorno

Puedes haber notado que algunos métodos envían algo de regreso cuando son llamados.
Por ejemplo, `gets` *retorna* una cadena (la cadena que escribiste), y el método `+` en
`5+3`, (que es en realidad `5.+(3)`) devuelve `8`. Los métodos aritméticos para
los números retornan números y los métodos aritméticos para los textos devuelven textos.

Es importante entender la diferencia entre los métodos que devuelven un valor al método
que lo llamó, y lo que el programa muestra en la pantalla como hace `puts`. Ten en
cuenta que `5+3` retorna `8`, cosa que *no* hace la salida `8`.

Entonces, ¿qué es lo que *hace* `puts` al retornar? No nos importó antes, pero vamos a ver ahora:

*Código:*

```ruby
valorRetorno = puts 'Esto es lo que puts retorna:'
puts valorRetorno
```

*Resultado:*

```html
Esto es lo que puts retorna:

```
Así que el primer `puts` retornó `nil`. A pesar de que no lo prueba, el segundo `puts`
también lo hizo, `puts` siempre retorna `nil`. Cada método tiene que devolver algo,
incluso si el valor es solo `nil`.

Tómate un descanso rápido y escribe un programa para averiguar lo que `decirMu` devuelve.

¿Te sorprendió? Bueno, así es como funciona: el valor devuelto por un método no es más que
la última línea del método. En el caso de `decirMu`, esto significa que devuelve
`puts "muuuuuu... '* Los numeroDeMus`, lo cual es simplemente `nil` ya que `puts` siempre
devuelve `nil`. Si queremos que todos nuestros métodos devuelvan el texto `'submarino amarillo'`,
sólo tenemos que ponerla al final de ellos:

*Código:*

```ruby
def decirMu numeroDeMus
  puts 'muuuuuu...'*numeroDeMus
  'submarino amarillo'
end

x = decirMu 2
puts x
```

*Resultado:*

```html
muuuuuu... muuuuuuu...
submarino amarillo
```

Vamos a tratar con el experimento de sicología otra vez, pero esta vez vamos a
escribir un método que haga las preguntas por nosotros. Se tendrá que tomar la pregunta
como un parámetro, y devolver `true` si contestan que `sí` y `false` si responden que `no`.
(Aún cuando la mayoría de veces ignoramos la respuesta, sigue siendo una buena idea
que nuestro método devuelva la respuesta. De esta manera se puede utilizar para la pregunta
de mojar la cama también.) También voy a acortar el saludo y el interrogatorio de manera
que sea más fácil de leer:

*Código:*

```ruby
def preguntar pregunta
  buenarespuesta = false
  while (not buenarespuesta)
    puts pregunta
    reply = gets.chomp.downcase

    if (reply == 'si' or reply == 'no')
      buenarespuesta = true
      if reply == 'si'
        answer = true
      else
        answer = false
      end
    else
      puts 'Por favor, responder "si" o "no".'
    end
  end

  answer  #  Esto es lo que retorna (`true` o `false`).
end

puts 'Hola, y gracias por...'
puts

preguntar '¿Te gusta comer tacos?'      #  Ignoramos la respuesta.
preguntar '¿Te gusta comer burritos?'
mojasLaCama = preguntar '¿Mojas la cama?'  #  Salvamos el valor retornado.
preguntar '¿Te gusta comer chimichangas?'
preguntar '¿Te gusta comer sopapillas?'
preguntar '¿Te gusta comer tamales?'
puts 'Solo unas preguntas más...'
preguntar '¿Te gusta beber horchata?'
preguntar '¿Te gusta comer flautas?'

puts
puts 'Interrogatorio:'
puts 'Gracias por...'
puts
puts mojasLaCama
```

*Resultado:*

```html
¿Te gusta comer tacos?
si
¿Te gusta comer burritos?
si
¿Mojas la cama?
de ninguna manera
Por favor, responder "si" o "no".
¿Mojas la cama?
NO
¿Te gusta comer chimichangas?
si
¿Te gusta comer sopapillas?
si
¿Te gusta comer tamales?
si
Solo unas preguntas más...
¿Te gusta beber horchata?
si
¿Te gusta comer flautas?
si

Interrogatorio:
Gracias por...

false
```

No está mal, ¿eh?. Hemos sido capaces de añadir más preguntas (y la adición de
preguntas ahora es *fácil*), y nuestro programa es aún más corto!. Es una gran mejora -
El sueño de un programador perezoso.

## Un ejemplo más grande

Creo que otro método como ejemplo podría ser útil aquí. Llamaremos
a este *numeroEnEspanol*. Se llevará un número, como `22`, y devolverá
la versión en español de la misma (en este caso el texto de `'veintidós'`)
Por ahora, vamos a trabajar solamente con números enteros entre 0 a 100.

*(**NOTA:** Este método utiliza un nuevo truco para retornar en forma temprana
en el método usando `return` e introduce un nuevo giro en las bifurcaciones: `elsif`.
Debe quedar claro en el contexto de cómo funcionan estos.)*

*Código:*

```ruby
def numeroEnEspanol numero
  #  Solo estamos considerando los números de 0-100.
  if numero < 0
    return 'Por favor ingrese un número mayor o igual a cero.'
  end
  if numero > 100
    return 'Por favor ingrese un número menor o igual a 100'
  end

  numeroDeTexto  = ''  #  Este es el texto que retorna.

  #  "izquierda" es cuando del número aún falta escribir.
  #  "escrito" es la parte que estamos escribiendo en estos momentos.
  #  escrito y izquierda... lo captas?  :)
  izquierda  = numero
  escrito = izquierda/100          #  Cuántos cientos faltan escribir?
  izquierda  = izquierda - escrito*100  #  Restar estos cientos.

  if escrito > 0
    return 'cien'
  end

  escrito = izquierda/10          #  Cuántas decenas faltan escribir?
  izquierda  = izquierda - escrito*10  #  Restar las decenas.

  if escrito > 0
    if escrito == 1  #  Ah-ah...
      #  No podemos escribir "diezidos" en lugar de "doce",
      #  hemos realizado una excepción especial.
      if    izquierda == 0
        numeroDeTexto = numeroDeTexto + 'diez'
      elsif izquierda == 1
        numeroDeTexto = numeroDeTexto + 'once'
      elsif izquierda == 2
        numeroDeTexto = numeroDeTexto + 'doce'
      elsif izquierda == 3
        numeroDeTexto = numeroDeTexto + 'trece'
      elsif izquierda == 4
        numeroDeTexto = numeroDeTexto + 'catorce'
      elsif izquierda == 5
        numeroDeTexto = numeroDeTexto + 'quince'
      elsif izquierda == 6
        numeroDeTexto = numeroDeTexto + 'dieciseis'
      elsif izquierda == 7
        numeroDeTexto = numeroDeTexto + 'diecisiete'
      elsif izquierda == 8
        numeroDeTexto = numeroDeTexto + 'dieciocho'
      elsif izquierda == 9
        numeroDeTexto = numeroDeTexto + 'diecinueve'
      end
      #  Desde que ya tomamos el dígito faltante,
      #  ya no tenemos nada que escribir.
      izquierda = 0
    elsif escrito == 2
      #  Como no podemos decir "veinteiuno",
      #  tenemos que eliminar la "e" final.
      if izquierda == 0
        numeroDeTexto = numeroDeTexto + 'veinte'
      else
        numeroDeTexto = numeroDeTexto + 'veint'
      end
    elsif escrito == 3
      numeroDeTexto = numeroDeTexto + 'treinta'
    elsif escrito == 4
      numeroDeTexto = numeroDeTexto + 'cuarenta'
    elsif escrito == 5
      numeroDeTexto = numeroDeTexto + 'cincuenta'
    elsif escrito == 6
      numeroDeTexto = numeroDeTexto + 'sesenta'
    elsif escrito == 7
      numeroDeTexto = numeroDeTexto + 'setenta'
    elsif escrito == 8
      numeroDeTexto = numeroDeTexto + 'ochenta'
    elsif escrito == 9
      numeroDeTexto = numeroDeTexto + 'noventa'
    end

    if izquierda > 0
      numeroDeTexto = numeroDeTexto + 'i'
    end
  end

  escrito = izquierda  #  Cuánto falta para el número?
  izquierda  = 0     #  Restar lo que falta.

  if escrito > 0
    if    escrito == 1
      numeroDeTexto = numeroDeTexto + 'uno'
    elsif escrito == 2
      numeroDeTexto = numeroDeTexto + 'dos'
    elsif escrito == 3
      numeroDeTexto = numeroDeTexto + 'tres'
    elsif escrito == 4
      numeroDeTexto = numeroDeTexto + 'cuatro'
    elsif escrito == 5
      numeroDeTexto = numeroDeTexto + 'cinco'
    elsif escrito == 6
      numeroDeTexto = numeroDeTexto + 'seis'
    elsif escrito == 7
      numeroDeTexto = numeroDeTexto + 'siete'
    elsif escrito == 8
      numeroDeTexto = numeroDeTexto + 'ocho'
    elsif escrito == 9
      numeroDeTexto = numeroDeTexto + 'nueve'
    end
  end

  if numeroDeTexto == ''
    #  La única forma que "numeroDeTexto" esté vacío es que
    #  "numero" sea 0.
    return 'cero'
  end

  #  Si numeroDeTexto os hasta aqui es que tenemos un número
  #  entre 0 y 100, por lo que debemos retornar "numeroDeTexto".
  numeroDeTexto
end

puts numeroEnEspanol(  0)
puts numeroEnEspanol(  9)
puts numeroEnEspanol( 10)
puts numeroEnEspanol( 21)
puts numeroEnEspanol( 17)
puts numeroEnEspanol( 32)
puts numeroEnEspanol( 88)
puts numeroEnEspanol( 99)
puts numeroEnEspanol(100)
```

*Resultado:*

```html
cero
nueve
diez
veintiuno
diecisiete
treintaidos
ochentaiocho
noventainueve
cien
```

Bueno, sin duda hay algunas cosas acerca de este programa que no me gustan. En primer
lugar hay demasiada repetición. En segundo lugar, no se ocupa de los números mayores de
100. En tercer lugar, hay muchos casos especiales, demasiados `return`s. Veamos ahora
algunas matrices y tratar de limpiar un poco:

*Código:*

```ruby
def numeroEnEspanol numero
  if numero < 0  #  No numeros negativos
    return 'Por favor ingresar un numero que no sea negativo.'
  end
  if numero == 0
    return 'cero'
  end

  #  No más casos especiales!  No más returns!

  numeroDeTexto = ''  #  Este es el texto que se devolverá.

  primeraPosicion = ['uno',     'dos',       'tres',    'cuatro',     'cinco',
               'seis',     'siete',     'ocho',    'nueve']
  segundaPosicion = ['diez',     'veinte',    'treinta',   'cuarenta',    'cincuenta',
               'sesenta',   'setenta',   'ochenta',   'noventa']
  entre11Y19 = ['once',  'doce',    'trece', 'catorce', 'quince',
               'dieciseis', 'diecisiete', 'dieciocho', 'diecinueve']
  entre21Y29 = ['veintiuno',  'veintidos',    'veintitres', 'veinticuatro', 'veinticinco',
               'veintiseis', 'veintisiete', 'veintiiocho', 'veintinueve']

  #  "izquierda" es cuanto del numero aun falta escribir
  #  "escrito" es la parte que estamos escribiendo en este momento.
  #  escrito y izquierda... lo captas?  :)
  izquierda  = numero
  escrito = izquierda/100          #  Cuantos cientos faltan escribir?
  izquierda  = izquierda - escrito*100  #  La esta de estos cientos

  if escrito > 0
    #  Ahora hacemos un pequeño truco:
    cientos  = numeroEnEspanol escrito
    numeroDeTexto = numeroDeTexto + cientos + ' ciento'

    # Eso se llama "recursividad". Entonces, ¿Qué acabo de hacer?
    # Le dije a este método para llamarse a sí mismo, pero con "escrito" en vez de
    # "numero". Recuerde que "escrito" es (por el momento) el número de
    # cientos que tenemos que escribir. Después añadimos "hundred" de "numeroDeTexto",
    # añadimos la cadena 'cien' después de él. Así, por ejemplo, si
    # se llamó originalmente numeroEnEspanol con el 1999 (por lo que "numero" = 1999),
    # y luego en este momento "escrito" sería 19, y la "izquierda" sería 99.
    # La más perezoso que se puede hacer en ese momento es que numeroEnEspanol
    # escriba 'diecinueve' para nosotros, entonces escribimos 'cien',
    # y luego el resto de numeroEnEspanol escribe "noventa y nueve".

    if izquierda > 0
      #  So escribir  'dos ciencincuentaiuno'...
      numeroDeTexto = numeroDeTexto + ' '
    end
  end

  escrito = izquierda/10          #  Cuántas decenas faltan escribir?
  izquierda  = izquierda - escrito*10  #  Resta de estas decenas.

  if escrito > 0
    if ((escrito == 1) and (izquierda > 0))
      #  No podemos escribir "diez-dos" en vez de "doce",
      #  hacemos una excepción especial.
      numeroDeTexto = numeroDeTexto + entre11Y19[izquierda-1]
      #  Es "-1" porque entre11Y19[3] es 'catorce', no 'trece'.

      #  Ya que tomamos el dígito que nos faltaba,
      #  no tenemos nada más que escribir.
      izquierda = 0
    elsif ((escrito ==2 and (izquierda>0)))
      #  Similar para los veintipico
      numeroDeTexto = numeroDeTexto + entre21Y29[izquierda-1]
      izquierda = 0
    else
      numeroDeTexto = numeroDeTexto + segundaPosicion[escrito-1]
      #  Es "-1" porque segundaPosicion[3] es 'cuarenta', no 'treinta'.
    end

    if izquierda > 0
      #  No escribiremos 'sesentacuatro'...
      numeroDeTexto = numeroDeTexto + 'i'
    end
  end

  escrito = izquierda  #  Cuántos faltan?
  izquierda  = 0     #  Restar lo que falta.

  if escrito > 0
    numeroDeTexto = numeroDeTexto + primeraPosicion[escrito-1]
    #  Es "-1" porque primeraPosicion[3] es 'cuatro', no 'tres'.
  end

  #  Ahora solo retornamos "numeroDeTexto"...
  numeroDeTexto
end

puts numeroEnEspanol(  0)
puts numeroEnEspanol(  9)
puts numeroEnEspanol( 10)
puts numeroEnEspanol( 11)
puts numeroEnEspanol( 17)
puts numeroEnEspanol( 32)
puts numeroEnEspanol( 88)
puts numeroEnEspanol( 99)
puts numeroEnEspanol(100)
puts numeroEnEspanol(101)
puts numeroEnEspanol(234)
puts numeroEnEspanol(3211)
puts numeroEnEspanol(999999)
puts numeroEnEspanol(1000000000000)
```

*Resultado:*

```html
cero
nueve
diez
once
diecisiete
treintaidos
ochentaiocho
noventainueve
uno ciento
uno ciento uno
dos ciento treintaicuatro
treintaidos ciento once
noventainueve ciento noventainueve ciento noventainueve
uno ciento ciento ciento ciento ciento ciento
```

*Ahhhh ....* Eso está mucho, mucho mejor. El programa es bastante denso, por lo
que puse varios comentarios. También funciona con números grandes... aunque no
tan bien como cabría esperar. Por ejemplo, creo que ' un millón de millones ' sería
un valor de retorno más agradable para el último número. De hecho, puedes hacer
eso en este momento...

## Algunas cosas por intentar

* Ampliar al `numeroEnEspanol` . En primer lugar, poner en miles. Por lo tanto, debe devolver `un mil`
en lugar de `diez cien` y `diez mil` en lugar de `cien cien`.

* Ampliar al `numeroEnEspanol` un poco más. Ahora ponga en millones, para que pueda obtener `un millón`
en lugar de `un mil mil`. A continuación, pruebe a añadir miles de millones y billones.
¿Qué tan alto puede llegar?

* ¿Qué hay de `tiempoDeMatrimonio`? Deberá trabajar casi como `numeroEnEspanol`, excepto que se
debe insertar la palabra "y" por todo el lugar, volviendo las cosas como `'mil novecientos
setenta y dos'`, o como se supone deben verse en las invitaciones de la boda. Te daría
más ejemplos, pero yo no lo entiendo completamente. Es posible que necesite ponerse en
contacto con un coordinador de bodas para que le ayude.

* Las *"Noventa y nueve botellas de cerveza..."* Usando numeroEnEspanol y el viejo programa,
escribir las letras de esta canción en forma *correcta* esta vez.
Penalizar a tu computador: hacer que se inicie en 9999. (No elegir un número demasiado
grande, ya que al escribir todo eso en la pantalla de tu computador toma un buen tiempo. Cien
mil botellas de cerveza lleva tiempo;. Y si tienes que elegir un millón, te estarás
castigando tú mismo!

¡Felicitaciones! En este punto, usted es un ¡programador de verdad! Usted ha aprendido
todo lo que necesita para construir grandes programas desde cero. Si tienes ideas
para los programas que te gustaría escribir para ti mismo, ¡dame una!

Por supuesto, construir todo desde cero puede ser un proceso bastante lento. ¿Por
qué gastar tiempo escribiendo código que alguien más ya ha escrito? ¿Quieres
que tu programa envie un correo electrónico? ¿Te gustaría guardar y cargar archivos
en tu computadora? ¿Qué hay de la generación de páginas web para ver un tutorial en
donde los ejemplos de código son automáticamente ejecutados? ;) Ruby tiene muchos
[tipos de objetos](/aprende.a.programar/capitulos/clases.html).
que podemos utilizar para ayudarnos a escribir mejores programas y con mayor rapidez.
