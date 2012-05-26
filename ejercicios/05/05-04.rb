# encoding: UTF-8

puts 'Cuál es tu nombre completo?'
name = gets.chomp
puts 'Sabes que hay ' + name.length + ' caracteres en tu nombre, ' + name + '?'

# el mensaje que devuelve es:
# in `+': can't convert Fixnum into String (TypeError)