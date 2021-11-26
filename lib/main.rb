#!/usr/bin/ruby
require_relative 'tic_tac_toe'

def play_again?
puts "\n Would you like to play again?\n"
print ' Type y for yes: '
answer = gets.chomp
return true if answer == 'y'
return false
end

loop do
tic_tac_toe = TicTacToe.new
tic_tac_toe.open
tic_tac_toe.play
break unless play_again?
end


