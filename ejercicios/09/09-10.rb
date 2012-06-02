# encoding: UTF-8

class Dragon
  
  def initialize nombre
    @nombre = nombre
    @dormido = false
    @panzaLlena     = 10  #  Esta lleno.
    @intestinoLleno  =  0  #  No necesita ir.
    
    puts @nombre + ' nace.'
  end
  
  def alimentar
    puts 'Alimentas a ' + @nombre + '.'
    @panzaLlena = 10
    pasoDelTiempo
  end
  
  def caminar
    puts 'Haces caminar a ' + @nombre + '.'
    @intestinoLleno  = 0
    pasoDelTiempo
  end
  
  def dormir
    puts 'Colocas a ' + @nombre + ' en la cama.'
    @dormido = true
    3.times do
      if @dormido
        pasoDelTiempo
      end
      if @dormido
        puts @nombre + ' ronca, llenando el cuarto con humo.'
      end
    end
    if @dormido
      @dormido = false
      puts @nombre + ' despierta lentamente.'
    end
  end
  
  def lanzar
    puts 'Lanzas a ' + @nombre + ' en el aire.'
    puts 'Sonrie, sus cejas se mueven.'
    pasoDelTiempo
  end
  
  def acunar
    puts 'Acunas a ' + @nombre + ' suavemente.'
    @dormido = true
    puts 'Rapidamente se queda dormido...'
    pasoDelTiempo
    if @dormido
      @dormido = false
      puts '...pero despierta cuando te detienes.'
    end
  end
  
  private
  
  #  "private" significa que los metodos defindos aqui son
  #  metodos internos al objeto.  (Puedes alimentar a
  #  tu dragon, pero no puedes preguntar si esta hambriento.)
  
  def hambriento?
    #  Los nombres de los metodos pueden terminar en "?".
    #  Generalmente, hacemos esto si el método debe
    #  devolver verdadero o falso, como esto:
    @panzaLlena <= 2
  end
  
  def ganas?
    @intestinoLleno >= 8
  end
  
  def pasoDelTiempo
    if @panzaLlena > 0
      #  Mueve el alimento del vientre al intestino.
      @panzaLlena      = @panzaLlena      - 1
      @intestinoLleno  = @intestinoLleno  + 1
    else  #  Nuestro dragon esta hambriento!
      if @dormido
        @dormido = false
        puts '¡Se despierta de repente!'
      end
      puts '¡' + @nombre + ' esta hambriento!  En su desperacion, ¡te COMIO!'
      exit  #  Sale del programa.
    end
    
    if @intestinoLleno  >= 10
      @intestinoLleno  = 0
      puts '¡Uy!  ' + @nombre + ' tuvo un accidente...'
    end
    
    if hambriento?
      if @dormido
        @dormido = false
        puts '¡Se despierta de repente!'
      end
      puts 'El estomago de ' + @nombre + 'retumba...'
    end
    
    if ganas?
      if @dormido
        @dormido = false
        puts 'Se despierta de repente!'
      end
      puts @nombre + ' hace la danza del baño...'
    end
  end
  
end

mascota = Dragon.new 'Norbert'
mascota.alimentar
mascota.lanzar
mascota.caminar
mascota.dormir
mascota.acunar
mascota.dormir
mascota.dormir
mascota.dormir
mascota.dormir