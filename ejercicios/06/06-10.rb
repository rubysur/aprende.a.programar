# encoding: UTF-8

puts 'Hola, ¿cual es tu nombre?'
nombre = gets.chomp
puts 'Hola, ' + nombre + '.'
if (nombre == 'Chris' or nombre == 'Katy')
  puts '¡Que nombre tan hermoso!'
end