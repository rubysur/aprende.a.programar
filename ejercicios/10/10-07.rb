# encoding: UTF-8
class Array
  def cadaPar(&fueBloque_ahoraesProc)
    esPar = true  #  Empezamos con "true" porque las matrices comienzan con 0
    
    self.each do |objeto|
      if esPar
        fueBloque_ahoraesProc.call objeto
      end
      
      esPar = (not esPar)  #  Cambiar de pares a impares o viceversa
    end
  end

end

['manzana', 'manzana podrida', 'cereza', 'durian'].cadaPar do |fruta|
  puts '¡Yum!  Me encantan los pasteles de '+fruta+', ¿no?'
end

#  Recuerda,, estamos tratando de conseguir los numeros pares 
#  de la Matriz.

[1, 2, 3, 4, 5].cadaPar do |bolaImpar|
  puts bolaImpar.to_s+' NO es un número par!'
end