# encoding: UTF-8
teGusta = Proc.new do |algoRico|
  puts '¡Me gusta *realmente* el '+algoRico+'!'
end

teGusta.call 'chocolate'
teGusta.call 'ruby'