#!/usr/bin/ruby

class Board
  attr_accessor :markers_array

  def initialize
    @markers_array = Array.new(9) {|i| i + 1}
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

  def mark(marker, move)
    index_to_insert = move.to_i - 1
    index_to_delete = index_to_insert + 1

    markers_array.insert(index_to_insert, marker)
    markers_array.delete(index_to_delete)
  end

end
