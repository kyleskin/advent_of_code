#!usr/bin/evn ruby

def abba_checker(letters)
  letters = letters.chars
  while letters.length > 3 do
      return true if letters[0..3] == letters[0..3].reverse
      letters.shift
  end
end


def line_valid?(line)
  bracket_check = []
  brackets = line.scan(/\[\w+\]/)
  brackets.each do |item|
     unless abba_checker(item)
      bracket_check.push(line).uniq!
     end
  end
  bracket_check.each do |item|
    non_brackets = item.chomp("\n").split(/\[\w+\]/)
    non_brackets.each do |entry|
      @valid.push(line).uniq! if abba_checker(entry)
    end
  end
end


File.open('lib/day_seven/day_seven.input') do |file|
  @valid = []
  file.each_line do |line|
    @line = line_valid?(line)
  end
end
 p @valid.length
