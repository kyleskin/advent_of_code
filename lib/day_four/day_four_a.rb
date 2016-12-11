#!usr/bin/env ruby
entries = []
all_rooms = []
valid_rooms = []
sector_id_total = 0
File.open('lib/day_four/day_four.txt') do |file|
  until file.eof?
    file.each do |room|
      entries << room.gsub("\n", '')
    end
  end
end

entries.each do |entry|
  entry.gsub!('-', '')
  room = {
    checksum: entry.slice!(-7, 7).gsub(/\W/, ''),
    sector_id: entry.slice!(/\d+/).to_i,
    name: entry,
    letters: ''
  }
  all_rooms << room
end

all_rooms.each do |room|
  hash = Hash.new(0)
  room[:name].each_char { |chr| hash[chr] += 1 }
  hash = hash.each.sort_by { |value, key| [-key, value]  }
  letters = ''
  hash[0..4].each { |letters| room[:letters] += letters[0] }
  if room[:letters] == room[:checksum]
    sector_id_total += room[:sector_id]
    valid_rooms << room
  end
end
