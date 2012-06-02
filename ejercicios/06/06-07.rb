# encoding: UTF-8

puts 'Hola, y bienvenido a la clase de 7mo año.'
puts 'Me llamo Mrs. Gabbard. ¿Tú nombre es...?'
nombre = gets.chomp

if nombre == nombre.capitalize
  puts 'Por favor, toma asiento ' + nombre + '.'
else
  puts '¿' + nombre + '? Quieres decir ' + nombre.capitalize + ', ¿cierto?'
  puts '¿No sabes escribir tu propio nombre?'
  respuesta = gets.chomp
  
  if respuesta.downcase == 'si'
    puts '¡Hum!  Bueno, ¡siéntese!'
  else
    puts '¡SALGA DEL SALON!'
  end
end