#!/usr/bin/ruby

module Rules
  def legal?
    markers_array[index] == move.to_i
  end

  def index
    move.to_i - 1
  end

  def verdict
    # rows
    return 'win' if markers_array[0..2].uniq == [current_player.marker]
    return 'win' if markers_array[3..5].uniq == [current_player.marker]
    return 'win' if markers_array[6..8].uniq == [current_player.marker]
    # diagonals
    return 'win' if ([markers_array[2]] + [markers_array[4]] + [markers_array[6]]).uniq == [current_player.marker]
    return 'win' if ([markers_array[0]] + [markers_array[4]] + [markers_array[8]]).uniq == [current_player.marker]
    # columns
    return 'win' if ([markers_array[0]] + [markers_array[3]] + [markers_array[6]]).uniq == [current_player.marker]
    return 'win' if ([markers_array[1]] + [markers_array[4]] + [markers_array[7]]).uniq == [current_player.marker]
    return 'win' if ([markers_array[2]] + [markers_array[5]] + [markers_array[8]]).uniq == [current_player.marker]
    # draw
    return 'draw' if markers_array & Array.new(9) { |i| i + 1 } == []
  end
end
