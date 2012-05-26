# Arrays e Iteraciones
  
Vamos a escribir un programa el cual nos pida tipear tantas
palabras como nosotros querramos(una palabra por linea), 
continuando hasta que oprimamos *Enter* en una linea
vacia), el cual luego nos devolvera las palabras en orden 
alfabetico. OK?

Entonces... nosotros primero vamos;uh... um... hmmm...  Bueno
, nosotros podríamos;er...
um... 

Usted sabe, no pienso que podamos hacer esto. Necesitamos una 
forma de almacenar una cantidad desconocida de palabras, y como
obtener todas ellas juntas, entonces no se confundan con otras 
variables. Necesitamos colocarlas en un tipo de lista. Lo que
necesitamos son *arrays*. 

Un array es solo una lista en su computadora. Cada  posicion en 
la lista actua como una variable: puedes ver que objeto en 
particular apunta a cada posicion, y puedes hacer que este apunte
a un objeto diferente. Vamos a echar un vistazo a algunos arrays:

    []
    [5]
    ['Hola', 'Adios']
      
    flavor = 'vanilla'             #  Esto no es un array, porsupuesto...
    [89.9, sabor, [true, false]]  #  ...pero esto si lo es.

Entonces primero tenemos un array vacío, luego un array
conteniendo un simple número, luego un array que contiene
dos strings. Siguiendo, tenemos una simple asignación, luego
un array conteniendo tres objetos, de los cuales el último 
es el array `'[true, false]'`. Recuerda, variables
no son objetos, entonces nuestro ultimo array es en realidad
un punto flotante, un *string*, y un array. Aún asi si
nosotros hubieramos seteado `'sabor'` a punto o algo mas, 
esto no hubiera cambiado el array.

Para ayudarnos a encontrar un objeto particular en un array,
cada posición es dada por un índice numérico. Programadores
(y, por cierto, la mayoría de los matemáticos) comienzan 
contando desde cero, por lo que la primera posicion del array
es cero. Aquí es como nosotros deberíamos referenciar los 
objetos en un array:

    names = ['Ada', 'Belle', 'Chris']

    puts names
    puts names[0]
    puts names[1]
    puts names[2]
    puts names[3]  #  Este esta fuera del rango.

Entonces, nosotros vemos que `'puts names'` imprime
cada nombre en el array `'names'`. Luego usamos
`'puts names[0]'` para imprimir el "primer" nombre en 
el array, y `'puts names[1]'` para imprimir el "segundo"
... Estoy seguro que esto parece confuso, pero puedes 
acostumbrarte a esto. Tienes que realmente solo comenzar 
pensando que el contador comienza en cero, y dejas de usar
palabras como "primero" y "segundo"

Si tu vas a un menú de cinco platos, no hablas acerca del "primer"
curso, hablas acerca del curso cero(y en tu cabeza, estas pensando
`'course[0]'`). Tu tienes cinco dedos en tu mano derecha,
y sus números son 0, 1, 2, 3 y 4. Mi esposa y yo somos malabaristas.
Cuando hacemos malabares con seis objetos, nosotros estamos con 
los objetos 0-5. Esperamos en los próximos meses, poder manejarnos
con el objeto 6(y por lo tanto trataremos de manejarnos con 7 objetos) 
Tu sabrás que lo has aprendido cuando comiences a usar la palabra 
"cero". Sí, esto es real; pregunta a cualquier programador o 
matemático.

Finalmente, tratamos `'puts names[3]'`, solo para ver 
que podría suceder. Estabamos esperando un error? Algunas veces
cuando preguntas algo, tu pregunta no tiene sentido(al menos para
tu computadora); ahí es cuando obtienes un error.      
Algunas veces, en cambio, tu puedes preguntar algo y la 
respuesta es nada. Qué es la posición tres? Nada.
Qué es  `'names[3]'`?  `'nil'`: Es la forma Ruby
de decir "nada". `'nil'`  es un objeto especial, lo cual
significa "no hay ningún objeto".

Si todo este divertido numerado de posiciones esta molestandote,
no te preocupes! También, podemos evitar esto completamente usando
varios metodos array, como el que sigue:

## El Metodo `'each'`

`'each'` nos permite hacer algo(lo que queramos)
a `'each'` objeto que apunte. Asi, si queremos decir algo
bueno acerca de cada lenguaje en el array abajo, podriamos hacer
esto:      

    lenguajes = ['English', 'German', 'Ruby']
      
    lenguajes.each do |leng|
      puts 'Me gusta ' + leng + '!'
      puts 'A ti?'
    end
      
    puts 'Y vamos a escuchar esto para C++!'
    puts '...'

Que acaba de ocurrir? Bueno, tenemos permitido ir a través
de cada objeto en el array sin utilizar ningun número, así 
esto es definitivamente mejor. Traducido al castellano 
diriamos que: Para cada `'each'` objeto en `'lenguajes'`,
 apunta la variable `'leng'` al objeto y entonces `'do'`
(do = hacer) todo lo que te digo, hasta que llegues al `'end'`.
(Sólo para que sepas, C++ es otro lenguaje de programación. Este es 
mucho mas difícil de aprender que Ruby; por lo general, un programa
hecho en C++ será muchas veces más extenso que un programa en Ruby
que haga la misma funcionalidad)

Tú estaras pensando para ti mismo, "Esto es un montón de bucles 
como los que hemos aprendido antes". Sí, esto es similar. 
Una diferencia importante es que el método `'each'` es solo eso:
un método. `'while'` y `'end'`; tal como `'do'`, 
`'if'`, `'else'`, y todas las otras "palabras" no lo son. 
Ellos son una parte fundamental del lenguaje Ruby
, tal como `'='` y los paréntesis; tipos de puntuación como en Ingles.

Pero no  `'each'`; `'each'` es solo otro método del array.
Métodos como `'each' los cuales 'actuan como' bucles son a menudo
llamados *iteradores*.

Algo para saber sobre iteradores es que estos son siempre seguidos por 
`'do'`...`'end'`. 
`'while'` y `'if'` nunca tuvieron un `'do'` cerca de ellos;
nosotros solo usamos `'do'` con iteradores

Aquí hay otro pequeño iterador, pero esto no es un método *array*... es un método
*integer*!

    3.times do
      puts 'Hip-Hip-Hooray!'
    end

## Mas métodos Array

Entonces hemos aprendido sobre `'each'`, pero hay muchos metodos
más... al menos muchos como métodos strings. De hecho, algunos de ellos
(como `'length'`, `'reverse'`, `'+'`, y `'*'` )
trabajan igual que lo hacen para strings, excepto que ellos operan sobre
las posiciones de un array y no sobre letras de un string. Otros, como
`'last'` y `'join'`, son específicos de arrays. Aún otros, 
como `'push'` y `'pop'`, en realidad cambian el array. Y
asi como con metodos para strings, no tienen que recordar todos, puedes
recurrir a recordar sobre ellos(justo aquí)

Primero, vamos a echar un vistazo a `'to_s'` y `'join'`.
`'join'` trabaja tal como `'to_s'` lo hace, excepto que 
este agrega un string entre los objetos del array.
Vamos a mirar un poco:

    foods = ['artichoke', 'brioche', 'caramel']
      
    puts foods
    puts
    puts foods.to_s
    puts
    puts foods.join(', ')
    puts
    puts foods.join('  :)  ') + '  8)'
      
    200.times do
      puts []
    end

Como puedes ver, `'puts'` trata el array diferente  a otros objetos: 
este solo llama `'puts'` sobre cada uno de los objetos en el array. 
Esto es porque `'puts'` con un array vacio 200 veces no hace nada; el 
array no apunta a nada; entonces no hay nada para `'puts'`. (Hacer nada
200 veces continua siendo hacer nada)
Trata de usar `'puts'` en un array conteniendo otros arrays; hace lo 
que esperabas que hiciera?

También, te habras dado cuenta que deje fuera el string vacio cuando quise 
hacer `'puts'` de una linea en blanco? Esto hace lo mismo.

Ahora vamos a echar un vistazo a `'push'`, `'pop'`, y  `'last'`.
Los metodos `'push'` y `'pop'` son una suerte de metodos opuestos como
lo son `'+'` y `'-'`. `'push'` agrega un objeto al final del array,
y `'pop'` quita el último objeto desde el array(y te dice que objeto es). 
`'last'` es similar a `'pop'` en el sentido que este te indica que hay al final 
del array, excepto que este deja el array. De nuevo, `'push'` y `'pop'`
en realidad cambian el array:

    favorites = []
    favorites.push 'raindrops on roses'
    favorites.push 'whiskey on kittens'
      
    puts favorites[0]
    puts favorites.last
    puts favorites.length
      
    puts favorites.pop
    puts favorites
    puts favorites.length

## Unas pocas cosas a probar

Escribe el programa del cual hablamos al principio de este capitulo.
**Consejo:**  Hay un hermoso metodo de arrays el cual te dara la 
version ordenada de un array: `'sort'`. Usalo!

Trata escribiendo el programa sugerido anteriormente sin usar
el metodo `'sort'`.  Una gran parte de la programacion es la solucion de
problemas, entonces obtienes toda la practica que puedas!

Reescribe tu programa Tabla de contenidos (desde el capítulo sobre `'métodos'`.
Comienza el programa con un array conteniendo toda la informacion de tu Tabla de Contenidos(capítulo nombres, 
capítulo números, etc.). Entonces imprime la información desde el array en una bien formada Tabla de Contenidos.

Hemos aprendido un número de diferentes metodos.
Ahora es tiempo de aprender como 
<a href="https://github.com/rubyperu/aprende_a_programar/blob/master/capitulos/08_metodos_propios.markdown">
hacerlo por nosotros mismos</a>.
