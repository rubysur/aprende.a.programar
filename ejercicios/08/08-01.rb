# encoding: UTF-8

puts 'Hola, y gracias por tomarse el tiempo para'
puts 'que me ayude con este experimento. Mi experimento'
puts 'tiene que ver con tu gusto acerca de'
puts 'la comida mexicana. Basta con pensar en la comida mexicana'
puts 'y tratar de contestar todas las preguntas con honestidad,'
puts 'ya sea con un "sí" o un "no". Mi experimento'
puts 'no tiene nada que ver con mojar la cama.' 
puts
  
#  Preguntaremos, pero ignoraremos sus respuestas.

buenaRespuesta = false
while (not buenaRespuesta)
  puts '¿Te gusta comer tacos?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
  else
    puts 'Por favor, responda "si" o "no".'
  end
end

buenaRespuesta = false
while (not buenaRespuesta)
  puts '¿Te gusta comer burritos?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
  else
    puts 'Por favor, responda "si" o "no".'
  end
end

#  Presta atención a *esta* respuesta.
buenaRespuesta = false
while (not buenaRespuesta)
  puts '¡Mojas la cama?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
    if respuesta == 'si'
      mojasLaCama = true
    else
      mojasLaCama = false
    end
  else
    puts 'Por favor, responda "si" o "no".'
  end
end

buenaRespuesta = false
while (not buenaRespuesta)
  puts '¿Te gusta comer chimichangas?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
  else
    puts 'Por favor, responda "si" o "no".'
  end
end
  
puts 'Solo una cuantas preguntas más...'

buenaRespuesta = false
while (not buenaRespuesta)
  puts '¿Te gusta comer sopapillas?'
  respuesta = gets.chomp.downcase
  if (respuesta == 'si' or respuesta == 'no')
    buenaRespuesta = true
  else
    puts 'Por favor, responda "si" o "no".'
  end
end

#  Preguntas otras cosas sobre la comida mexicana.

puts
puts 'Interrogatorio:'
puts 'Gracias por tomarse el tiempo para ayudar con'
puts 'este experimento. De hecho, este experimento'
puts 'no tiene nada que ver con la comida mexicana. Es'
puts 'un experimento sobre mojar la cama. La comida mexicana'
puts 'ahí para atraparte con la guardia baja'
puts 'con la esperanza de que respondería más'
puts 'honestamente. Gracias de nuevo.'
puts
puts mojasLaCama