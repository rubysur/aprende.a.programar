# Métodos Propios


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

    puts 'Hola, y gracias por tomarse el tiempo para'
    puts 'que me ayude con este experimento. Mi experimento'
    puts 'tiene que ver con tu gusto acerca de'
    puts 'la comida mexicana. Basta con pensar en la comida mexicana'
    puts 'y tratar de contestar todas las preguntas con honestidad,''
    puts 'ya sea con un "sí" o un "no". Mi experimento'
    puts 'no tiene nada que ver con mojar la cama.' 
    puts
      
    #  Preguntaremos, pero ignoraremos sus respuestas.
    
    goodAnswer = false
    while (not goodAnswer)
      puts '¿Te gusta comer tacos?'
      answer = gets.chomp.downcase
      if (answer == 'si' or answer == 'no')
        goodAnswer = true
      else
        puts 'Por favor, responda "si" o "no".'
      end
    end
    
    goodAnswer = false
    while (not goodAnswer)
      puts '¿Te gusta comer burritos?'
      answer = gets.chomp.downcase
      if (answer == 'si' or answer == 'no')
        goodAnswer = true
      else
        puts 'Por favor, responda "si" o "no".'
      end
    end
    
    #  Presta atención a *esta* respuesta.
    goodAnswer = false
    while (not goodAnswer)
      puts '¡Mojas la cama?'
      answer = gets.chomp.downcase
      if (answer == 'si' or answer == 'no')
        goodAnswer = true
        if answer == 'si'
          wetsBed = true
        else
          wetsBed = false
        end
      else
        puts 'Por favor, responda "si" o "no".'
      end
    end
    
    goodAnswer = false
    while (not goodAnswer)
      puts '¿Te gusta comer chimichangas?'
      answer = gets.chomp.downcase
      if (answer == 'si' or answer == 'no')
        goodAnswer = true
      else
        puts 'Por favor, responda "si" o "no".'
      end
    end
      
    puts 'Solo una cuantas preguntas más...'
    
    goodAnswer = false
    while (not goodAnswer)
      puts '¿Te gusta comer sopapillas?'
      answer = gets.chomp.downcase
      if (answer == 'si' or answer == 'no')
        goodAnswer = true
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
    puts wetsBed

*Resultado:*

    Hola, y gracias por tomarse el tiempo para
    que me ayude con este experimento. Mi experimento
    tiene que ver con tu gusto acerca de
    la comida mexicana. Basta con pensar en la comida mexicana
    y tratar de contestar todas las preguntas con honestidad,
    ya sea con un "sí" o un "no". Mi experimento
    no tiene nada que ver con mojar la cama.

    ¿Te gusta comer tacos?
    'sí'
    ¿Te gusta comer burritos?
    'sí'
    ¿Mojas la cama?
    'de ninguna manera!'
    Por favor, responda "sí" o "no".
    ¿Mojas la cama?
    'NO'
    ¿Te gusta comer chimichangas?
    'sí'
    Sólo unas cuantas preguntas más ...
    ¿Te gusta comer sopapillas?
    'sí'

    Interrogatorio:
    Gracias por tomarse el tiempo para ayudar con
    este experimento. De hecho, este experimento
    no tiene nada que ver con la comida mexicana. Es
    un experimento sobre mojar la cama. La comida mexicana
    ahí para atraparte con la guardia baja
    con la esperanza de que respondería más
    honestamente. Gracias de nuevo.

    falso

Ese fue un programa bastante largo, con mucha repetición.
(Todas las secciones de código sobre las preguntas de comida 
mexicana eran idénticas, y la pregunta sobre mojar la cama fue
la única pregunta algo diferente).
La repetición es mala. Sin embargo, no podemos transformar el 
código en un gran bucle o iterador, porque a veces queremos 
hacer algo entre las preguntas. En situaciones como estas, 
es mejor escribir un método. Aquí está como:


    def sayMoo
      puts 'muuuuuu...'
    end

Uy... nuestro programa no hizo `muuuuuu`. ¿Por qué no?, Porque no le dijimos que lo hiciera.
Le dijimos *cómo* hacer `muuuuuu`, pero nunca le dijimos en realidad que lo <em>haga</em>.
Intentemos otra vez:

*Código:*

    def sayMoo
      puts 'muuuuuu...'
    end
    
    sayMoo
    sayMoo
    puts 'coin-con'
    sayMoo
    sayMoo

*Resultado:*

    muuuuuu...
    muuuuuu...
    coin-coin
    muuuuuu...
    muuuuuu...

Ah, mucho mejor. (En caso que no hables francés, eso fue un pato francés en medio del programa. En 
Francia los patos dicen *coin-coin*.)

Por lo tanto, `def`inimos el método de `sayMoo`. (Nombres de los métodos, al igual que 
los nombres de variables, comienzan con letras minúsculas. Hay unas pocas excepciones, tales
como `+` o `==`.) ¿Pero los métodos no siempre tienen que estar asociados con objetos?. 
Bueno, sí, y en este caso (como sucede con `puts` y `gets`), el método sólo está 
asociado con el objeto que representa la totalidad del programa. En el próximo 
capítulo veremos cómo agregar métodos a otros objetos. Pero primero ...

## Parámetros del Método

Habrás notado que algunos métodos (como `gets`, `to_s`, `reverse`...) solo pueden
ser llamados en un objeto. Sin embargo, otros métodos (como `+` , `-` , `puts`...) toman 
los *parámetros* para decir el objeto que hacer con el método. Por ejemplo, no sólo 
le diría `5+`, ¿verdad? Le estás pidiendo 5 que agregue, pero no le estás diciendo 
lo que va a agregar.

Para agregar un parámetro a `sayMooo` (digamos, el número de muuuuuu), haríamos lo siguiente:

*Código:*

    def sayMoo numberOfMoos
      puts 'muuuuuuu...'*numberOfMoos
    end
    
    sayMoo 3
    puts 'oink-oink'
    sayMoo  #  Esto debería dar un error porque falta el parámetro.

*Resultado:*

    muuuuuu...muuuuuu...muuuuuu...
    oink-oink
    #<ArgumentError: wrong number of arguments (0 for 1)>

`numberOfMoos` es una variable que apunta al parámetro que se le ha pasado, lo voy a decir de nuevo, 
pero es un poco confuso: `numberOfMoos` es una variable que apunta al parámetro pasado. Por lo 
tanto, si digito `sayMoo 3`, el parámetro es 3, y la variable `numberOfMoos` apunta a 3.

Como puedes ver, el parámetro es ahora *requerido*. Después de todo, lo que `sayMoo` hace es multiplicar  
`'muuuuuu...` ¿pero, si no le dan un parámetro? Tu pobre computadora no tiene ni idea de que hacer.

Si los objetos en Ruby son como los nombres en español, y los métodos son como los verbos, 
entonces se puede pensar en parámetros como adverbios (como con `sayMoo`, donde el parámetro 
nos dice como se afecta `sayMoo`) o a veces como objetos directos (por ejemplo con ´puts´, donde 
el parámetro es lo que se *muestra*).

## Variables Locales

En el siguientre programa hay dos variables:

*Código:*

    def doubleThis num
      numTimes2 = num*2
      puts num.to_s+' el doble es '+numTimes2.to_s
    end
    
    doubleThis 44

*Resultado:*

    44 el doble es 88

Las variables son `num` y `numTimes2`.
Los dos se encuentran dentro del método `doubleThis`. Estas (y todas las variables 
que hemos visto hasta ahora) son las *variables locales*. Esto significa que ellos viven 
dentro del método y no pueden salir. Si lo intentas obtendrás un error:

*Código:*

    def doubleThis num
      numTimes2 = num*2
      puts num.to_s+' el doble es '+numTimes2.to_s
    end
    
    doubleThis 44
    puts numTimes2.to_s

*Resultado:*

    44 el doble es 88
    #<NameError: undefined local variable or method `numTimes2' for #<StringIO:0x82ba21c>>

Variable local no definida ... De hecho, nos *hicieron* definir esa variable local, pero 
no es local donde traté de usarlo, es local en el método.

Esto podría ser un inconveniente, pero en realidad es bastante bueno. Significa que no tienes 
acceso a las variables dentro de los métodos y también significa 
que ellos no tienes acceso a *tus* variables y por lo tanto no pueden meter la pata:

*Código:*

    def littlePest var
      var = nil
      puts 'HAHA!  He malogrado tu variable!'
    end
    
    var = 'Tu ni siquiera puedes tocar mi variable!'
    littlePest var
    puts var

*Resultado:*

    HAHA!  He malogrado tu variable!
    Tu ni siquiera puedes tocar mi variable!

En realidad, hay *dos* variables en el programa que se llaman `var`: uno en el 
interior de `littlePest` y otro fuera de él. Cuando llamamos a `littlePest var`, nosotros
en realidad pasamos de un `var` a otro de manera que ambos están apuntando a la misma cadena. 
Luego `littlePest` apuntó a su propio `var` local a `nil`, pero que no hizo nada al `var` 
que está fuera del método.

## Valores de Retorno

Puedes haber notado que algunos métodos envían algo de regreso cuando son llamados. 
Por ejemplo, `gets` *retorna* una cadena (la cadena que escribiste), y el método `+` en 
`5+3`, (que es en realidad `5.+(3)`) devuelve `8`. Los métodos aritméticos para 
los números retornan números y los métodos aritméticos para las cadenas devuelven cadenas.

Es importante entender la diferencia entre los métodos que devuelven un valor al método
que lo llamó, y lo que el programa muestra en la pantalla como hace `puts`. Ten en 
cuenta que `5+3` retorna `8`, cosa que *no* hace la salida `8`.

Entonces, ¿qué es lo que *hace* `puts` al retornar? No nos importó antes, pero vamos a ver ahora:

*Código:*

    returnVal = puts 'Esto es lo que puts retorna:'
    puts returnVal

*Resultado:*

    Esto es lo que puts retorna:
    cero

Así que el primer `puts` retornó `nil`. A pesar de que no lo prueba, el segundo `puts` 
también lo hizo, `puts` siempre retorna `nil`. Cada método tiene que devolver algo, 
incluso si es valor es solo `nil`.

Tómate un descanso rápido y escribe un programa para averiguar lo que `sayMoo` devuelve.

¿Te sorprendió? Bueno, así es como funciona: el valor devuelto por un método no es más que 
la última línea del método. En el caso de `sayMoo`, esto significa que devuelve 
`puts "muuuuuu... '* Los numberOfMoos`, lo cual es simplemente `nil` ya que `puts` siempre 
devuelve `nil`. Si queremos que todos nuestros métodos devuelvan la cadena `'submarino amarillo'`, 
sólo tenemos que ponerla al final de ellos:

*Código:*

    def sayMoo numberOfMoos
      puts 'muuuuuu...'*numberOfMoos
      'yellow submarine'
    end
    
    x = sayMoo 2
    puts x

*Resultado:*

    muuuuuu... muuuuuuu...
    submarino amarillo

Vamos a tratar con el experimento de sicología otra vez, pero esta vez vamos a 
escribir un método que haga las preguntas por nosotros. Se tendrá que tomar la pregunta 
como un parámetro, y devolver `true` si contestan que `sí`, y `false` si responden que `no`. 
(Aún cuando la mayoría de veces ignoramos la respuesta, sigue siendo una buena idea 
que nuestro método devuelva la respuesta. De esta manera se puede utilizar para la pregunta 
de mojar la cama también.) También voy a acortar el saludo y el interrogatorio de manera 
que sea más fácil de leer:

*Código:*

    def ask question
      goodAnswer = false
      while (not goodAnswer)
        puts question
        reply = gets.chomp.downcase
        
        if (reply == 'si' or reply == 'no')
          goodAnswer = true
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
    
    ask '¿Te gusta comer tacos?'      #  Ignoramos la respuesta.
    ask '¿Te gusta comer burritos?'
    wetsBed = ask '¿Mojas la cama?'  #  Salvamos el valor retornado.
    ask '¿Te gusta comer chimichangas?'
    ask '¿Te gusta comer sopapillas?'
    ask '¿Te gusta comer tamales?'
    puts 'Solo unas preguntas mas...'
    ask '¿Te gusta beber horchata?'
    ask '¿Te gusta comer flautas?'
    
    puts
    puts 'Interrogatorio:'
    puts 'Gracias por...'
    puts
    puts wetsBed

*Resultado:*

    Hola, y gracias por...

    ¿Tegustan comer tacos?
    'sí'
    ¿Te gusta comer burritos?
    'sí'
    ¿Mojas la cama?
    'de ninguna manera!''
    Por favor, responda "sí" o "no".
    ¿Mojas la cama?
    'NO'
    ¿Te gusta comer chimichangas?
    'sí'
    ¿Te gusta comer sopaipillas?
    'sí'
    ¿Te gusta comer tamales?
    'sí'
    Sólo unas preguntas más ...
    ¿Te gusta beber horchata?
    'sí'
    ¿Te gusta comer flautas?
    'sí'

    Interrogatorio:
    Gracias por ...

    falso

No está mal, ¿eh?. Hemos sido capaces de añadir más preguntas (y la adición de 
preguntas ahora es *fácil*), y nuestro programa es aún más corto!. Es una gran mejora - 
El sueño de un programador perezoso.

## Un ejemplo más grande

Creo que otro método como ejemplo podría ser útil aquí. Llamaremos 
a este spanishNumber. Se llevará un número, como `22`, y devolverá
la versión en español de la misma (en este caso, la cadena de `'veintidós'`). 
Por ahora, vamos a trabajar solamente con números enteros entre 0 a 100.

*(**NOTA:** Este método utiliza un nuevo truco para retornar en forma temprana
en el método usando `return` e introduce un nuevo giro en las bifurcaciones: `elsif`. 
Debe quedar claro en el contexto de cómo funcionan estos.)*

*Código:*

    def spanishNumber number
      #  Solo estamos considerando los números de 0-100.
      if number < 0
        return 'Por favor ingrese un numero mayor o igual a cero.'
      end
      if number > 100
        return 'Por favor ingrese un numero menor o igual a 100'
      end
      
      numString = ''  #  Esta es la cadena que retorna.
      
      #  "left" es cuanto del número aún falta escribir.
      #  "write" es la parte que estamos escribiendo en estos momentos.
      #  write y left... lo captas?  :)
      left  = number
      write = left/100          #  Cuantos cientos faltan escribir?
      left  = left - write*100  #  Restar estos cientos.
      
      if write > 0
        return 'cien'
      end
      
      write = left/10          #  Cuantas decenas faltan escribir?
      left  = left - write*10  #  Restar las decenas.
      
      if write > 0
        if write == 1  #  Ah-ah...
          #  No podemos escribir "diezidos" en lugar de "doce", 
          #  hemos realizado una excepción especial .
          if    left == 0
            numString = numString + 'diez'
          elsif left == 1
            numString = numString + 'once'
          elsif left == 2
            numString = numString + 'doce'
          elsif left == 3
            numString = numString + 'trece'
          elsif left == 4
            numString = numString + 'catorce'
          elsif left == 5
            numString = numString + 'quince'
          elsif left == 6
            numString = numString + 'dieciseis'
          elsif left == 7
            numString = numString + 'diecisiete'
          elsif left == 8
            numString = numString + 'dieciocho'
          elsif left == 9
            numString = numString + 'diecinueve'
          end
          #  Desde que ya tomamos el digito faltante,
          #  ya no tenemos nada que escribir.
          left = 0
        elsif write == 2
          #  Como no podemos decir "veinteiuno",
          #  tenemos que eliminar la "e" final.
          if left == 0
            numString = numString + 'veinte'
          else
            numString = numString + 'veint'
          end
        elsif write == 3
          numString = numString + 'treinta'
        elsif write == 4
          numString = numString + 'cuartenta'
        elsif write == 5
          numString = numString + 'cincuenta'
        elsif write == 6
          numString = numString + 'sesenta'
        elsif write == 7
          numString = numString + 'setenta'
        elsif write == 8
          numString = numString + 'ochenta'
        elsif write == 9
          numString = numString + 'noventa'
        end
        
        if left > 0
          numString = numString + 'i'
        end
      end
      
      write = left  #  Cuanto falta para el número?
      left  = 0     #  Restar lo que falta.
      
      if write > 0
        if    write == 1
          numString = numString + 'uno'
        elsif write == 2
          numString = numString + 'dos'
        elsif write == 3
          numString = numString + 'tres'
        elsif write == 4
          numString = numString + 'cuatro'
        elsif write == 5
          numString = numString + 'cinco'
        elsif write == 6
          numString = numString + 'seis'
        elsif write == 7
          numString = numString + 'siete'
        elsif write == 8
          numString = numString + 'ocho'
        elsif write == 9
          numString = numString + 'nueve'
        end
      end
      
      if numString == ''
        #  La unica forma que "numString" este vacio es que 
        #  "number" sea 0.
        return 'cero'
      end
      
      #  Si llegamos hasta hasta aqui es que tenemos un numero 
      #  entre 0 y 100, por lo que debemos retornar "numString".
      numString
    end

    puts spanishNumber(  0)
    puts spanishNumber(  9)
    puts spanishNumber( 10)
    puts spanishNumber( 21)
    puts spanishNumber( 17)
    puts spanishNumber( 32)
    puts spanishNumber( 88)
    puts spanishNumber( 99)
    puts spanishNumber(100)

*Resultado:*

    cero
    nueve
    diez
    veintiuno
    diecisiete
    treintaidos
    ochentaiocho
    noventainueve
    cien

Bueno, sin duda hay algunas cosas acerca de este programa que no me gustan. En primer 
lugar hay demasiada repetición. En segundo lugar, no se ocupa de los números mayores de 
100. En tercer lugar, hay muchos casos especiales, demasiados `return`s. Veamos ahora 
algunas matrices y tratar de limpiar un poco:

*Código:*

    def spanishNumber number
      if number < 0  #  No negative numbers.
        return 'Por favor ingresar un numero que nos ea negativo.'
      end
      if number == 0
        return 'cero'
      end
      
      #  No mas casos especiales!  No mas returns!
      
      numString = ''  #  Esta es la cadena que se retornara.
      
      onesPlace = ['uno',     'dos',       'tres',    'cuatro',     'cinco',
                   'seis',     'siete',     'ocho',    'nueve']
      tensPlace = ['diez',     'veinte',    'treinta',   'cuarenta',    'cincuenta',
                   'sesenta',   'setenta',   'ochenta',   'noventa']
      teenagers = ['once',  'doce',    'trece', 'catorce', 'quince',
                   'dieciseis', 'diecisiete', 'dieciocho', 'diecinueve']
      twentagers = ['veintiuno',  'veintidos',    'veintitres', 'veinticuatro', 'veinticinco',
                   'veintiseis', 'veintisiete', 'veintiiocho', 'veintinueve']
      
      #  "left" es cuanto del numero aun falta escribir
      #  "write" es la parte que estamos escribiendo en este momento.
      #  write y left... lo captas?  :)
      left  = number
      write = left/100          #  Cuantos cientos faltan escribir?
      left  = left - write*100  #  La esta de estos cientos
      
      if write > 0
        #  Ahora hacemos un pequeño truco:
        hundreds  = spanishNumber write
        numString = numString + hundreds + ' ciento'

        # Eso se llama "recursividad". Entonces, ¿Qué acabo de hacer? 
        # Le dije a este método para llamarse a sí mismo, pero con "write" en vez de 
        # "number". Recuerde que "write" es (por el momento) el número de 
        # cientos que tenemos que escribir. Después añadimos "hundred" de "numString", 
        # añadimos la cadena 'cien' después de él. Así, por ejemplo, si 
        # se llamó originalmente spanishNumber con el 1999 (por lo que "number" = 1999), 
        # y luego en este momento "write" sería 19, y la "izquierda" sería 99. 
        # La más perezoso que se puede hacer en ese momento es que spanishNumber 
        # escriba 'diecinueve' para nosotros, entonces escribimos 'cien', 
        # y luego el resto de spanishNumber escribe "noventa y nueve".
        
        if left > 0
          #  So escribir  'dos ciencincuentaiuno'...
          numString = numString + ' '
        end
      end
      
      write = left/10          #  Cuantas decenas faltan escribir?
      left  = left - write*10  #  Resta de estas decenas.
      
      if write > 0
        if ((write == 1) and (left > 0))
          #  No podemos escribir "diez-dos" instead of "doce",
          #  hacemos una excepción especial .
          numString = numString + teenagers[left-1]
          #  Es "-1" porque teenagers[3] ess 'catorce', no 'trece'.
          
          #  Ya que tomamos el digito que nos faltaba,
          #  no tenemos nada mas que escribir.
          left = 0
        elsif ((write ==2 and (left>0)))
          #  Similar para los veintipico
          numString = numString + twentagers[left-1]
          left = 0
        else
          numString = numString + tensPlace[write-1]
          #  Es "-1" porque tensPlace[3] es 'cuarenta', no 'treinta'.
        end
        
        if left > 0
          #  No escribiremos 'sesentacuatro'...
          numString = numString + 'i'
        end
      end
      
      write = left  #  Cuantos faltan?
      left  = 0     #  Restar lo que falta.
      
      if write > 0
        numString = numString + onesPlace[write-1]
        #  Es "-1" porque onesPlace[3] es 'cuatro', no 'tres'.
      end
      
      #  Ahora solo retornamos "numString"...
      numString
    end
    
    puts spanishNumber(  0)
    puts spanishNumber(  9)
    puts spanishNumber( 10)
    puts spanishNumber( 11)
    puts spanishNumber( 17)
    puts spanishNumber( 32)
    puts spanishNumber( 88)
    puts spanishNumber( 99)
    puts spanishNumber(100)
    puts spanishNumber(101)
    puts spanishNumber(234)
    puts spanishNumber(3211)
    puts spanishNumber(999999)
    puts spanishNumber(1000000000000)

*Resultado:*

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

*Ahhhh ....* Eso es mucho, mucho mejor. El programa es bastante denso, por lo 
que puse tantos comentarios. También funciona con números grandes ... aunque no 
tan bien como cabría esperar. Por ejemplo, creo que ' un mllón de millones ' sería 
un valor de retorno más agradable para que el último número. De hecho, puedes hacer 
eso en este momento ...

## Algunas cosas por intentar

* Ampliar al `spanishNumber` . En primer lugar, poner en miles. Por lo tanto, debe devolver `un mil`
en lugar de `diez cien` y `diez mil` en lugar de `cien cien` .

* Ampliar al `spanishNumber` un poco más. Ahora ponga en millones, para que pueda obtener `un millón` 
en lugar de `un mil mil`. A continuación, pruebe a añadir miles de millones y billones. 
¿Qué tan alto puede llegar?

* ¿Qué hay de `weddingNumber`? Deberá trabajar casi como `spanishNumber`, excepto que se 
debe insertar la palabra "y" por todo el lugar, volviendo las cosas como ``mil movecientos
setenta y dos'`, o como se supone deben verse en las invitaciones de la boda. Te daría 
más ejemplos, pero yo no lo entiendo completamente. Es posible que necesite ponerse en 
contacto con un coordinador de bodas para que le ayude.

* Las *"Noventa y nueve botellas de cerveza ..."* Usando spanishNumber y el viejo programa, 
escribir las letras de esta canción en forma *correcta* esta vez. 
Penalizar a tu computador: hacer que se inicie en 9999. (No elegir un número demasiado 
grande, ya que al escribir todo eso en la pantalla de tu computador toma un buen tiempo. Cien 
mil botellas de cerveza lleva tiempo;. Y si tienes que elegir un millón, te estarás
castigantu tu mismo!

¡Felicitaciones! En este punto, usted es un programador de verdad! Usted ha aprendido 
todo lo que necesita para construir grandes programas desde cero. Si tienes ideas 
para los programas que te gustaría escribir para ti mismo, ¡dame una!

Por supuesto, construir todo desde cero puede ser un proceso bastante lento. ¿Por 
qué gastar tiempo escribiendo código que alguien más ya ha escrito? ¿Quieres 
que tu programa envie un correo electrónico? ¿Te gustaría guardar y cargar archivos 
en tu computadora? ¿Qué hay de la generación de páginas web para ver un tutorial en 
donde los ejemplos de código son automáticamente ejecutados? ;) Ruby tiene muchos 
<a href="https://github.com/rubyperu/aprende_a_programar/blob/master/capitulos/09_clases.markdown">
tipos de objetos</a>
que podemos utilizar para ayudarnos a escribir mejores programas y con mayor rapidez.
