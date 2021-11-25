#!/usr/bin/ruby

module Rules
  def legal?
    markers_array[move.to_i - 1] == move.to_i
  end

  def win?
    # rows
    return true if markers_array[0..2].uniq == [current_player.marker]
    return true if markers_array[3..5].uniq == [current_player.marker]
    return true if markers_array[6..8].uniq == [current_player.marker]
    # diagonals
    return true if ([markers_array[2]] + [markers_array[4]] + [markers_array[6]]).uniq == [current_player.marker]
    return true if ([markers_array[0]] + [markers_array[4]] + [markers_array[8]]).uniq == [current_player.marker]
    # columns
    return true if ([markers_array[0]] + [markers_array[3]] + [markers_array[6]]).uniq == [current_player.marker]
    return true if ([markers_array[1]] + [markers_array[4]] + [markers_array[7]]).uniq == [current_player.marker]
    return true if ([markers_array[2]] + [markers_array[5]] + [markers_array[8]]).uniq == [current_player.marker]
  end

  def draw?
    markers_array & Array.new(9) { |i| i + 1 } == []
  end
end
