def profile descripcionDeBloque, &bloque
  inicioHora = Time.now
  
  bloque.call
  
  duracion = Time.now - inicioHora
  
  puts descripcionDeBloque+':  '+duracion.to_s+' segundos'
end

profile '25000 duplicaciones' do
  numero = 1
  
  25000.times do
    numero = numero + numero
  end
  
  puts numero.to_s.length.to_s+' digitos'  #  El numero de digitos en este numero ENORME.
end

profile 'contar hasta un millon' do
  numero = 0
  
  1000000.times do
    numero = numero + 1
  end
end