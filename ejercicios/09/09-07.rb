class Dado
  
  def rodar
    @numeroMostrado = 1 + rand(6)
  end
  
  def mostrar
    @numeroMostrado
  end
  
end

dado = Dado.new
dado.rodar
puts dado.mostrar
puts dado.mostrar
dado.rodar
puts dado.mostrar
puts dado.mostrar