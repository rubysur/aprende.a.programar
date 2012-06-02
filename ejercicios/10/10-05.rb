# encoding: UTF-8
def hacerHastaQueSeaFalso primeraentrada, unProc
  entrada  = primeraentrada
  salida = primeraentrada
  
  while salida
    entrada  = salida
    salida = unProc.call entrada
  end
  
  entrada
end

construirMatrizDeCuadrados = Proc.new do |array|
  ultimonumero = array.last
  if ultimonumero <= 0
    false
  else
    array.pop                         #  Quitar el último número...
    array.push ultimonumero*ultimonumero  #  ...y reemplazar este con el último número elevado al cuadrado...
    array.push ultimonumero-1           #  ...seguido por un número menor.
  end
end

siempreFalso = Proc.new do |soloIgnorame|
  false
end

puts hacerHastaQueSeaFalso([5], construirMatrizDeCuadrados).inspect
puts hacerHastaQueSeaFalso('Estoy escribiendo esto a las 3:00 am; ¡alguien que lo finalice!', siempreFalso)