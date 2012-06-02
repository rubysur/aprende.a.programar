# encoding: UTF-8
# responder '¿Hola?', '¡Hola!', 'Un gusto conocerlo', '¡Oh... que amabe!', 'adios'

comando = ''

while comando != 'adios'
  puts comando
  comando = gets.chomp
end

puts '¡Vuelve pronto!'