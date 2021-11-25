#!/usr/bin/ruby
require_relative 'string'
require 'pry-byebug'

module Rules
  def legal?
    markers_array[move.to_i - 1] == move.to_i
  end

  def win?
    return true if markers_array[0..2].uniq == [current_player.marker]
    return true if markers_array[3..5].uniq == [current_player.marker]
    return true if markers_array[6..8].uniq == [current_player.marker]
    # return true if (markers_array[2] + markers_array[4] + markers_array[6]).uniq == [current_player.marker]
    # return true if (markers_array[0] + markers_array[4] + markers_array[8]).uniq == [current_player.marker]
  end

  def draw?
    markers_array & Array.new(9) { |i| i + 1 } == []
  end
end

class TicTacToe
  include Rules
  attr_reader :player_one, :player_two, :markers_array, :board, :current_player, :move

  def initialize
    @markers_array = Array.new(9) {|i| i + 1}
    @board = Board.new(markers_array)
  end

  def open
    display_description
    create_players
  end

  def display_game_screen
    clear_terminal
    display_description
    board.draw
  end

  def create_players
    @player_one = @current_player = Player.new('X'.red)
    @player_two = Player.new('O'.green)
  end

  def play
    loop do
      clear_terminal
      board.draw
      print "\nMake your move: "
      @move = current_player.make_move
      if legal?
      mark
      (end_game) if (win? || draw?)
      set_current_player
      end
    end
  end

  private

  def end_game
    clear_terminal
    board.draw
    exit
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

  def display_description
    clear_terminal
    puts "\n Welcome to Tic Tac Toe"
    puts " A CLI game made in Ruby\n\n"
  end

  def clear_terminal
    system("cls") || system("clear")
  end
end

class Player
  attr_accessor :name
  attr_reader :marker

  def initialize(marker, name = nil)
    print " What is the name of Player 1? whose marker is #{marker}: "
    @marker = marker
    @name = name.nil? ? gets.chomp : name
  end

  def make_move
    gets.chomp
  end
end

class Board
  attr_accessor :markers_array

  def initialize(markers_array = nil)
    @markers_array = markers_array
  end

  def draw
    return 'no markers array provided' if markers_array.nil?
    puts create
  end

  def create
    <<-BOARD
    \n
  #{markers_array[0]}  |  #{markers_array[1]}  |  #{markers_array[2]}
 +++++++++++++++
  #{markers_array[3]}  |  #{markers_array[4]}  |  #{markers_array[5]}
 +++++++++++++++
  #{markers_array[6]}  |  #{markers_array[7]}  |  #{markers_array[8]}
    BOARD
  end
end

tic_tac_toe = TicTacToe.new
tic_tac_toe.open
tic_tac_toe.play
