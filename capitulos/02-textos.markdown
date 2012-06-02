# Textos

Así que hemos aprendido todo acerca de 
<a href="https://github.com/rubyperu/aprendeaprogramar.pe/blob/master/capitulos/01-numeros.html.markdown">números</a>,
¿pero qué acerca de letras?  ¿palabras?  ¿textos?

Nos referimos a grupos de letras en un programa como <dfn>textos</dfn>.  (Tú puedes
pensar en letras impresas siendo ensartadas en un cartel.)
Aquí hay algunos textos:

    'Hola.'
    'Ruby la rompe.'
    '5 es mi número favorito... ¿Cuál es el tuyo?'
    'Snoopy dice #%^?&*@! cuando le aplastan el dedo del pie.'
    '     '
    ''

Como puedes ver, los textos pueden tener puntuación, dígitos, símbolos, 
y espacios dentro... más que solo palabras. Ese último texto 
no tiene nada y podemos llamarlo un texto <dfn>vacío</dfn>. 

Hemos estado usando `puts` para imprimir números, intentémoslo con textos:

*Código:*

    puts 'Hola, mundo!'
    puts ''
    puts 'Adiós.'

*Resultado:*

    Hola Mundo

    Adiós

Eso funcionó bien. Ahora inténtalo con algún texto tuyo. 

## Aritmética de textos

Igual que hacer hacer aritmética con números, ¡tú puedes también hacer
aritmética con textos! Bueno, algo así... puedes sumar textos, digamos. 
Intentemos sumar dos textos y ver que hace 
`puts` con eso. 

*Código:*

    puts 'Me gusta' + 'el pastel de manzana.'

*Resultado:*

    Me gustael pastel de manzana

Whoops! Me olvidé de poner un espacio entre `'Me gusta'` y `'el pastel de manzana.'`.
Los espacios no importan generalmente salvo si lo hacen dentro de los textos. 
(Es verdad lo que dicen: las computadoras no hacen lo que tú <em>quieres</em>
que hagan, solo lo que tú <em>le dices</em>  que hagan) Intentémoslo nuevamente:

*Código:*

    puts 'Me gusta ' + 'el pastel de manzana.'
    puts 'Me gusta' + ' el pastel de manzana.'

*Resultado:*

    Me gusta el pastel de manzana
    Me gusta el pastel de manzana

(Como puedes ver, no importó a que texto le agregué el espacio)

Así que puedes sumar textos, ¡pero también puedes multiplicarlas!
(Por un número ...) Observa esto:

*Código:*

    puts 'parpadeo ' * 4

*Resultado:*

    batea tus párpados

(Solo bromeaba, en realidad muestra esto):

    parpadeo parpadeo parpadeo parpadeo

Si lo piensas, tiene todo el sentido. Después de todo, 
`7*3` realemnte solo significa `7+7+7`, así que `'moo'*3` solo
significa `'moo'+'moo'+'moo'`.

## `12` vs `'12'`

Antes de ir más allá, debemos asegurarnos de entender la
diferencia entre <em>números</em> y <em>dígitos</em>.
`12` es un número, pero `'12'` es un texto de dos dígitos.

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
cuidado en cómo mezclas tus textos y tus números podrías encontrarte con...

## Problemas

En este punto podrías haber probado algunas cosas que
<em>no funcionaron</em>. Si no lo has hecho, aquí hay algunas:

*Código:*

    puts '12' + 12
    puts '2' * '5'

*Resultado:*

    can't convert Fixnum into String (TypeError)

Hmmm... un mensaje de error.  El problema es eque en realidad
no puedes sumar un número a un texto, o multiplicar 
un texto por otro texto. No tiene más sentido que esto:

    puts 'Betty' + 12
    puts 'Fred' * 'John'

Algo más para tener cuidado: Puedes escribir `'pig'*5` en un programa,
dado que sólo significa `5` veces el texto `'pig'` todo 
sumado. De cualquier modo, 
tú <em>no puedes</em> escribir `5*'pig'`, ya que eso significa `'pig'`
veces el número `5`, lo cual es simplemente tonto.

Finalmente, y si quisieras que tu programa imprimiera
`¡Mi nombre es O'hara!`?  Podrías intentar:

    puts '¡Mi nombre es O'hara!'

Bueno, <em>eso</em> no funcionará; No intentaré ni ejecutarlo.
La computadora pensó que habíamos terminado con el texto. 
(Esta es la razón de porque es lindo tener un editor de 
texto que haga <dfn>coloreo sintáctico</dfn> por ti)
¿Entonces, cómo permitimos que la computadora sepa que
queremos permanecer en el texto? Tenemos que <dfn>escapar</dfn>
el apóstrofe, de esta manera:

    puts '¡Mi nombre es O\'hara!'

La barra invertida es el carácter de escape. En otras palabras, 
si tú tienes una barra invertida y otro carácter, ellos a veces son
convertidos a otro carácter. Las únicas cosas que una barra invertida
escapa son los apóstrofes y las propias barras invertidas. (Si lo 
piensas un poco, los caracteres escapados siempre se escapan a sí mismo)
Unos pocos ejemplos vendrían muy bien, me parece:

*Código:*

    puts '¡Mi nombre es O\'hara!'
    puts 'barra invertida al final del texto:  \\'
    puts 'arriba\\abajo'
    puts 'arriba\abajo'

*Resultado:*

    ¡Mi nombre es O'hara!
    barra invertida al final del texto:  \
    arriba\abajo
    arriba\abajo

Dado que la barra invertida <em>no</em> escapa un `'d',
pero <em>si</em> si se escapa a si misma, esos dos últimos caracteres
son idénticos. No parecen lo mismo en el código, pero en tu computadora
son realmente los mismos. 

Si tienes alguna pregunta, solo 
<a href="https://github.com/rubyperu/aprendeaprogramar.pe/blob/master/capitulos/03-variables.html.markdown">
¡sigue leyendo! </a>No podría 
contestar cada pregunta en <em>esta</em> página, después de todo.