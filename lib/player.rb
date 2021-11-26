#!/usr/bin/ruby

class Player
  attr_accessor :name
  attr_reader :marker

  def initialize(marker, name)
    @marker = marker
    @name = name
  end

  def make_move
    gets.chomp
  end
end
