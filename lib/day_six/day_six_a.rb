#!usr/bin/env ruby
message = Array.new(8, "")
input = File.open('lib/day_six/day_six.input') do |file|
  file.each_line do |line|
    line = line.chomp("\n")
    position = 0
    line.each_char do |char|
      message[position] += char
      position += 1
    end
  end
end

message.each do |line|
  count = Hash.new(0)
  position = 0
  line.each_char do |letter|
    count[letter] += 1
  end
  p count.max_by {|letter, value| value }
end
