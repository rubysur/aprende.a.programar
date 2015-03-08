Matrices e Iteraciones
======================

Vamos a escribir un programa el cual nos pida digitar tantas
palabras como nosotros querramos (una palabra por línea),
continuando hasta que oprimamos *Enter* en una línea
vacia), el cual luego nos devolverá las palabras en orden
alfabetico. OK?

Entonces... nosotros primero vamos; uh... um... hmmm...  Bueno,
nosotros podríamos; er... um...

Tú sabes, no pienso que podamos hacer esto. Necesitamos una
forma de almacenar una cantidad desconocida de palabras y como
obtener todas ellas juntas, entonces no se confundan con otras
variables. Necesitamos colocarlas en un tipo de lista. Lo que
necesitamos son *matrices*.

Una matriz es solo una lista en su computadora. Cada  posición en
la lista actúa como una variable: puedes ver que objeto en
particular apunta a cada posición, y puedes hacer que este apunte
a un objeto diferente. Vamos a echar un vistazo a algunas matrices:

```ruby
[]
[5]
['Hola', 'Adiós']

flavor = 'vainilla'           #  Esto no es una matriz, por supuesto...
[89.9, flavor, [true, false]]  #  ...pero esto sí lo es.
```

Entonces primero tenemos una matriz vacía, luego una matriz
conteniendo un número simple, luego una matriz que contiene
dos textos. Siguiendo, tenemos una simple asignación, luego
un array conteniendo tres objetos, de los cuales el último
es la matriz `'[true, false]'`. Recuerda, variables
no son objetos, entonces nuestra última matriz es en realidad
un flotante, un *texto* y una matriz. Aún si
nosotros hubieramos puesto `'flavor'` a punto o algo más,
esto no hubiera cambiado la matriz.

Para ayudarnos a encontrar un objeto particular en una matriz,
cada posición es dada por un índice numérico. Programadores
(y, por cierto, la mayoría de los matemáticos) comienzan
contando desde cero, por lo que la primera posicion del array
es cero. Aquí es como nosotros deberíamos referenciar los
objetos en una matriz:


*Código:*

```ruby
names = ['Ada', 'Belle', 'Chris']

puts names
puts names[0]
puts names[1]
puts names[2]
puts names[3]  #  Éste está fuera del rango.
```

*Resultado:*

```html
Ada
Belle
Chris
Ada
Belle
Chris
```

Entonces, nosotros vemos que `'puts names'` imprime
cada nombre en la matriz `'names'`. Luego usamos
`'puts names[0]'` para imprimir el "primer" nombre en
la matriz, y `'puts names[1]'` para imprimir el "segundo"
... Estoy seguro que esto parece confuso, pero puedes
acostumbrarte a esto. Tienes que realmente solo comenzar
pensando que el contador comienza en cero, y dejas de usar
palabras como "primero" y "segundo"

Si tienes un conjunto de cinco cursos, no hablas acerca del "primer"
curso, hablas acerca del curso cero (y en tu cabeza, estás pensando
`'course[0]'`). Tú tienes cinco dedos en tu mano derecha,
y sus números son 0, 1, 2, 3 y 4. Mi esposa y yo somos malabaristas.
Cuando hacemos malabares con seis objetos, nosotros estamos con
los objetos 0-5. Esperamos en los próximos meses, poder manejarnos
con el objeto 6 (y por lo tanto trataremos de manejarnos con 7 objetos)
Tu sabrás que lo has aprendido cuando comiences a usar la palabra
"cero". Sí, esto es real; pregunta a cualquier programador o
matemático.

Finalmente, tratamos `'puts names[3]'`, solo para ver
que podría suceder. ¿Estabas esperando un error? Algunas veces
cuando preguntas algo, tu pregunta no tiene sentido (al menos para
tu computadora); ahí es cuando obtienes un error.
Algunas veces, en cambio, tu puedes preguntar algo y la
respuesta es nada. ¿Qué hay en la posición tres? Nada.
¿Qué hay en `'names[3]'`?  `'nil'`: Es la forma Ruby
de decir "nada". `'nil'`  es un objeto especial que
significa "no hay ningún objeto".

Si todo este divertido numerado de posiciones está molestándote,
¡no te preocupes! También, podemos evitar esto completamente usando
varios metodos para matrices, como el que sigue:

## El Metodo `'each'`

`'each'` nos permite hacer algo (lo que queramos)
a *cada* objeto que apunte. Así, si queremos decir algo
bueno acerca de cada lenguaje en la matriz de abajo, podríamos hacer
esto:

*Código:*

```ruby
lenguajes = ['Inglés', 'Alemán', 'Ruby']

lenguajes.each do |leng|
  puts '¡Me gusta ' + leng + '!'
  puts '¿A ti?'
end

puts '¡Y vamos a escuchar esto para C++!'
puts '...'
```

*Resultado:*

```html
¡Me gusta Inglés!
¿A tí?
¡Me gusta Alemán!
¿A tí?
¡Me gusta Ruby!
¿A tí?
¡Y vamos a escuchar esto para C++!
...
```

¿Qué acaba de ocurrir? Bueno, tenemos permitido ir a través
de cada objeto en la matriz sin utilizar ningún número, así
esto es definitivamente mejor. Traducido al español
diriamos que: para cada `'each'` objeto en `'lenguajes'`,
apunta la variable `'leng'` al objeto y entonces `'do'`
(do = hacer) todo lo que te digo, hasta que llegues al `'end'`.
(Sólo para que sepas, C++ es otro lenguaje de programación. Este es
mucho más difícil de aprender que Ruby; por lo general, un programa
hecho en C++ será muchas veces más extenso que un programa en Ruby
que haga la misma funcionalidad)

Tú estarás pensando para ti mismo, "Esto es un montón de bucles
como los que hemos aprendido antes". Sí, esto es similar.
Una diferencia importante es que el método `'each'` es solo eso:
un método. `'while'` y `'end'`; tal como `'do'`,
`'if'`, `'else'`, y todas las otras "palabras" no lo son.
Ellos son una parte fundamental del lenguaje Ruby,
tal como `'='` y los paréntesis son tipos de puntuación como en español.

Pero no `'each'`; `'each'` es solo otro método de la matriz.
Métodos como `'each'` los cuales 'actuan como' bucles son a menudo
llamados *iteradores*.

Algo para saber sobre iteradores es que estos son siempre seguidos por
`'do'`...`'end'`.
`'while'` y `'if'` nunca tuvieron un `'do'` cerca de ellos;
nosotros solo usamos `'do'` con iteradores

Aquí hay otro pequeño iterador, pero esto no es un método para *matriz*... es un método
para *entero*!

*Código:*

```ruby
3.times do
  puts 'Hip-Hip-Hooray!'
end
```

*Resultado:*

```html
Hip-Hip-Hooray!
Hip-Hip-Hooray!
Hip-Hip-Hooray!
```

## Más métodos para Matrices

Entonces hemos aprendido sobre `'each'`, pero hay muchos métodos
más... al menos muchos como métodos para matrices. De hecho, algunos de ellos
(como `'length'`, `'reverse'`, `'+'`, y `'*'`)
trabajan igual que lo hacen para textos, excepto que ellos operan sobre
las posiciones de una matriz y no sobre letras de un texto. Otros, como
`'last'` y `'join'`, son específicos de matrices. Aún otros,
como `'push'` y `'pop'`, en realidad cambian la matriz. Y
así como con métodos para textos, no tienes que recordar todos, puedes
recurrir a recordar sobre ellos buscando información.

Primero, vamos a echar un vistazo a `'to_s'` y `'join'`.
`'join'` trabaja tal como `'to_s'` lo hace, excepto que
éste agrega un texto entre los objetos de la matriz.
Vamos a mirar un poco:

*Código:*

```ruby
alimentos = ['artichoke', 'brioche', 'caramel']

puts alimentos
puts
puts alimentos.to_s
puts
puts alimentos.join(', ')
puts
puts alimentos.join('  :)  ') + '  8)'

200.times do
  puts []
end
```

*Resultado:*

```html
artichoke
brioche
caramel

["artichoke", "brioche", "caramel"]

artichoke, brioche, caramel

artichoke  :)  brioche  :)  caramel  8)
```

Como puedes ver, `'puts'` trata la matriz diferente  a otros objetos:
solo llama `'puts'` sobre cada uno de los objetos en la matriz.
Esto es porque `'puts'` con una matriz vacía 200 veces no hace nada; la
matriz no apunta a nada; entonces no hay nada para `'puts'`. (Hacer nada
200 veces continúa siendo hacer nada).

Trata de usar `'puts'` en una matriz conteniendo otras matrices; ¿hace lo
que esperabas que hiciera?

También, te habrás dado cuenta que dejé fuera el texto vacío cuando quise
hacer `'puts'` de una línea en blanco? Esto hace lo mismo.

Ahora vamos a echar un vistazo a `'push'`, `'pop'` y  `'last'`.
Los métodos `'push'` y `'pop'` son una suerte de métodos opuestos como
lo son `'+'` y `'-'`. `'push'` agrega un objeto al final de la matriz,
y `'pop'` quita el último objeto desde la matriz (y te dice que objeto es).
`'last'` es similar a `'pop'` en el sentido que te indica que hay al final
de la matriz, excepto que éste deja la matriz. De nuevo, `'push'` y `'pop'`
en realidad cambian la matriz:

*Código:*

```ruby
favoritos = []
favoritos.push 'lluvia de rosas'
favoritos.push 'whisky en gatitos'

puts favoritos[0]
puts favoritos.last
puts favoritos.length

puts favoritos.pop
puts favoritos
puts favoritos.length
```

*Resultado:*

```html
lluvia de rosas
whisky en gatitos
2
whisky en gatitos
lluvia de rosas
1
```

## Algunas cosas por intentar

* Escribe el programa del cual hablamos al principio de este capítulo.
**Consejo:**  Hay un hermoso método para matrices el cual te dará la
version ordenada de una matriz: `'sort'`. Usalo!

* Escribe el programa sugerido anteriormente sin usar
el método `'sort'`.  Una gran parte de la programación es la solución de
problemas, entonces ¡obtén toda la práctica que puedas!

* Reescribe tu programa `Tabla de contenidos` (en el capítulo sobre `'métodos'`).
Comienza el programa con una matriz conteniendo toda la información de tu
Tabla de Contenidos (capítulo textos,
capítulo números, etc.). Entonces imprime la información desde
la matriz en una bien formada Tabla de Contenidos.

Hemos aprendido varios métodos diferentes. Ahora es tiempo de aprender como
[hacerlo por nosotros mismos](/aprende.a.programar/capitulos/metodos_propios.html).
