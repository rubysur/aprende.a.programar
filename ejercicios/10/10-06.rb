def compone proc1, proc2
  Proc.new do |x|
    proc2.call(proc1.call(x))
  end
end

cuadrado = Proc.new do |x|
  x * x
end

doble = Proc.new do |x|
  x + x
end

dobleYCuadrado = compone doble, cuadrado
cuadradoYDoble = compone cuadrado, doble

puts dobleYCuadrado.call(5)
puts cuadradoYDoble.call(5)