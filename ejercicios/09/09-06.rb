class Dado
  
  def roll
    1 + rand(6)
  end
  
end

#  Vamos a crear un par de dados...
dados = [Dado.new, Dado.new]

#  ...y hacerlos rodar.
dados.each do |dado|
  puts dado.roll
end