# encoding: UTF-8

def numeroEnEspanol numero
  #  Solo estamos considerando los números de 0-100.
  if numero < 0
    return 'Por favor ingrese un numero mayor o igual a cero.'
  end 
  if numero > 100
    return 'Por favor ingrese un numero menor o igual a 100'
  end
  
  numeroDeTexto  = ''  #  Esta es el texto que retorna.
  
  #  "izquierda" es cuanto del número aún falta escribir.
  #  "escrito" es la parte que estamos escribiendo en estos momentos.
  #  escrito y izquierda... lo captas?  :)
  izquierda  = numero
  escrito = izquierda/100          #  Cuantos cientos faltan escribir?
  izquierda  = izquierda - escrito*100  #  Restar estos cientos.
  
  if escrito > 0 
    return 'cien'
  end
  
  escrito = izquierda/10          #  Cuantas decenas faltan escribir?
  izquierda  = izquierda - escrito*10  #  Restar las decenas.
  
  if escrito > 0
    if escrito == 1  #  Ah-ah...
      #  No podemos escribir "diezidos" en lugar de "doce", 
      #  hemos realizado una excepción especial .
      if    izquierda == 0
        numeroDeTexto = numeroDeTexto + 'diez'
      elsif izquierda == 1
        numeroDeTexto = numeroDeTexto + 'once'
      elsif izquierda == 2
        numeroDeTexto = numeroDeTexto + 'doce'
      elsif izquierda == 3
        numeroDeTexto = numeroDeTexto + 'trece'
      elsif izquierda == 4
        numeroDeTexto = numeroDeTexto + 'catorce'
      elsif izquierda == 5
        numeroDeTexto = numeroDeTexto + 'quince'
      elsif izquierda == 6
        numeroDeTexto = numeroDeTexto + 'dieciseis'
      elsif izquierda == 7
        numeroDeTexto = numeroDeTexto + 'diecisiete'
      elsif izquierda == 8
        numeroDeTexto = numeroDeTexto + 'dieciocho'
      elsif izquierda == 9
        numeroDeTexto = numeroDeTexto + 'diecinueve'
      end
      #  Desde que ya tomamos el digito faltante,
      #  ya no tenemos nada que escribir.
      izquierda = 0
    elsif escrito == 2
      #  Como no podemos decir "veinteiuno",
      #  tenemos que eliminar la "e" final.
      if izquierda == 0
        numeroDeTexto = numeroDeTexto + 'veinte'
      else
        numeroDeTexto = numeroDeTexto + 'veint'
      end
    elsif escrito == 3
      numeroDeTexto = numeroDeTexto + 'treinta'
    elsif escrito == 4
      numeroDeTexto = numeroDeTexto + 'cuartenta'
    elsif escrito == 5
      numeroDeTexto = numeroDeTexto + 'cincuenta'
    elsif escrito == 6
      numeroDeTexto = numeroDeTexto + 'sesenta'
    elsif escrito == 7
      numeroDeTexto = numeroDeTexto + 'setenta'
    elsif escrito == 8
      numeroDeTexto = numeroDeTexto + 'ochenta'
    elsif escrito == 9
      numeroDeTexto = numeroDeTexto + 'noventa'
    end
    
    if izquierda > 0
      numeroDeTexto = numeroDeTexto + 'i'
    end
  end
  
  escrito = izquierda  #  Cuanto falta para el número?
  izquierda  = 0     #  Restar lo que falta.
  
  if escrito > 0
    if    escrito == 1
      numeroDeTexto = numeroDeTexto + 'uno'
    elsif escrito == 2
      numeroDeTexto = numeroDeTexto + 'dos'
    elsif escrito == 3
      numeroDeTexto = numeroDeTexto + 'tres'
    elsif escrito == 4
      numeroDeTexto = numeroDeTexto + 'cuatro'
    elsif escrito == 5
      numeroDeTexto = numeroDeTexto + 'cinco'
    elsif escrito == 6
      numeroDeTexto = numeroDeTexto + 'seis'
    elsif escrito == 7
      numeroDeTexto = numeroDeTexto + 'siete'
    elsif escrito == 8
      numeroDeTexto = numeroDeTexto + 'ocho'
    elsif escrito == 9
      numeroDeTexto = numeroDeTexto + 'nueve'
    end
  end
  
  if numeroDeTexto == ''
    #  La unica forma que "numeroDeTexto" este vacio es que 
    #  "numero" sea 0.
    return 'cero'
  end
  
  #  Si numeroDeTexto os hasta hasta aqui es que tenemos un numero 
  #  entre 0 y 100, por lo que debemos retornar "numeroDeTexto".
  numeroDeTexto
end

puts numeroEnEspanol(  0)
puts numeroEnEspanol(  9)
puts numeroEnEspanol( 10)
puts numeroEnEspanol( 21)
puts numeroEnEspanol( 17)
puts numeroEnEspanol( 32)
puts numeroEnEspanol( 88)
puts numeroEnEspanol( 99)
puts numeroEnEspanol(100)