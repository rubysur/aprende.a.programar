# Texto

Así que hemos aprendido toco acerca de 
<a href="https://github.com/rubyperu/aprende_a_programar/blob/master/capitulos/01_numeros.markdown">números</a>,
pero qué acerca de letras?  palabras?  texto?

Nos referimos a grupos de letras en un programa como <dfn>cadenas</dfn>.  (Tu puedes
pensar en letras impresas siendo ensartadas en un cartel.)
Para que sea más fácil diferencias qué parte del código es una cadena, 
colorearé las cadenas de <font color="red">rojo</font>.
Aquí hay algunas cadenas:


    'Hola.'
    'Ruby la rompe.'
    '5 es mi número favorito... ¿Cuál es el tuyo?'
    'Snoopy dice #%^?&*@! when he stubs his toe.'
    '     '
    ''

Como púedes ver, las cadenas pueden tener puntuación, dígitos, símbolos, 
y espacios dentro... más que solo palabras. Esa última cadena
no tiene nada; podemos llamarla una cadena <dfn>vacía</dfn>. 

Hemos estado usando `puts` para imprimir números;
intentémoslo con cadenas:

*Código:*

    puts 'Hola, mundo!'
    puts ''
    puts 'Adiós.'

*Resultado:*

    Hola Mundo

    Adiós

Eso funcionó bien. Ahora inténtalo con alguna cadena tuya. 

## Aritmética de cadenas

Igual que hacer hacer aritmética con números, tu puedes también hacer
aritmética con cadenas! Bueno, algo así... puedes sumar cadenas, digamos. 
Intentemos sumar dos cadenas y ver que hace 
`puts` con eso. 

*Código:*

    puts 'Me gusta' + 'el pastel de manzana.'

*Resultado:*

    Me gustael pastel de manzana

Whoops! Me olvidé de poner un espacio entre `'Me gusta'` y `'el pastel de manzana.'`.
Los espacios no importan generalmente, pero si lo hacen dentro de las cadenas. 
(Es verdad lo que dicen: las computadoras no hacen lo que tu <em>quieres</em>
que hagan, solo lo que tu <em>le dices</em>  que hagan). Intentémoslo nuevamente:

*Código:*

    puts 'Me gusta ' + 'el pastel de manzana.'
    puts 'Me gusta' + ' el pastel de manzana.'

*Resultado:*

    Me gusta el pastel de manzana
    Me gusta el pastel de manzana

(Como puedes ver, no importó a qué cadena le agregué el espacio)

Asíq ue puedes sumar cadenas, pero también puedes multiplicarlas!
(Por un número, es decir) Observa esto:

*Código:*

    puts 'parpadeo ' * 4

*Resultado:*

    batea tus parpados

(Solo bromeaba, en realidad muestra esto):

    parpadeo parpadeo parpadeo parpadeo

Si lo piensas, tiene todo el sentido. Después de todo, 
`7*3` realemnte solo significa `7+7+7`, así que `'moo'*3` solo
significa `'moo'+'moo'+'moo'`.

## `12` vs `'12'`

Antes de ir más allá, debemos asegurarnos de entender la
diferencia entre <em>números</em> y <em>dígitos</em>.
`12` es un número, pero `'12'` es una cadena de dos dígitos.

Juguemos con esto un poco:

*Código:*

    puts  12  +  12
    puts '12' + '12'
    puts '12  +  12'

*Resultado:*

    24
    1212
    12  +  12

Y qué sucede con esto?:

*Código:*

    puts  2  *  5
    puts '2' *  5
    puts '2  *  5'

*Resultado:*

    10
    22222
    2  *  5

Estos ejemplos fueron bastante directos. De cualquier modo, si no tienes
cuidado con cómo mezclas tus cadenas y tus números podrías encontrarte con...

## Problemas

En este punto podrías haber probado algunas cosas que
<em>no funcionaron</em>. Si no lo haz hecho, aquí hay algunas:

*Código:*

    puts '12' + 12
    puts '2' * '5'

*Resultado:*

    #<TypeError: can't convert Fixnum into String>

Hmmm... un mensaje de error.  El problema es eque en realidad
no puedes sumar un número a una cadena, o multiplicar 
una cadena por otra cadena. No tiene más sentido que esto:

    puts 'Betty' + 12
    puts 'Fred' * 'John'

Algo más para tener cuidado: Puedes escribir `'pig'*5` en un programa,
dado que sólo siognifica `5` veces la cadena `'pig'` todo 
sumado. De cualquier modo, 
tu <em>no puedes</em> escribir `5*'pig'`, ya que eso significa `'pig'`
veces el número `5`, lo cual es simplemente tonto.

Finalmente, y si quisieras que tu programa imprimiera
`You\'re swell!`?  Podrías intentar:

    puts 'You're swell!'

Bueno, <em>eso</em> no funcionará; No intentaré ni ejecutarlo.
La computadora pensó que habíamos terminado con la cadena. 
(Esta es la razón de porque es lindo tener un editor de 
texto que haga <dfn>coloreo sintáctico</dfn> por ti.)
¿Entonces cómo permitimos que la computadora sepa que
queremos permanecer en la cadena? Tenemos que <dfn>escapar</dfn>
el apostrofe, de esta manera:

    puts 'You\'re swell!'

La barra invertida es le caracter de escape. En otras palabras, 
si tu tienes una barra invertida y otro caracter, ellos a veces son
convertidos a otro caracter. Las únicas cosas que una barra invertida
escapa son los apóstrofes y las propias barras invertidas. (Si lo 
piensas un poco, los caracteres escapados siempre se escapan a sí mismo).
Unos pocos ejemplos vendrían muy bien, me parece:

*Código:*

    puts 'You\'re swell!'
    puts 'barra invertida al final de la cadena:  \\'
    puts 'arriba\\abajo'
    puts 'arriba\abajo'

*Resultado:*

    You're swell!
    barra invertida al final de la cadena:  \
    arriba\abajo
    arriba\abajo

Dado que la barra invertida <em>no</em> escapa un `'d',
pero <em>si</em> si se escapa a si misma, esos dos últimos caracteres
son idénticos. No parecen lo mismo en el código, pero en tu computadora
son realmente los mismos. 

Si tienes alguna pregunta, solo 
<a href="https://github.com/rubyperu/aprende_a_programar/blob/master/capitulos/03_variables.markdown">
sigue leyendo</a>!  No podría 
contestar cada pregunta en <em>esta</em> página, después de todo.