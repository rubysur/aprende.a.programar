# Después de esta guía

Entonces que haremos ahora? Si tienes una pregunta, a quien consultarías?
Que pasa si quieres un programa que abra una página web, envíe un email,
o redefina el tamaño de una foto digital? Bueno, hay muchos, muchos lugares 
donde encontrar ayuda Ruby. Desafortunadamente, esto es de poca ayuda, no? :-)

Para mí, hay realmente solo tres lugares donde busco por ayuda sobre Ruby.
Si es una pequeña pregunta, y pienso que puedo experimentar yo mismo para 
encontrar la respuesta, utilizo <dfn>irb</dfn>. Si es una gran pregunta,
busco por esto dentro de mis <dfn>herramientas</dfn>. Y si no puedo darme
cuenta por mi mismo, entonces pregunto por ayuda en <dfn>ruby-talk</dfn>.

## IRB:  Ruby Interactivo

Si instalaste Ruby, entonces tienes instalado irb. Para usarlo, solo
ve a consola y tipea `irb`.  Cuando estes en irb, puedes tipear cualquier
expresion ruby que quieras, y este te dirá el valor de esto. Tipea `1 + 2`,
y este te devolverá `3`. (Puedes darte cuenta que no tienes que utilizar
`puts`.) Esto es como una calculadora Ruby gigante. Cuando finalizes, solo
debes tipear `exit`.

Hay un montón de cosas ademas para irb, pero puedes aprender mucho más
probando esto.

## The Pickaxe:  "Programming Ruby"

Absolutamente <em>el</em> libro Ruby a tener es "Programming Ruby,
The Pragmatic Programmer's Guide", by David Thomas and Andrew
Hunt (the Pragmatic Programmers). Mientras que recomiendo tomar la 
<a href="http://www.pragmaticprogrammer.com/titles/ruby/">segunda edición</a>
de este excelente libro, con todo lo último cubierto,
también puedes obtener una versión un poquito más
antigua (pero interesante también) gratis que esta online. (En realidad,
si instalaste la versión Windos de Ruby, ya lo tienes.)

Puedes encontrar todo lo que necesites de Ruby, desde lo básico a lo
avanzado, en este libro. Es fácil de leer, fácil de entender, es perfecto.
Desearía que cada lenguage tuviera un libro de esta calidad. Al reverso
del libro, encontrarás una gran sección detallando cada método en cada
clase, explicandolo y dando ejemplos. Me encanta este libro!

Hay algunos lugares donde puedes conseguirlo(incluyendo
el sitio mismo  Pragmatic Programmers), pero mi lugar favorito es
en <a href="http://www.ruby-doc.org/docs/ProgrammingRuby/">ruby-doc.org</a>.
Esta versión tiene una linda tabla de contenidos a un costado, como también
un índice. (ruby-doc.org tiene un montón más de grandiosos contenidos también,
como para el Core API y biblioteca estandar(Standard Library)... basicamente,
este documenta todo Ruby. <a href="http://www.ruby-doc.org/">Chequealo aquí.</a>)

Y porque es llamado "el pico"? Bueno, hay una imágen de un pico en la tapa del 
libro. Es un nombre tonto, creo yo, pero quedó así.

## Ruby-Talk: la lista de mails Ruby

Aun teniendo irb y el pico, algunas veces sigues sin resolver
algo que necesitas. O quizás quieres saber si alguien ya hizo algo de lo
tu estas intentando, para saber si puedes usar eso en cambio. En estos casos
, el lugar para esto es ruby-talk, la lista de mails Ruby. Esta llendo de gente
amigable, inteligente y con ganas de ayudar. Para aprender mas de esto, o suscribirte
, mira <a href="http://www.ruby-lang.org/en/20020104.html">aquí</a>.

<strong>ADVERTENCIA:</strong> Hay <em>muchos</em> emails en 
esta lista de correos cada día. Tuve que enviar directamente estos
a diferentes carpetas de mail para que no me molesten. Si no quieres
ocuparte de todos esos emails, pienso, no debes inscribirte. La lista
de mails es espejada en el grupo de noticias comp.lang.ruby, y viceversa,
entonces puedes ver los mensajes ahí. De igual manera, ves los mismos 
mensajes, pero en un formato diferente.

## Tim Toady

Algo que traté de mostrarte, lo cual seguramente podrás probar pronto, 
es el concepto de TMTOWTDI (pronunciado como "Tim Toady" en inglés for *There's 
More Than One Way To Do It*): *Hay Más De Una Forma DE Hacer Esto*.

Algunos te dirán que TMTOWTDI es maravillos mientras otros 
puedan pensar algo diferente. No tengo fuertes sentimientos de las  
cosas en general, pero pienso que esto es 
una <em>terrible</em> forma de enseñar a programar a alguién. 
(Como si aprender a programar de una forma no fuera suficiente desafio y confuso!)

Sin embargo, ahora que te estás moviendose más alla de este tutorial, verás mucha
más diversidad de código. Por ejemplo, pienso que al menos hay otras cinco formas
de hacer un string(aparte de las que encierran un texto en comillas), y cada uno de estos
trabaja un poco diferente. Solo mostre lo simple. 

Cuando hablamos de ramificación, mostré el `if`,
pero no mostre el `unless`. Voy a dejar que te des 
cuenta por ti mismo en irb de que se trata.

Otro lindo atajo que puedes usar con `if`,
`unless` y `while`, es esta linda versión de una línea:

*Código:*

    #  Estas lineas son de un programa que escribi para generar 
    #  English
    puts 'grobably combergearl kitatently thememberate' if 5 == 2**2 + 1**1
    puts 'enlestrationshifter supposine follutify blace' unless 'Chris'.length == 5

*Resultado:*

    grobably combergearl kitatently thememberate

Y finalmente, hay otro camino para escribir métodos la cual toma bloques
(no procs). Vimos la parte donde tomabamos el bloque y lo convertíamos 
dentro de un proc usando el truco `&block` en la lista de parametros
cuando defines una función. Entonces, para llamar el bloque, solo usas 
`block.call`.  Bueno, hay una manera más corta (aunque personalmente pienso que 
es más confuso). En lugar de esto:

*Código:*

    def doItTwice(&block)
      block.call
      block.call
    end
    
    doItTwice do
      puts 'murditivent flavitemphan siresent litics'
    end

*Resultado:*

    murditivent flavitemphan siresent litics
    murditivent flavitemphan siresent litics

...haces esto:

*Código:*

    def doItTwice
      yield
      yield
    end
    
    doItTwice do
      puts 'buritiate mustripe lablic acticise'
    end

*Resultado:*

    buritiate mustripe lablic acticise
    buritiate mustripe lablic acticise


No sé... ¿qué piensas? Quizás solo sea yo, pero... `yield`?! 
Si esto fue algo como  `call_the_hidden_block` o otra cosa más,
esto tendría *mucho más* sentido para mi. Mucha gente dice que `yield` 
tiene sentido para ellos. Pero, supongo que es algo como TMTOWTDI (Hay Más De
Una Forma De Hacer Esto), y eso es todo: ellos hacen las cosas a su manera, 
y yo lo hare a mi manera.

## Fin

Use esto para el bien y no para lo malo. :-)  Y si encuentras este tutorial
útil (o confuso, o si encuentras un error), <a href="mailto:chris@pine.fm">avísame</a>!