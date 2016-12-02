require 'spec_helper'
require 'day_one'

RSpec.describe 'Day One' do

  let(:new) { BlocksAway.new }
  let(:moves) { 'R5, L5, R5, R3' }
  let(:turn) { 'R' }

  context 'Part One' do
    it 'takes input and parses it to an array' do
      expect(new.parse(moves)).to eq([['R', '5'], ['L', '5'], ['R', '5'], ['R', '3']])
    end

    it 'starts at coordinates 0,0' do
      expect(new.coordinates).to eq([0,0])
    end

    it 'starts with direction North' do
      expect(new.direction).to eq('north')
    end

    it 'starts with distance of 0' do
      expect(new.distance).to eq(0)
    end

    it 'if starting direction is north, a right turn changes direction to east' do
      pending
      expect(new.move('R', '3')).to eq('east')
    end

    it 'if starting direction is north, a left turn changes direction to west' do
      pending
      expect(new.move('L', '3')).to eq('west')
    end

    it 'adds distance to coordinates right turn' do
      expect(new.move('R', '3')).to eq([3, 0])
    end

    it 'adds distance to coordinates for left turn' do
      expect(new.move('L', '3')).to eq([0,3])
    end
end


end
