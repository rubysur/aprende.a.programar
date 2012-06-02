class Dado
  
  def initialize
    # Voy a tirar el dado, a pesar de que 
    # podria hacer otra cosa si quisieramos 
      rodar
  end
  
  def rodar
    @numeroMostrado = 1 + rand(6)
  end
  
  def mostrar
    @numeroMostrado
  end
  
end

puts Dado.new.mostrar