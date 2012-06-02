class Integer
  def to_esp
    if self == 5
      espanol = 'cinco'
    else
      espanol = 'cincuenta y ocho'
    end
    
    espanol
  end
end

#  Mejor probarlo en un par de números...
puts 5.to_esp
puts 58.to_esp