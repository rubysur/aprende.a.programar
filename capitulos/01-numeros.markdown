# Números


Ahora que tienes todo <a href="/capitulos/00-inicio.markdown">instalado</a>
¡vamos a escribir un programa! Abre tu editor de texto favorito
y escribe lo siguiente:

    puts 1+2

Guarda tu programa (sí, ¡eso es un programa!) como `calc.rb`
(el **.rb** es lo que usualmente ponemos al final de
los programas escritos con Ruby). Ahora ejecuta tu programa escribiendo
`ruby calc.rb` en la línea de comandos. Deberías obtener un `3`
en tu pantalla. ¿Lo ves?, programar no es tan difícil, ¿cierto?

## Introducción a `puts`

¿Cómo es que funciona ese programa? Seguramente puede adivinar qué es lo que
`1+2` hace; nuestro programa es básicamente lo mismo que:

    puts 3

`puts` simplemente escribe en la pantalla lo que sea que escribamos a continuación.

## Enteros y flotantes

En la mayoría de los lenguajes de programación (y Ruby no es la excepción)
los números sin decimales son llamados *enteros* (traducción de *integers* en 
su versión en Inglés), y los números con punto decimal normalmente son llamados
*números de punto flotante* (o llamados solo *flotantes* de ahora en adelante ya que proviene
de su original en inglés *floats*).

Aquí hay algunos enteros:

    5
    -205
    9999999999999999999999999
    0

Y aquí hay algunos flotantes:

    54.321
    0.001
    -205.3884
    0.0

En la práctica, la mayoría de los programas no usan flotantes, sólo enteros.
(Después de todo, nadie quiere leer 7.4 emails, o navegar 1.8 páginas,
o escuchar 5.24 de sus canciones favoritas...)
Los flotantes se usan más con propósitos académicos (como por ejemplo
experimentos científicos) y para gráficos en 3D. Incluso la mayoría de los
programas financieros usan enteros, ¡simplemente llevan un registro de los
centavos!

# Aritmética simple

Hasta ahora, tenemos todo lo que necesita una calculadora simple.
(Las calculadoras siempre usan flotantes, así que si
quiere que su computadora actúe como una calculadora, también debería
usar flotantes). Para suma y resta, usamos <kbd>+</kbd> y <kbd>-</kbd>,
como ya lo vimos. Para la multiplicación, usamos <kbd>*</kbd>, y para
la división usamos <kbd>/</kbd>. La mayoría de los teclados tienen estas
teclas en el teclado numérico a la derecha. Intentemos expandir un poco
nuestro programa calc.rb. Escribe lo siguiente y ejecútalo:

    puts 1.0 + 2.0
    puts 2.0 * 3.0
    puts 5.0 - 8.0
    puts 9.0 / 2.0

Esto es lo que retorna el programa:

    3.0
    6.0
    -3.0
    4.5

(Los espacios en el programa no son importantes; simplemente
hacen que el código sea más fácil de leer). Bueno, eso no
fue muy sorprendente. Ahora probemos con enteros:

    puts 1+2
    puts 2*3
    puts 5-8
    puts 9/2

Básicamente lo misno, ¿no?

    3
    6
    -3
    4

Uh... ¡excepto por el último!
Pero cuando se hace aritmética con enteros, se obtienen enteros.
Cuando su computadora no puede obtener la respuesta "correcta",
siempre redondea hacia abajo. (Por supuesto, `4` *es*
la respuesta correcta en aritmética con enteros para `9/2`;
simplemente tal vez no sea el resultado que esperaba).

Tal vez se pregunte para qué es útil la división entera. Bueno, digamos
que va al cine, pero sólo tiene $9. Aquí en Portland, puede ver una
película en el Bagdad por $2. ¿Cuántas películas puede ver allí?
`9/2`... `4` películas. 4.5 definitivamente *no*
es la respuesta correcta ya que no le dejarán ver la mitad de
una película o dejar que una mitad suya vea la película entera...
algunas cosas simplemente no son divisibles.

¡Así que ahora experimente con algunos programas por su cuenta!
Si quiere escribir expresiones más complejas, puede usar paréntesis.
Por ejemplo:

*Código:*

    puts 5 * (12-8) + -15
    puts 98 + (59872 / (13*8)) * -52

*Resultado:*

    5
    -29802

## Algunas cosas por intentar

Escribe un programa que te diga:

* cuántas horas hay en un año?
* cuántos minutos hay en una década?
* ¿cuántos segundos de edad tiene usted?
* ¿cuántos chocolates espera comer en su vida?
***Advertencia:** ¡Esta parte del programa puede tomar tiempo para computarse!*

Aquí hay una pregunta más difícil:

* Si tengo 1031 millones de segundos de edad, ¿cuántos años tengo?"
  
Cuando termine de jugar con números, hechemos un vistazo
a algunos  <a href="/capitulos/02-textos.markdown">textos</a>.