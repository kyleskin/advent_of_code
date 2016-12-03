#!usr/bin/env ruby

class BlocksAway

  attr_accessor :coordinates, :direction, :distance, :all_moves

  def initialize
    @coordinates = [0, 0]
    @direction = 'north'
    @distance = 0
    @all_moves = []
    p @all_moves << @coordinates

  end

  def parse(moves)
    moves = moves.gsub(' ', '').split(',').map { |move| move.split('', 2) }
  end

  def move(turn, distance)
    if @direction == 'north'
      if turn == 'R'
        @direction = 'east'
        x_move(distance, 'positive')
      elsif turn == 'L'
        @direction = 'west'
        x_move(distance, 'negative')
      end
    elsif @direction == 'south'
      if turn == 'R'
        @direction = 'west'
        x_move(distance, 'negative')
      elsif turn == 'L'
        @direction = 'east'
        x_move(distance, 'positive')
      end
    elsif @direction == 'east'
      if turn == 'R'
        @direction = 'south'
        y_move(distance, 'negative')
      elsif turn == 'L'
        @direction = 'north'
        y_move(distance, 'positive')
      end
    elsif @direction == 'west'
      if turn == 'R'
        @direction = 'north'
        y_move(distance, 'positive')
      elsif turn == 'L'
        @direction = 'south'
        y_move(distance, 'negative')
      end
    end
  end

  def x_move(distance, sign)
      sign == 'positive' ? @coordinates[0] += distance.to_i : @coordinates[0] -= distance.to_i
  end

  def y_move(distance, sign)
    sign == 'positive' ? @coordinates[1] += distance.to_i : @coordinates[1] -= distance.to_i
  end


  def check_coordiantes(coordinates)
    if @all_moves.include?(coordinates)
      @visited_twice = coordinates
      # break
    else
      @all_moves.push(coordinates)
    end
  end

  blocks = BlocksAway.new
  moves_array = blocks.parse('L3, R1, L4, L1, L2, R4, L3, L3, R2, R3, L5, R1, R3, L4, L1, L2, R2, R1, L4, L4, R2, L5, R3, R2, R1, L1, L2, R2, R2, L1, L1, R2, R1, L3, L5, R4, L3, R3, R3, L5, L190, L4, R4, R51, L4, R5, R5, R2, L1, L3, R1, R4, L3, R1, R3, L5, L4, R2, R5, R2, L1, L5, L1, L1, R78, L3, R2, L3, R5, L2, R2, R4, L1, L4, R1, R185, R3, L4, L1, L1, L3, R4, L4, L1, R5, L5, L1, R5, L1, R2, L5, L2, R4, R3, L2, R3, R1, L3, L5, L4, R3, L2, L4, L5, L4, R1, L1, R5, L2, R4, R2, R3, L1, L1, L4, L3, R4, L3, L5, R2, L5, L1, L1, R2, R3, L5, L3, L2, L1, L4, R4, R4, L2, R3, R1, L2, R1, L2, L2, R3, R3, L1, R4, L5, L3, R4, R4, R1, L2, L5, L3, R1, R4, L2, R5, R4, R2, L5, L3, R4, R1, L1, R5, L3, R1, R5, L2, R1, L5, L2, R2, L2, L3, R3, R3, R1')

  moves_array.each do |turn|
    blocks.move(turn[0], turn[1])
  end
  # p @visited_twice
  p @all_moves
  p distance_away = blocks.coordinates[0].abs + blocks.coordinates[1].abs
end
