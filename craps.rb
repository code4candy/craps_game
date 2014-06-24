# encoding: UTF-8

balance = 100
wins = 0
losses = 0

print "Roll the dice (r) or quit (q): "
status = gets.chomp.downcase

while status != "r" && status != "q"
  print "Please type in (r) to play or (q) to quit: "
  status = gets.chomp.downcase
end

while status == "r"
  dice1 = 1 + rand(6)
  dice2 = 1 + rand(6)
  cast = dice1 + dice2
  puts "You threw #{cast}."

  if cast == 7 || cast == 11
    wins += 1
    balance += 10
    puts "You win with a natural! You now have #{balance}€."
    print "New game (r) or quit (q)?: "
    status = gets.chomp.downcase

  elsif cast == 2 || cast == 3 || cast == 12
    losses += 1
    balance -= 10
    puts "Craps - you lose! You now have #{balance}€."
    print "New game (r) or quit (q)?: "
    status = gets.chomp.downcase

  else
    puts "Your point is #{cast}. Rolling..."
    cast_point = 0

    while cast_point != cast && cast_point != 7 
      dice1 = 1 + rand(6)
      dice2 = 1 + rand(6)
      cast_point = dice1 + dice2
      puts "You threw #{cast_point}."

      if cast_point == cast 
        wins += 1
        balance += 10
        puts "You made your point! You now have #{balance}€."
        print "New game (r) or quit (q)?: "
        status = gets.chomp.downcase
        
      elsif cast_point == 7 
        losses += 1
        balance -= 10
        puts "Sorry, you lose. You now have #{balance}€."
        print "New game (r) or quit (q)?: "
        status = gets.chomp.downcase
      end
    end
  end
end

if status == "q"
  puts "Your are leaving the game with a balance of #{balance}€."
  puts "Number of wins: #{wins}"
  puts "Number of losses: #{losses}"
  puts "Thanks for playing!"
end

  