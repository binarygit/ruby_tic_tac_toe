#!/usr/bin/ruby
require_relative 'string'
require 'pry-byebug'

class Game
  attr_reader :player_one, :player_two, :markers_array
  def initialize
    @markers_array = Array.new(9) {|i| i + 1}
    @current_turn = nil
  end
  
  def open
    display_description
    initialize_players
  end

  private

  def initialize_players
    print " What is the name of Player 1? whose marker is #{'X'.red}: "
    @player_one = Player.new('X'.red, gets.chomp)
    print " What is the name of Player 2? whose marker is #{'O'.green}: "
    @player_two = Player.new('O'.green, gets.chomp)
  end

  
  def clear_terminal
    system("cls") || system("clear")
  end

  def display_description
    clear_terminal
    puts
    puts ' Welcome to Tic Tac Toe'
    puts ' A CLI game made in Ruby'
    puts
  end
end

class Player
  attr_accessor :name
  attr_reader :marker
  def initialize(marker, name = 'rashid')
    @marker = marker 
    @name = name
  end

  def computer?
    true if computer == true
  end

end

