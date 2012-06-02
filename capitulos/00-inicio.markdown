# Inicio

Cuando programas una computadora, necesitas "hablar" en la forma que tu
computadora entienda: un lenguaje de programación. Existen diferentes
lenguajes y muchos de ellos son excelentes. En esta guía voy a
usar mi lenguaje de programación favorito: _Ruby_
 
Además de ser mi favorito, Ruby es también el lenguaje más fácil de
aprender que he visto (y eso que he visto unos cuantos) De hecho, esa es
mi verdadera motivación para escribir esta guía: No decidí escribir una
guía y luego escogí Ruby porque es mi lenguaje favorito; fue la simplicidad
de Ruby lo que me motivó a escribirla. (Esribir una guía similar en otro
lenguaje, como C++ o Java, hubiese requerido cientos y cientos de
páginas) ¡Pero no creas que Ruby es un lenguaje para principiantes solo
porque es fáci! Es un lenguaje poderoso y de calibre profesional, si es
que existe alguno así.

Cuando escribes algo en un lenguaje humano, lo que se escribe es texto.
Cuando escribes algo en un lenguaje de computadora, lo que se escribe es
<dfn>código</dfn>. He incluido muchos ejemplos de código Ruby en esta
guía, muchos de ellos son programas completos que puedes ejecutar en tu
equipo. Para hacer el código más fácil de leer, he marcado partes del
código de distintos colores y formatos. 

Si encuentras algo que no entiendas o si tienes una pregunta que no has
podido resolver, ¡escríbela y sigue leyendo! Es posible que la respuesta
llegue en un capítulo posterior. Sin embargo, si tu pregunta no ha sido
resuelta al finalizar la guía, te voy a mostrar donde preguntar. Hay
muchas personas dispuestas a ayudar; solo necesitas saber donde están.

Pero primero necesitas descargar e instalar Ruby en tu computadora.

## Instalación en Windows

La instalación de Ruby en Windows es rápida, primero debes descargar el
<a href="http://rubyinstaller.rubyforge.org/">Instalador de Ruby</a>.
Puede que haya unas cuantas versiones para escoger; en este tutorial se
utilizará la versión 1.9.3-p194, así que asegúrate de por lo menos
descargar una version tan reciente como la indicada. Luego simplemente ejecuta el
programa de instalación. A menos que tengas una buena razón, sería bueno
que lo instales en la ubicación por defecto.

Para poder programar, vas a necesitar escribir tus programas y
ejecutarlos. Para esto vas a necesitar un editor de texto y la línea de
comando.

El instalador de Ruby viene con un editor de texto llamado SciTE
(el editor de texto Scintilla). Puedes ejecutar SciTE seleccionandolo del
menú de arranque. Si quieres que tu código esté coloreado como los
ejemplos de esta guía, descarga estos archivos y ponlos en tu carpeta de
SciTE (<kbd>c:/ruby/scite</kbd> si escogiste la ubicación por defecto):


* <a href="'+LINKADDR+'SciTEGlobal.properties">Propiedades Globales</a>
* <a href="'+LINKADDR+'ruby.properties">Propiedades de Ruby</a>

Sería una buena idea crear una carpeta para guardar ahí todos tus
programas. Asegúrate de guardar tus programas en esta carpeta.

Para acceder a tu línea de comando, selecciona 

	Menú de Inicio - Accesorios - Símbolo del Sistema

Luego navega hacia la carpeta
designada para tus programas. Escribir #{input 'cd ..'} te llevará una
carpeta arriba (carpeta padre), y #{input 'cd foldername'} te llevará a la
carpeta llamada <kbd>foldername</kbd>. Para ver todos los folders en tu
carpeta actual, escribe #{input 'dir /ad'}.

¡Eso es todo! Estás listo para
<a href="https://github.com/rubyperu/aprendeaprogramar.pe/blob/master/capitulos/01-numeros.html.markdown">
aprender a programar</a>.


## Instalación en Mac

Si tienes Mac OS X 10.7 (Lion), ¡Ruby está instalado en tu sistema! ¿Qué
puede ser más fácil? Desafortunadamente si tienes una versión anterior a Max OS X 10.1
no creo que puedas usar Ruby.

Para poder programar, vas a necesitar escribir tus programas y
ejecutarlos. Para esto vas a necesitar un editor de texto y la línea de
comando.

Tu línea de comando es accesible a través del programa Terminal (que
encontrarás en Applications/Utilities).

Como editor de texto puedes usar uno que te sea familiar o donde te
sientas cómodo. Si usas TextEdit, ¡asegúrate de guardar los programas como
texto! Si no, <em>no funcionarán</em>. Otras opciones para programar son
emacs, vi o pico, todos accesibles desde la línea de comando.

¡Eso es todo! Estás listo para
<a href="https://github.com/rubyperu/aprendeaprogramar.pe/blob/master/capitulos/01-numeros.html.markdown">
aprender a programar</a>.

## Linux Installation

Primero, debes revisar si ya tienes Ruby instalado. Escribe
`which ruby`. Si dice algo como
`/usr/bin/which: no ruby in (...)`, entonces necesitas
<a href="http://www.ruby-lang.org/es/downloads/">descargar Ruby</a>,
si no, revisa que versión de Ruby tienes instalado escribiendo
`ruby -v`. Si es más antigua que la última versión estable
mostrada en la página de descarga mencionada arriba, deberías
actualizarla.

Si eres el usuario root, seguro no necesitas ningunas instrucciones para
instalar Ruby. Si no lo eres, debes pedirle a tu administrador de redes 
que lo instale por ti. (De esa forma todos los usuarios del sistema podrán
usar Ruby.)

Por otro lado, puedes simplemente instalarlo para que tu lo puedas usar.
Mueve el archivo que descargaste a una carpeta temporal, como
<kbd>$HOME/tmp</kbd>.  Si el nombre del archivo es
<kbd>ruby-1.9.3-p194.tar.bz2</kbd>, puedes abrirlo ejecutando
`tar zxvf ruby-1.9.3-p194.tar.bz2`. Cambia de directorio al que acabas
de crear (en este ejemplo, `cd ruby-1.9.3-p194`).

Configura la instalación escribiendo
`./configure --prefix=$HOME`. Luego escribe  `make`, lo
que compilará el interpretador de Ruby. Esto tomará unos minutos. Después
de terminar, escribe `make install` para instalarlo.

Luego, vas a necesitar agergar <kbd>$HOME/bin</kbd> a tu ruta de búsqueda
de comandos editando el archivo <kbd>$HOME/.bashrc</kbd>. (Tal vez debas
cerrar y abrir una nueva sesión para que esto tenga efecto.) Al terminar,
prueba tu instalación: #{input 'ruby -v'}. Si te dice la versión que
tienes instalada, puedes eliminar los archivos en <kbd>$HOME/tmp</kbd> (o 
donde sea que los hayas puesto).

¡Eso es todo! Estás listo para
<a href="https://github.com/rubyperu/aprendeaprogramar.pe/blob/master/capitulos/01-numeros.html.markdown">
aprender a programar</a>.