#!/usr/bin/ruby

class Board
  attr_accessor :markers_array

  def initialize(markers_array = nil)
    @markers_array = markers_array
  end

  def draw
    puts create
  end

  def create
    return 'no markers array provided' if markers_array.nil?
    <<-BOARD
    
  #{markers_array[0]}  |  #{markers_array[1]}  |  #{markers_array[2]}
 +++++++++++++++
  #{markers_array[3]}  |  #{markers_array[4]}  |  #{markers_array[5]}
 +++++++++++++++
  #{markers_array[6]}  |  #{markers_array[7]}  |  #{markers_array[8]}

    BOARD
  end
end
