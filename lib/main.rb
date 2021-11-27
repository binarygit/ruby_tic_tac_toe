#!/usr/bin/ruby
require_relative 'tic_tac_toe'

def play_again?
  puts "\n Would you like to play again?\n"
  print ' Type y for yes: '
  answer = gets.chomp
  return true if answer == 'y'

  return false
end

def save_game_exist?
  false
end

def display_main_menu
  clear_terminal
  print "\n Welcome to Tic Tac Toe" +
        "\n A CLI game made in Ruby" +
        "\n\n 1) New Game" +
        "\n 2) Load Game\n\n"
end

def clear_terminal
  system('clear') || system('cls')
end

loop do
  tic_tac_toe = TicTacToe.new
  display_main_menu
  loop do
    print "\n Input: "
    input = gets.chomp
    break if input == '1'

    # if input is 2 but save_game doesn't exist
    (print " No saved games to load from\n") if input == '2' && !save_game_exist?
    (print " Saved games\n") if input == '2' && save_game_exist?
  end
  tic_tac_toe.open
  tic_tac_toe.play
  break unless play_again?
end
