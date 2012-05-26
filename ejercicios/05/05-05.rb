# encoding: UTF-8

puts 'Cuál es tu nombre completo?'
name = gets.chomp
puts '¿Sabías que hay ' + name.length.to_s + ' caracteres en tu nombre, ' + name + '?'