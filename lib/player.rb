#!/usr/bin/ruby

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
