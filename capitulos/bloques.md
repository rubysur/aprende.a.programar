Bloques y Procedimientos
========================

Esta es definitivamente una de las mejores herramientas de Ruby.
Algunos lenguajes tienen esta herramienta, pienso que la llamaran
de otra forma (como *closures*), pero la mayoría de los más
populares no lo hacen, una pena.

Entonces ¿qué es esto que es tan bueno? Esto tiene la habilidad
de tomar un *bloque* de código (código entre **do**
y **end**) y encapsularlo dentro de un objeto (llamado *proc*) y
guardarlo en una variable o pasarlo a un método, y ejecutar el código del
bloque donde te guste (más de una vez, si quieres) Entonces esto es
como un tipo método excepto que no está dentro de un objeto
(este bloque *es* un objeto), y puedes almacenarlo o pasarlo como cualquier
otro objeto. Es hora de un ejemplo:

*Código:*

```ruby
toast = Proc.new do
  puts '¡Aplausos!'
end

toast.call
toast.call
toast.call
```

*Resultado:*

```html
¡Aplausos!
¡Aplausos!
¡Aplausos!
```

Entonces creé un proc (el cual pienso debería ser pronunciado como "procedimiento") que
contiene un bloque de código, y llamé (*call*ed) el proc tres
veces. Como puedes ver, esto es como un método.

En realidad, son más parecidos a los métodos que te he mostrado, porque los bloques pueden
tomar parámetros:

*Código:*

```ruby
teGusta = Proc.new do |algoRico|
  puts '¡Me gusta *realmente* el '+algoRico+'!'
end

teGusta.call 'chocolate'
teGusta.call 'ruby'
```

*Resultado:*

```html
¡Me gusta *realmente* el chocolate!
¡Me gusta *realmente* el ruby!
```

Muy bien, entonces hemos visto que son los bloques y procs, y como usarlos, pero
¿cuál es el punto? ¿Porqué no utilizar simplemente métodos? Bueno, esto es porque
hay más cosas que no podemos hacer con métodos. En particular, no
puedes pasar métodos a otros métodos (pero puedes pasar procs dentro de métodos),
y métodos no pueden retornar otros métodos (pero ellos pueden retornar procs). Esto
es simplemente porque procs son objetos; los métodos no son objetos

(De hecho, ¿es algo familiar para tí? Sí, tu has visto bloques antes... cuando aprendiste
sobre iteradores. Pero vamos a hablar un poco más acerca de esto en breve)

## Métodos que reciben Procedimientos

Cuando pasamos un proc en un método podemos controlar cómo o cuántas veces llamamos
el proc. Por ejemplo, vamos a decir que queremos hacer antes y después de cierto código que
se esta ejecutando:

*Código:*

```ruby
def hacerAlgoImportante unProc
  puts '¡Todo el mundo DETENGANSE!  Tengo algo que hacer...'
  unProc.call
  puts 'A todos: Está hecho.  Continuen con lo que estaban haciendo.'
end

decirHola = Proc.new do
  puts 'hola'
end

decirAdios = Proc.new do
  puts 'adios'
end

hacerAlgoImportante decirHola
hacerAlgoImportante decirAdios
```

*Resultado:*

```html
¡Todo el mundo DETENGANSE!  Tengo algo que hacer...
hola
A todos: Está hecho.  Continuen con lo que estaban haciendo.'
¡Todo el mundo DETENGANSE!  Tengo algo que hacer...
adios
A todos: Está hecho.  Continuen con lo que estaban haciendo.'
```

Quizá esto no parezca muy fabuloso... pero lo es. :-)
Es común en programacion tener requerimientos estrictos acerca de
que debe ser hecho y cuando. Si quieres salvar un archivo, por ejemplo,
tienes que abrir el archivo, escribir la informacion que quieres que
contenga y luego cerrar el archivo. El olvido de cerrar el archivo puede
traer malas consecuencias. Pero cada vez que quieras salvar un archivo
o cargar uno tienes que hacer lo mismo: abrir el archivo, hacer lo que
*realmente* quieres hacer y luego cerrar el archivo. Esto es tedioso
y fácil de olvidar. En Ruby, guardar (o cargar) archivos trabaja en forma similar
al código anterior, entonces no tienes que preocuparte por nada más que por
lo que quieres guardar(o cargar). (En el próximo capitulo mostraré donde
encontrar información sobre guardar y cargar archivos.)

También puedes escribir métodos que determinan cuantas veces, o incluso *si*
deben llamar a un proc. Aquí hay un método el cual podría llamar al proc la mitad de veces
y otro el cual lo llamará el doble de veces:

*Código:*

```ruby
def puedeHacerse unProc
  if rand(2) == 0
    unProc.call
  end
end

def hacerDosVeces unProc
  unProc.call
  unProc.call
end

parpadeo = Proc.new do
  puts '<parpadeo>'
end

mirada = Proc.new do
  puts '<mirada>'
end

puedeHacerse parpadeo
puedeHacerse mirada
hacerDosVeces parpadeo
hacerDosVeces mirada
```

*Resultado:*

    <mirada>
    <parpadeo>
    <parpadeo>
    <mirada>
    <mirada>

(Si ejecutas el programa un par de veces, verás que la salida cambiará) Estos son
algunos de los casos comunes de uso de procs lo que le permite hacer cosas, utilizando
simplemente métodos no podriamos hacerlo. Seguramente, podrías escribir un método para
que parpadee dos veces, pero no podrías escribir uno que haga *algo* dos veces!

Antes de continuar, vamos a ver un último ejemplo. Los procs que
hemos visto son bastante similares. Es tiempo de ver algo diferente,
entonces vamos a ver cuanto un método depende de un proc pasado a este.
Nuestro método tomará algun objeto y un proc, y llamará a este proc
sobre este objeto. Si el proc retorna falso, terminamos; en caso contrario
llamaremos al proc con el objeto. Continuaremos haciendo esto hasta
que el proc retorne falso (esto es mejor, o el programa finalizará con
error). El método retornará el último valor no falso retornado por
el proc.

*Código:*

```ruby
def hacerHastaQueSeaFalso primeraentrada, unProc
  entrada  = primeraentrada
  salida = primeraentrada

  while salida
    entrada  = salida
    salida = unProc.call entrada
  end

  entrada
end

construirMatrizDeCuadrados = Proc.new do |array|
  ultimonumero = array.last
  if ultimonumero <= 0
    false
  else
    array.pop                         #  Quitar el último número...
    array.push ultimonumero*ultimonumero  #  ...y reemplazar este con el último número elevado al cuadrado...
    array.push ultimonumero-1           #  ...seguido por un número menor.
  end
end

siempreFalso = Proc.new do |soloIgnorame|
  false
end

puts hacerHastaQueSeaFalso([5], construirMatrizDeCuadrados).inspect
puts hacerHastaQueSeaFalso('Estoy escribiendo esto a las 3:00 am; ¡alguien que lo finalice!', siempreFalso)
```

*Resultado:*

```html
[25, 16, 9, 4, 1, 0]
Estoy escribiendo esto a las 3:00 am, ¡alguien que lo finalice!
```

Está bien, este es un ejemplo bastante raro, debo admitirlo. Pero esto muestra como
actúa diferente nuestro método cuando le damos diferentes procs.

El método `inspect` es muy parecido a `to_s` , salvo que la cadena que devuelve
trata de mostrar el código ruby para crear el objeto que pasó. Aquí se nos muestra
toda la matriz devuelta por nuestra primera llamada a `haceHastaQueSeaFalso`. Además, notamos
que nosotros no procesamos el `0` al final de la matriz, porque `0`
al cuadrado sigue siendo `0` y por lo tanto no tenía que hacerse. Y puesto
que `siempreFalso` era siempre `false`,`hacerHastaQueSeaFalso` no hace nada la segunda vez que
se llama sino que retorna lo que se le pasó.

## Métodos que retornan Procedimientos

Una de las cosas interesantes que puedes hacer con procs es crearlos
en los métodos y devolverlos. Esto permite realizar cosas grandiosas de
programación (cosas con nombres impresionantes, como *lazy evaluation*,
*estructuras de datos infinitas* y *currying*), pero el hecho es que
casi nunca hago esto en la práctica, ni puedo recordar haber visto a
nadie hacer esto en su código. Creo que es el tipo de cosas que no
suelen llegar a tener que hacer en Ruby, o tal vez simplemente Ruby te
anima a buscar otras soluciones, yo no lo sé. En cualquier caso, sólo
voy a referirme a esto brevemente.

En este ejemplo, `compose` toma dos procs y devuelve un proc nuevo que,
cuando se le llama, llama al primer proc y pasa el resultado en el segundo
proc.

*Código:*

```ruby
def compone proc1, proc2
  Proc.new do |x|
    proc2.call(proc1.call(x))
  end
end

cuadrado = Proc.new do |x|
  x * x
end

doble = Proc.new do |x|
  x + x
end

dobleYCuadrado = compone doble, cuadrado
cuadradoYDoble = compone cuadrado, doble

puts dobleYCuadrado.call(5)
puts cuadradoYDoble.call(5)
```

*Resultado:*

```html
100
50
```

Ten en cuenta que la llamada a `proc1` tenía que estar dentro de los
paréntesis para `proc2` con el fin de que se haga en primer lugar.

## Pasando Bloques (no Procedimientos) en los Métodos

Ok, esto es académicamente interesante pero también algo difícil de usar.
Gran parte del problema es que hay tres pasos que se tienen que realizar
(definir el método, hacer el proc y llamar al método con el proc), parecería
que solo debería haber dos (definir el método y pasar el *bloque* correcto dentro
del método, sin necesidad de usar un proc) ya que la mayoría de las veces usted
no desea utilizar el proc/bloque después de pasarlo al método. Bueno, no lo sabes,
Ruby tiene todo resuelto por nosotros! De hecho, ya ha estabas haciendolo cada
vez que utilizabas iteradores.

Te mostraré primero un ejemplo rápido, y luego vamos a hablar de ello.

*Código:*

```ruby
class Array
  def cadaPar(&fueBloque_ahoraesProc)
    esPar = true  #  Empezamos con "true" porque las matrices comienzan con 0

    self.each do |objeto|
      if esPar
        fueBloque_ahoraesProc.call objeto
      end

      esPar = (not esPar)  #  Cambiar de pares a impares o viceversa
    end
  end

end

['manzana', 'manzana podrida', 'cereza', 'durian'].cadaPar do |fruta|
  puts '¡Yum!  Me encantan los pasteles de '+fruta+', ¿no?'
end

#  Recuerda,, estamos tratando de conseguir los numeros pares
#  de la Matriz.

[1, 2, 3, 4, 5].cadaPar do |bolaImpar|
  puts bolaImpar.to_s+' NO es un número par!'
end
```

*Resultado:*

```html
¡Yum! Me encantan los pasteles de manzana, ¿no?
¡Yum! Me encanta pasteles de cereza, ¿no?
1 NO es un número par!
3 NO es un número par!
5 NO es un número par!
```

Así que para pasar un bloque de `cadaPar` todo lo que tenía que hacer
era pegar el bloque después del método. Puedes pasar un bloque
dentro de cualquier método de esta manera, aunque muchos métodos simplemente
ignorarán el bloque. Con el fin de hacer que tu método *no* ignore el bloque
debes apoderarse de él y convertirlo en un proc y poner el nombre del proc
al final de la lista de parámetros de tu método precedida por el signo `&`.
Así que esa parte es un poco difícil pero no demasiado y sólo tienes que
hacer esto una vez (cuando se define el método). A continuación, puedes
utilizar el método una y otra vez al igual que los métodos que reciben bloques como
`each` y `times`. (Recuerda que con `5.times` ¿hacemos ...?)

Si estás confundido, sólo recuerda lo que `cadaPar` se supone que debe hacer:
llamar al bloque pasado con todos los demás elementos de la matriz. Una vez que lo
hayas escrito y funciona no es necesario pensar en lo que está haciendo en
realidad internamente ("¿qué bloque se llama cuando?") De hecho, esto es
exactamente por lo que escribimos métodos como éste: para que no tengamos
que pensar de nuevo en cómo trabajan. Nos limitamos a usarlos.

Recuerdo una vez que quería ser capaz de medir la duración de distintas secciones
de un programa. (Esto también se conoce como *profiling*.) Así que escribí un
método que toma la hora antes de ejecutar el código, ejecuta y luego toma la hora
al final para obtener la diferencia. No puedo encontrar el código en este momento,
pero no lo necesito, ya que probablemente fue algo como esto:

*Código:*

```ruby
def profile descripcionDeBloque, &bloque
  inicioHora = Time.now

  bloque.call

  duracion = Time.now - inicioHora

  puts descripcionDeBloque+':  '+duracion.to_s+' segundos'
end

profile '25000 duplicaciones' do
  numero = 1

  25000.times do
    numero = numero + numero
  end

  puts numero.to_s.length.to_s+' digitos'  #  El numero de digitos en este numero ENORME.
end

profile 'contar hasta un millon' do
  numero = 0

  1000000.times do
    numero = numero + 1
  end
end
```

*Resultado:*

```html
7526 digitos
25000 duplicaciones:  0.246768 segundos
contar hasta un millon:  0.90245 segundos
```

¡Qué sencillo! Qué elegante! Con ese pequeño método puedo fácilmente saber
cuanto tiempo demora parte de cualquier programa que quiero, solo ejecuto el
código en un bloque y se lo envió a `profile`. ¿Qué podría ser más sencillo? En
la mayoría de los lenguajes, yo tendría que añadir explícitamente el código
de tiempo (lo que está dentro de `profile`) dentro de cada sección que deseo
medir. En Ruby, sin embargo, tengo que mantener todo en un solo lugar, y (más
importante) ¡fuera de mi camino!

## Algunas cosas por intentar

* *Reloj del Abuelo*. Escriba un método que toma un bloque y lo llame una vez
por cada hora que ha pasado hoy. De esta manera, si paso al bloque `do puts 'DONG!' end`
la campana debería sonar (más o menos) como un reloj de péndulo. Pon a prueba
tu método con unos pocos bloques (incluyendo la que acabo de darte). ***Sugerencia:***
Puede utilizar `Time.now.hour` para obtener la hora actual. Sin embargo, este
devuelve un número entre `0` y `23`, por lo que tendrá que modificar los números
a fin de obtener valores clásicos de un reloj de este tipo (`1` *al* `12`).

* *Program Logger*. Escribir un método llamado `log`, la cual toma una
cadena de un bloque y, por supuesto, el bloque. Al igual que `doSelfImportantly`,
deberá `puts` una cadena diciendo que se ha iniciado el bloque, y otra cadena
diciendo que ha terminado el bloque y también debe decir lo que el bloque retornó.
Pon a prueba tu método mediante el envío de un bloque de código. En el interior
del bloque, pon *otra* llamada a `log` pasando otro bloque. (Esto se llama *anidación*.)
En otras palabras, su salida debería ser algo como esto:

*Listado:*

    A partir del "bloque externo" ...
    A partir de "un bloque pequeño" ...
    ... "un bloque pequeño" terminó, regreso: 5
    A partir del "otro bloque" ...
    ... "otro bloque", terminó, regreso: me gusta la comida tailandesa!
    ... "bloque externo", terminó, regreso: false

* *Mejores Logger*. El resultado del último logger fue un poco difícil de leer y
debería empeorar cuanto más se use. Sería mucho más fácil de leer si se indentan
las líneas en los bloques interiores. Para ello, tendrás que llevar la cuenta
de cuán profundamente estás anidado cada vez que el logger quiere escribir algo.
Para ello, utilice una *variable global*, una variable que se puede ver en
cualquier parte de tu código. Para hacer una variable global, sólo precede a
su nombre con el símbolo `$` , como los siguientes:  `$global`, `$nestingDepth` y
`$bigTopPeeWee`. Al final, el logger debe generar un código como este:

*Listado:*

    A partir del "bloque externo" ...
      A partir de "un bloque pequeño" ...
        A partir del "pequeñito-minúsculo bloque" ...
        ... "pequeñito-minúsculo bloque" terminó, regreso: un montón de amor
      ... "un bloque pequeño" terminó, regreso: 42
      A partir del "otro bloque" ...
      ... "otro bloque", terminó, regreso: me encanta la comida india!
    ... "bloque externo", terminó, regreso: true

Bueno, eso es todo lo que vas a aprender de este tutorial. ¡Felicitaciones!
¡Has aprendido un montón! Tal vez no tienes ganas de recordar todo, o te has
saltado unas partes ... Realmente, eso está bien. La programación no es sobre
lo que sabes, se trata de lo que puedes imaginar. Como siempre que se sepa
dónde encontrar las cosas que habías olvidado, lo estás haciendo muy bien.
¡Espero que no pienses que escribí todo esto sin revisar estas cosas a cada minuto!
Porque lo hice. Yo también recibí un montón de ayuda con el código de los ejemplos
de este tutorial. Pero, ¿dónde estaba *yo* buscando estas cosas y donde *yo* pido
ayuda?.

[Te voy a enseñar...](/aprende.a.programar/capitulos/fin.html)
