colorArray = []  #  igual a Array.new
colorHash  = {}  #  igual a Hash.new

colorArray[0]         = '#FF0000'
colorArray[1]         = '#008000'
colorArray[2]         = '#0000FF'
colorHash['textos ']  = '#FF0000'
colorHash['numeros']  = '#008000'
colorHash['claves ']  = '#0000FF'

colorArray.each do |color|
  puts color
end
colorHash.each do |tipoCodigo, color|
  puts tipoCodigo + ' :  ' + color
end