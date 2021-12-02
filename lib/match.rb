#!/usr/bin/ruby
require_relative 'string'
require_relative 'rules'
require_relative 'player'
require_relative 'board'
require 'pry-byebug'

class Match
  include Rules
  attr_accessor :current_player, :move, :markers_array, :player_one, :player_two
  attr_reader :board

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
    puts "\n Welcome to Tic Tac Toe"
    puts " A CLI game made in Ruby"
    board.draw
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
