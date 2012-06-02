class Dado
  
  def rodar
    @nummeroMostrado = 1 + rand(6)
  end
  
  def mostrar
    @numeroMostrado
  end
  
end

# Ya que no voy a usar esta dado de nuevo, 
# No es necesario guardarlo en una variable. 
puts Dado.new.mostrar