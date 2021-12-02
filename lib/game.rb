#!/usr/bin/ruby
require_relative 'match'

class Game
  attr_reader :match

  def initialize
    @match = Match.new
  end

  def open
    loop do
      display_main_menu
      loop do
        print "\n Input: "
        input = gets.chomp
        (new_game; break) if input == '1'

        # if input is 2 but save_game doesn't exist
        (print " No saved games to load from\n") if input == '2' && !save_game_exist?
        (load_match; break) if input == '2' && save_game_exist?
      end
      break unless play_again?
    end
  end

  def new_game
    @match = Match.new
    assign_players
    match.play
  end

  def load_match
    match.load
    match.play
  end

  private

  def assign_players
    clear_terminal
    board = Board.new
    print "\n Welcome to Tic Tac Toe" +
          "\n A CLI game made in Ruby\n"
    board.draw
    print " What is the name of Player 1? whose marker is #{'X'.red}: "
    match.player_one = match.current_player = Player.new('X'.red, gets.chomp.capitalize.red)
    print " What is the name of Player 2? whose marker is #{'O'.green}: "
    match.player_two = Player.new('O'.green, gets.chomp.capitalize.green)
  end

  def play_again?
    puts "\n Would you like to play again?\n"
    print ' Type y for yes: '
    answer = gets.chomp
    return true if answer == 'y'

    return false
  end

  def display_main_menu
    clear_terminal
    print "\n Welcome to Tic Tac Toe" +
          "\n A CLI game made in Ruby" +
          "\n\n 1) New Game" +
          "\n 2) Load Game\n\n"
  end

  def save_game_exist?
    return false unless Dir.exist?('saved_games')
    return false if Dir.empty?('saved_games')
    return true
  end

  def clear_terminal
    system('clear') || system('cls')
  end
end

tictactoe = Game.new
tictactoe.open
