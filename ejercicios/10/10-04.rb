def puedeHacerse unProc
  if rand(2) == 0
    unProc.call
  end
end

def hacerDosVeces unProc
  unProc.call
  unProc.call
end

parpadeo = Proc.new do
  puts '<parpadeo>'
end

mirada = Proc.new do
  puts '<mirada>'
end

puedeHacerse parpadeo
puedeHacerse mirada
hacerDosVeces parpadeo
hacerDosVeces mirada