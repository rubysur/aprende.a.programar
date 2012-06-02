# encoding: UTF-8

def preguntar pregunta
  buenarespuesta = false
  while (not buenarespuesta)
    puts pregunta
    reply = gets.chomp.downcase
    
    if (reply == 'si' or reply == 'no')
      buenarespuesta = true
      if reply == 'si'
        answer = true
      else
        answer = false
      end
    else
      puts 'Por favor, responder "si" o "no".'
    end
  end
  
  answer  #  Esto es lo que retorna (`true` o `false`).
end

puts 'Hola, y gracias por...'
puts

preguntar '¿Te gusta comer tacos?'      #  Ignoramos la respuesta.
preguntar '¿Te gusta comer burritos?'
mojasLaCama = preguntar '¿Mojas la cama?'  #  Salvamos el valor retornado.
preguntar '¿Te gusta comer chimichangas?'
preguntar '¿Te gusta comer sopapillas?'
preguntar '¿Te gusta comer tamales?'
puts 'Solo unas preguntas mas...'
preguntar '¿Te gusta beber horchata?'
preguntar '¿Te gusta comer flautas?'

puts
puts 'Interrogatorio:'
puts 'Gracias por...'
puts
puts mojasLaCama