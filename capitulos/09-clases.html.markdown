# Clases

Hasta ahora hemos visto diferentes tipos o *clases* de objetos: 
cadenas, enteros, reales, matrices, y algunos objetos especiales 
(`true`, `false` y `nil`) de los cuales hablaremos más tarde. 
En Ruby, estas clases están siempre en mayúsculas: `String`, `Integer`, 
`Float`, `Array` ... etc. En general, si queremos crear un nuevo 
objeto de una cierta clase, usamos `new`:

*Código:*

    a = Array.new  + [12345]  #  Array  agregado.
    b = String.new + 'hello'  #  String agregado.
    c = Time.new

*Resultado:*

    puts 'a = '+a.to_s
    puts 'b = '+b.to_s
    puts 'c = '+c.to_s

Porque podemos crear matrices y cadenas usando  `[...]` y `' ... '` 
respectivamente es que rara vez los creamos usando `new`. (Aunque 
no es muy evidente en el ejemplo anterior, `String.new` crea una 
cadena vacía y `Array.new` crea una matriz vacía). También, los 
números son excepciones especiales: no se puede crear un número 
entero con `Integer.new` . Sólo tienes que escribir el número entero.

## La clase `Time`

Entonces, ¿cuál es la historia con la clase `Time`?. Los objetos `Time` 
representan momentos en el tiempo. Usted puede sumar (o restar) números a 
(o desde) para obtener los nuevos tiempos: la adición de `1,5` 
a un tiempo hace un tiempo nuevo segundo y medio más tarde:

*Código:*

    time  = Time.new   #  El momento que se generó esta página web.
    time2 = time + 60  #  Un minuto más tarde.
    
    puts time
    puts time2

*Resultado:*

    Tue Apr 14 16:29:20 GMT 2009
    Tue Apr 14 16:30:20 GMT 2009

También puedes obtener el tiempo para un momento específico utilizando `Time.mktime`:

*Código:*

    puts Time.mktime(2000, 1, 1)          #  Y2K.
    puts Time.mktime(1976, 8, 3, 10, 11)  #  Cuando nació Chris.

*Resultado:*

    Sat Jan 01 00:00:00 GMT 2000
    Tue Aug 03 10:11:00 GMT 1976

Nota: yo nací en el horario de verano del Pacífico (PDT). 
Cuando se presentó el problema del año 2000, sin embargo, era hora 
estándar del Pacífico (PST), por lo menos para nosotros los de la 
Costa Oeste. Los paréntesis son para agrupar los parámetros a `mktime`.
Los parámetros adicionales hacen más preciso el tiempo obtenido.

Puedes comparar los tiempos usando los métodos de comparación 
(un tiempo anterior es *menos que* un tiempo posterior), y si se resta 
un tiempo de otro obtendrás el número de segundos entre ellos. Juega un poco con él!

## Algunas cosas para probar

* Mil millones de segundos ... Descubre el segundo exacto en que naciste 
(si puedes). Averigua cuando tendrás (o tal vez cuando tuviste?) mil millones 
de segundos de edad. luego marcalo en tu calendario.

* ¡Feliz cumpleaños! Pregunta qué año nació una persona, luego el mes, y luego el día. 
Calcula la edad que tiene y dale una gran ´NALGADA!´ por cada cumpleaños que ha tenido.

## La clase`Hash`

Otra clase muy útil es `Hash`. Los valores hash son muy parecidos a 
las matrices: tienen un montón de ranuras que pueden apuntar a objetos diferentes. 
Sin embargo, en una matriz, las ranuras están alineados en una fila y cada uno 
está numerado (empezando de cero). En un `hash`, las ranuras no están en una fila 
(que es sólo un tipo de mezcla), y se puede utilizar *cualquier* objeto 
para hacer referencia a un espacio no sólo un número. Es bueno utilizar 
hashes cuando se tiene un montón de cosas que no se desea perder de vista, 
pero que en realidad no encajan en una lista ordenada. Por ejemplo los colores que 
yo uso para las diferentes partes del código con las que he creado este tutorial:

*Código:*

    colorArray = []  #  igual a Array.new
    colorHash  = {}  #  igual a Hash.new
    
    colorArray[0]         = '#{@@STRING_COLOR}'
    colorArray[1]         = '#{@@NUMBER_COLOR}'
    colorArray[2]         = '#{@@KEYWORD_COLOR}'
    colorHash['strings']  = '#{@@STRING_COLOR}'
    colorHash['numbers']  = '#{@@NUMBER_COLOR}'
    colorHash['keywords'] = '#{@@KEYWORD_COLOR}'
    
    colorArray.each do |color|
      puts color
    end
    colorHash.each do |codeType, color|
      puts codeType + ':  ' + color
    end

*Resultado:*

    red
    green
    blue
    strings:  red
    keywords:  blue
    numbers:  green

Si utilizo una matriz, tengo que recordar que la ranura `0` es para las cadenas, 
la ranura `1` es para los números, etc, pero si puedo usar un hash, ¡es muy fácil! 
Ranura `' cadenas '` mantiene el color de las cadenas, por supuesto. No hay 
nada que recordar. Puedes haber notado que cuando se utiliza `each` 
los objetos en el hash no vienen en el mismo orden en que los pusiste adentro. (Al menos
no lo hacían cuando escribí esto. Pueden que lo hagan ahora... nunca se sabe con los hashes).
Matrices son para mantener las cosas en orden, no hashes.

Aunque la gente suele utilizar cadenas para nombrar las ranuras de un hash, se 
puede utilizar cualquier tipo de objeto, incluso las matrices y los hashes de 
otros (aunque yo no puedo pensar en por qué querría hacer esto ...):

    weirdHash = Hash.new
    
    weirdHash[12] = 'monos'
    weirdHash[[]] = 'el vacío'
    weirdHash[Time.new] = 'ningun momento como el actual'

Hashes y matrices son buenos para cosas diferentes, depende de ti decidir cuál 
es el mejor para un problema particular.

## Extendiendo las clases

Al final del último capítulo escribiste un método para decir la frase en español 
de un número entero. No era un método de número entero, sin embargo; 
fue sólo un método genérico de un "programa". ¿No sería agradable si pudieras 
escribir algo como `22.to_spa` en lugar de `spanishNumber  22`?. He aquí cómo harías eso:

*Código:*

    class Integer
      def to_spa
        if self == 5
          spanish = 'cinco'
        else
          spanish = 'cincuenta y ocho'
        end
        
        spanish
      end
    end
    
    #  Mejor probarlo en un par de números...
    puts 5.to_spa
    puts 58.to_spa

*Resultado:*

    cinco
    cincuenta y ocho

Bueno, lo he probado y parece que funciona. ;)

Por lo tanto, definimos un método del número entero ingresando en la clase `Integer`, 
definiendo el método allí y saliendo luego. Ahora todos los números enteros tienen 
este (algo incompleto) método. De hecho, si no te gusta la forma en que el método 
`to_s` trabaja, lo podrías definir en gran parte de la misma manera ... pero yo no 
lo recomiendo! Lo mejor es dejar los viejos métodos y hacer otros nuevos cuando 
se quiere hacer algo nuevo.

Así que ... ¿confundido? Permiteme explayarme más en ese último programa. 
Hasta ahora, cada vez que ejecutabas cualquier código o cualquier otro método definido se 
hacía por omisión en el "programa" del objeto. En nuestro último programa, 
dejamos el objeto por primera vez y se fuimos a la clase `Integer`. Se definió 
un método allí (lo que lo convierte en un método de número entero) y que todos 
los números enteros pueden utilizar. Dentro de ese método se utiliza `self` para 
referirse al objeto (el entero) utilizando el método.

## Creando clases

Hemos visto diferentes clases de objetos. Sin embargo, es fácil 
llegar a los tipos de objetos que Ruby no tiene. Por suerte, la 
creación de una nueva clase es tan fácil como la ampliación de una antigua. 
Digamos que hemos querido hacer algunos dados en Ruby. Así es como podemos 
hacer la clase Dado:

*Código:*

    class Dado
      
      def roll
        1 + rand(6)
      end
      
    end
    
    #  Vamos a hacer un par de dados...
    dados = [Dado.new, Dado.new]
    
    #  ...y hacerlos rodar.
    dados.each do |dado|
      puts dado.roll
    end

*Resultado:*

    3
    4

(Si se ha saltado la sección de números aleatorios,  `rand(6)` 
sólo da un número aleatorio entre  0 y 5 .)
Y eso es todo! Nuestro propios objetos. Tira los dados
un par de veces (con el botón de recarga) y mira lo que
aparece.

Podemos definir todo tipo de métodos para los objetos ... pero hay algo 
que falta. Trabajar con estos objetos se parece mucho a la programación 
antes de aprender acerca de las variables. ¡Mira los dados, por ejemplo. 
Podemos rodarlos y cada vez que nos dan un número diferente. Pero si 
quería guardar ese número habría que crear una variable que apunte 
el número. 
Parece que cualquier dado decente debe ser capaz de *tener* un número, 
y que rodando el dado nuevamente el número debe cambiar. Si hacemos un 
seguimiento del dado debemos tener también un registro del número mostrado.

Sin embargo, si tratamos de guardar el número que salió en una variable 
(local) `roll` habrá desaparecido tan pronto como `roll` haya terminado. 
Tenemos que guardar el número en un tipo diferente de variable

## Variables de instancia

Normalmente cuando queremos hablar de una cadena, nos limitaremos a llamar a 
un *string*. Sin embargo, también podría llamar un *objeto de string*. Sin 
embargo, los programadores podrían llamar *una instancia de la clase `String`*, 
pero esto es sólo una manera de decir de *string*. Una *instancia* de una clase 
es sólo un objeto de esa clase.

Por lo tanto las variables de instancia son variables de un objeto. Las 
variables locales de un método viven hasta que el método ha terminado. Las 
variables de instancia de un objeto, por otro lado, duran tanto como el objeto. 
Para diferenciar las variables de instancia de las variables locales, 
ellos tienen `@` delante de sus nombres:

*Código:*

    class Dado
      
      def roll
        @numberShowing = 1 + rand(6)
      end
      
      def showing
        @numberShowing
      end
      
    end
    
    dado = Dado.new
    dado.roll
    puts dado.showing
    puts dado.showing
    dado.roll
    puts dado.showing
    puts dado.showing

*Resultado:*

    1
    1
    5
    5

¡Muy bien!. `roll` rueda el dado y `showing` nos dice el número que muestra. 
Sin embargo, que pasa si tratamos de mostrar lo que existía antes de rodar el dado
(antes de que lo hayamos guardado en `@numberShowing`)

*Código:*

    class Dado
      
      def roll
        @numberShowing = 1 + rand(6)
      end
      
      def showing
        @numberShowing
      end
      
    end

    # Ya que no voy a usar esta dado de nuevo, 
    # No es necesario guardarlo en una variable. 
    puts Dado.new.showing

*Resultado:*

    nil

Hmmm ... bueno, al menos no nos muestra un error. Aún así, no tiene mucho 
sentido para un dado "no rodado" mostrar `nil` o lo que sea que se supone 
que significa. Sería bueno si pudiéramos dar un valor cuando nuestro objeto 
Dado es creado. Para esto esta `initialize`:

*Código:*

    class Dado
      
      def initialize
        # Voy a tirar el dado, a pesar de que 
        # podria hacer otra cosa si quisieramos 
          roll
      end
      
      def roll
        @numberShowing = 1 + rand(6)
      end
      
      def showing
        @numberShowing
      end
      
    end
    
    puts Dado.new.showing

*Resultado:*

    6

Cuando se crea un objeto, su método `initialize` (si se ha definido 
uno) siempre es llamado.
Nuestros dados son casi perfectos. La única cosa que podría hacer falta 
es una manera de establecer qué lado del dado está mostrando ... ¿Por 
qué no escribir un método `cheap` que hace justamente eso! Vuelve cuando 
hayas terminado (y que haya funcionado por supuesto). Asegúrese de que 
nadie pueda obtener un `7` con el dado!

Hay varios temas interesante que apenas hemos revisado. Es difícil, sin 
embargo, te voy a dar otro ejemplo más interesante. Digamos que queremos 
hacer una mascota virtual sencilla, un dragón bebé. Como la mayoría de los 
bebés debe ser capaz de comer, dormir y hacer sus necesidades, lo que 
significa que tendremos que ser capaces de darle de comer, de ponerlo en la 
cama y llevarlo a pasear. Internamente, nuestro dragón tendrá que realizar 
una verificación de si tiene hambre, está cansado o tiene que ir al baño 
pero no vamos a ser capaces de ver su estado cuando nos relacionamos con 
nuestro dragón al igual que no se puede preguntar a un bebé humano, "¿Tienes 
hambre?". También vamos a añadir algunas otras maneras divertidas de 
interactuar con nuestro dragón bebé y cuando nace le daremos un nombre. 
(Lo que sea que pasen al método `new` al método `initialize`). 
Muy bien, continuemos:

*Código:*

    class Dragon
      
      def initialize name
        @name = name
        @asleep = false
        @stuffInBelly     = 10  #  Esta lleno.
        @stuffInIntestine =  0  #  No necesita ir.
        
        puts @name + ' nace.'
      end
      
      def feed
        puts 'Alimentas a ' + @name + '.'
        @stuffInBelly = 10
        passageOfTime
      end
      
      def walk
        puts 'Haces caminar a ' + @name + '.'
        @stuffInIntestine = 0
        passageOfTime
      end
      
      def putToBed
        puts 'Colocas a ' + @name + ' en la cama.'
        @asleep = true
        3.times do
          if @asleep
            passageOfTime
          end
          if @asleep
            puts @name + ' ronca, llenando el cuarto con humo.'
          end
        end
        if @asleep
          @asleep = false
          puts @name + ' despierta lentamente.'
        end
      end
      
      def toss
        puts 'Lanzas a ' + @name + ' en el aire.'
        puts 'Sonrie, sus cejas se mueven.'
        passageOfTime
      end
      
      def rock
        puts 'Acunas a ' + @name + ' suavemente.'
        @asleep = true
        puts 'Rapidamente se queda dormido...'
        passageOfTime
        if @asleep
          @asleep = false
          puts '...pero despierta cuando te detienes.'
        end
      end
      
      private
      
      #  "private" significa que los metodos defindos aqui son
      #  metodos internos al objeto.  (Puedes alimentar a
      #  tu dragon, pero no puedes preguntar si esta hambriento.)
      
      def hungry?
        #  Los nombres de los metodos pueden terminar en "?".
        #  Generalmente, hacemos esto si el método debe
        #  devolver verdadero o falso, como esto:
        @stuffInBelly <= 2
      end
      
      def poopy?
        @stuffInIntestine >= 8
      end
      
      def passageOfTime
        if @stuffInBelly > 0
          #  Mueve el alimento del vientre al intestino.
          @stuffInBelly     = @stuffInBelly     - 1
          @stuffInIntestine = @stuffInIntestine + 1
        else  #  Nuestro dragon esta hambriento!
          if @asleep
            @asleep = false
            puts 'Se despierta de repente!'
          end
          puts @name + ' esta hambriento!  En su desperacion, te COMIO!'
          exit  #  Sale del programa.
        end
        
        if @stuffInIntestine >= 10
          @stuffInIntestine = 0
          puts 'Ops!  ' + @name + ' tuvo un accidente...'
        end
        
        if hungry?
          if @asleep
            @asleep = false
            puts 'Se despierta de repente!'
          end
          puts 'El estomago de ' + @name + 'retumba...'
        end
        
        if poopy?
          if @asleep
            @asleep = false
            puts 'Se despierta de repente!'
          end
          puts @name + ' hace la danza del baño...'
        end
      end
      
    end
    
    pet = Dragon.new 'Norbert'
    pet.feed
    pet.toss
    pet.walk
    pet.putToBed
    pet.rock
    pet.putToBed
    pet.putToBed
    pet.putToBed
    pet.putToBed

*Resultado:*

    Norbert nace.
    Alimentas a Norbert.
    Lanzas a Norbert en el aire.
    Sonrie, sus cejas se mueven.
    Haces caminar a Norbert.
    Colocas a Norbert en la cama.
    Norbert ronca, llenando el cuarto con humo.
    Norbert ronca, llenando el cuarto con humo.
    Norbert ronca, llenando el cuarto con humo.
    Norbert despierta lentamente.
    Acunas a Norbert suavemente.
    Rapidamente se queda dormido...
    ...pero despierta cuando te detienes.
    Colocas a Norbert en la cama.
    Se despierta de repente!
    El estomado de Norbert retumba...
    Colocas a Norbert en la cama.
    Se despierta de repente!
    El estomado de Norbert retumba...
    Colocas a Norbert en la cama.
    Se despierta de repente!
    El estomado de Norbert retumba...
    Norbert hace la danza de baño...
    Colocas a Norbert en la cama.
    Se despierta de repente!
    Norbert esta hambriento!  En su desesperación, te COMIO!

*¡Ouau!* Por supuesto, sería mejor si fuese un programa interactivo, 
pero puedes modificarlo. Yo sólo estaba tratando de mostrar las partes 
relacionadas directamente con la creación de una nueva clase de dragón.

Vimos algunas cosas nuevas en ese ejemplo. La primera es simple: `exit` 
termina el programa en ese mismo momento. La segunda es la 
palabra `private`, que pusimos en la definición de nuestra clase. 
Podría haberlos mantenido afuera, pero yo quería reforzar la idea 
de que hay ciertos métodos que hacen cosas que puede hacer un dragón 
y otros que simplemente se establecen dentro el dragón. Usted puede 
pensar en ellos como "bajo el capó": a menos que seas un mecánico de automóviles 
todo lo que necesitas saber es el pedal del acelerador, el pedal del 
freno y el volante. Un programador puede llamar a esto *interfaz pública* del 
automóvil. Sin embargo, cómo saber cuando la bolsa de aire se activará es algo 
interno del automóvil, el usuario típico (el conductor) no tiene por qué saberlo.

En realidad, para un ejemplo más concreto en ese sentido vamos a hablar 
sobre cómo se podría representar un coche en un videojuego (que pasa a ser 
mi línea de trabajo). En primer lugar, tienes que decidir como deseas 
que tu interfaz pública se parezca, es decir, los métodos de la gente 
debería ser capaz de llamar por cada uno de los objetos de su coche. 
Bueno, tienen que ser capaz de empujar el pedal del acelerador y el 
pedal de freno, pero que también tienen que ser capaces de especificar lo 
fuerte que están empujando el pedal. (Hay una gran diferencia entre pisar y 
golpear.) También tendría que ser capaces de dirigir el timón, y otra vez, 
tendrían que ser capaces de decir lo mucho que están moviendo la rueda del
timón. Supongo que se podría ir más allá y añadir un embrague, direccionales, 
lanzacohetes, cámara de postcombustión, condensador de flujo, etc .. 
depende del tipo de juego que están haciendo.

Internamente al objeto coche, sin embargo, tendríamos que hacer mucho más 
cosas; otras cosas que necesita un coche son una velocidad, una dirección 
y una posición (que son las cosas más básicas). Estos atributos se 
modificarían pulsando sobre el gas o los pedales de freno y girando la rueda, 
pero el usuario no sería capaz de establecer la posición directamente (que 
sería como una deformación). Usted también podría patinar o dañar si se ha 
volcado y así sucesivamente. Todo esto sería interno a su objeto coche.

## Algunas cosas para Probar

* Hacer una clase `Orangetree`. Deberá tener un método `height` que devuelve su altura 
y un método `oneYearPasses` que cuando se le llama aumenta la edad del árbol en un año. 
Cada año crece el árbol más alto (mucho más de lo que piensas que un naranjo debe crecer en un año), 
y después de un cierto número de años (de nuevo, tu llamada) el árbol debe morir. 
En los primeros años el árbol no debe producir fruta, pero después de un tiempo debería hacerlo, 
y supongo que los árboles más viejos producen más cada año que los árboles más jóvenes ... 
lo que pienses que tiene más sentido. Y, por supuesto, usted deberá ser capaz de 
`countTheOranges` (que devuelve el número de naranjas en el árbol), y `pickAnOrange` (que 
reduce la `@orangeCount`en uno y devuelve una cadena que le dice cómo la naranja era deliciosa, 
o de lo contrario sólo te dice que no hay naranjas más para elegir este año). Asegúrate 
que las naranjas que no se recogen en un año se caen antes del próximo año.

* Escribir un programa para que pueda interactuar con su bebé dragón. Deberás 
ser capaz de introducir comandos como `feed` y `walk`, y hacer que esos métodos se 
llamen en tu dragón. Por supuesto, ya que lo que estás ingresando son sólo cadenas, 
tendrás que tener algún tipo de *método de envío*, donde el programa revise las cadenas 
que se han ingresado y luego llama al método adecuado.

Y eso es casi todo lo que hay que hacer! Pero espera un segundo ... 
Yo no he hablado de ninguna de esas clases para hacer cosas como enviar un 
correo electrónico o guardar y cargar archivos en el cumputador, o cómo crear ventanas 
y botones, o los mundos en 3D, ni nada! Bueno, hay *tantas* clases que pueden utilizar 
que no es posible mostrar a todos, ¡yo no conozco la mayoría de ellos! Lo *que* puedo 
decir es que para saber más sobre ellos tienen que saber acerca de los que deseas que el 
programa haga. Antes de terminar hay una característica más de Ruby que deberás conocer, 
algo que la mayoría de lenguajes de programación no tiene pero sin las cuales 
simplemente no podría vivir: 
<a href="https://github.com/rubyperu/aprende_a_programar/blob/master/capitulos/10_bloques_y_procs.markdown">
bloques y procedimientos</a>.