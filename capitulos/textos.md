Textos
======

Así que hemos aprendido todo acerca de [números](/aprende.a.programar/capitulos/numeros.html),
¿pero qué hay acerca de letras?, ¿palabras? o ¿textos?

Nos referimos a grupos de letras en un programa como **textos**. Tú puedes
pensar en letras impresas siendo insertadas en un cartel. Aquí hay algunos
textos:

```html
"Hola."
"Ruby la rompe."
"5 es mi número favorito... ¿Cuál es el tuyo?"
"Snoopy dice #%^?&*@! cuando le aplastan el dedo del pie."
"     "
""
```

Como puedes ver, los textos pueden tener puntuación, dígitos, símbolos
y espacios dentro ... más que solo palabras. Ese último texto no tiene
nada y podemos llamarlo un texto **vacío**.

Hemos estado usando `puts` para imprimir números, intentémoslo con textos:

```ruby
puts "Hola, mundo!"
puts ""
puts "Adiós."
```

El resultado es el siguiente:

```html
Hola, Mundo!

Adiós.
```

Eso funcionó muy bien. Ahora inténtalo con algún texto tuyo.

Aritmética de textos
--------------------

Al igual que hacer aritmética con números, ¡tú también puedes hacer
aritmética con textos! Bueno, algo así... digamos que puedes sumar
textos. Intentemos sumar dos textos y ver que hace `puts` con eso.

**Código:**

```ruby
puts "Me gusta" + "el pastel de manzana."
```

**Resultado:**

```html
Me gustael pastel de manzana.
```

Whoops! Me olvidé de poner un espacio entre `"Me gusta"` y
`"el pastel de manzana."`. Los espacios generalmente no importan salvo si
se escriben dentro de los textos (es verdad lo que dicen: las computadoras
no hacen lo que tú *quieres* que hagan, sólo lo que tú *les dices* que
hagan). Intentémoslo nuevamente:

**Código:**

```ruby
puts "Me gusta " + "el pastel de manzana."
puts "Me gusta" + " el pastel de manzana."
```

**Resultado:**

```html
Me gusta el pastel de manzana.
Me gusta el pastel de manzana.
```

Como puedes ver, no importó a que texto le agregué el espacio.

Así que puedes sumar textos, pero ... ¡también puedes multiplicarlos! (por
un número...). Observa esto:

**Código:**

```ruby
puts "parpadeo " * 4
```

**Resultado:**

```html
batea tus párpados
```

Solo bromeaba, en realidad muestra esto:

```html
parpadeo parpadeo parpadeo parpadeo
```

Si lo piensas, tiene mucho sentido. Después de todo, `7 * 3` realmente
sólo significa `7 + 7 + 7`, así que `"moo" * 3` sólo significa
`"moo" + "moo" + "moo"`.

`12` vs `"12"`
--------------

Antes de ir más allá, debemos asegurarnos de entender la diferencia entre
números y dígitos. `12` es un número, pero `"12"` es un texto de dos
dígitos.

Juguemos un poco con esto:

**Código:**

```ruby
puts  12  +  12
puts "12" + "12"
puts "12  +  12"
```

**Resultado:**

```html
24
1212
12  +  12
```

Y qué sucede con esto?:

**Código:**

```ruby
puts  2  *  5
puts "2" *  5
puts "2  *  5"
```

**Resultado:**

```html
10
22222
2  *  5
```

Estos ejemplos fueron bastante directos. De cualquier modo, si no tienes
cuidado en cómo mezclas textos y números podrías encontrarte con...

Problemas
---------

En este punto podrías haber probado algunas cosas que no funcionaron. Si
no lo has hecho, aquí hay algunas:

**Código:**

```ruby
puts "12" + 12
puts "2" * "5"
```

**Resultado:**

```html
in `+': no implicit conversion of Fixnum into String (TypeError)
```

Hmmm... un mensaje de error. El problema es que en realidad no puedes sumar
un número a un texto o multiplicar un texto por otro texto. Tiene tan poco
sentido como esto:

```ruby
puts "Betty" + 12
puts "Fred" * "John"
```

Algo más para tener cuidado: Puedes escribir `"pig" * 5` en un programa,
dado que sólo significa `5` veces el texto `"pig"` todo junto. De cualquier
modo, tú *no puedes* escribir `5 * "pig"`, ya que eso significa `"pig"`
veces el número `5`, lo cual es simplemente tonto.

Finalmente, por ejemplo, si quisieras que tu programa imprimiera
`¡Mi sobrenombre es "Pepe"!`?  Podrías intentar:

```ruby
puts "¡Mi sobrenombre es "Pepe"!"
```

Bueno, eso no va a funcionar. La computadora no va a poder ejecutarlo
porque piensa que el texto termina en el segundo `"` (antes de `Pepe`)
y que `Pepe` es un método de Ruby, lo cual no es para nada cierto.

Entonces, ¿cómo hacemos para que la computadora entienda el texto
que incluye doble comillas (`"`)? Olvidé mencionarte que también
puedes usar comillas simples (`'`) para escribir texto en Ruby.

Entonces, podrías combinar comillas simples (`'`) o dobles (`"`) según
lo requieras. Es más fácil de entender, si miramos los siguientes
ejemplos:

**Código:**

```ruby
puts "Mi nombre es Jo'C."
puts '¡Mi sobrenombre es "Pepe"!'
```

**Resultado:**

```html
Mi nombre es Jo'C
¡Mi sobrenombre es "Pepe"!
```

Si tiene algunas dudas, [¡sigue leyendo!](/aprende.a.programar/capitulos/variables.html)
Vas a encontrar muchas respuestas a continuación (después de todo, no
puedo contestar cada pregunta en tan sólo una página).
