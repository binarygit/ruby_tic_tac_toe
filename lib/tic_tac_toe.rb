#!/usr/bin/ruby
require_relative 'string'
require_relative 'rules'
require_relative 'player'
require_relative 'board'
require 'pry-byebug'

class TicTacToe
  include Rules
  attr_accessor :current_player, :move, :markers_array
  attr_reader :player_one, :player_two, :board

  def initialize
    @board = Board.new
    @markers_array = board.markers_array
  end

  def open
    display_game_screen
    create_players
  end

  def play
    loop do
      display_game_screen
      print "\n #{current_player.name}, Make your move: "
      @move = current_player.make_move
      if legal?
        board.mark(current_player.marker, @move)
        (return game_over) if game_over_conditions_met?
        set_current_player
      end
    end
  end

  private

  def verdict_message
    return " Yaaaayyyyy!! The winner is: #{current_player.name}\n" if verdict == 'win'
    return " Oh! it's just a draw!\n" if verdict == 'draw'
  end

  def game_over_conditions_met?
    return true if verdict

    return false
  end

  def display_game_screen
    clear_terminal
    display_description
    board.draw
  end

  def display_description
    puts "\n Welcome to Tic Tac Toe"
    puts " A CLI game made in Ruby"
  end

  def create_players
    print " What is the name of Player 1? whose marker is #{'X'.red}: "
    @player_one = @current_player = Player.new('X'.red, gets.chomp.capitalize.red)
    print " What is the name of Player 2? whose marker is #{'O'.green}: "
    @player_two = Player.new('O'.green, gets.chomp.capitalize.green)
  end

  def set_current_player
    return (@current_player = player_one) if current_player == player_two

    @current_player = player_two
  end

  def game_over
    display_game_screen
    puts verdict_message
  end

  def clear_terminal
    system("cls") || system("clear")
  end
end
