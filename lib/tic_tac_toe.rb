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
    @markers_array = Array.new(9) {|i| i + 1}
    @board = Board.new(markers_array)
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
      mark
      (end_game) if end_condition?
      set_current_player
      end
    end
  end

  private

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

  def mark
    marker = current_player.marker

    index_to_insert = move.to_i - 1
    index_to_delete = index_to_insert + 1

    markers_array.insert(index_to_insert, marker)
    markers_array.delete(index_to_delete)

    board.markers_array = markers_array
  end

  def set_current_player
    return (@current_player = player_one) if current_player == player_two

    @current_player = player_two
  end

  def end_game
    display_game_screen
    (puts " Yaaaayyyyy!! The winner is: #{current_player.name}") if end_condition? == 'win'
    (puts " Oh! it's just a draw!") if end_condition? == 'draw'
    exit
  end

  def clear_terminal
    system("cls") || system("clear")
  end
end
