#!usr/bin/evn ruby

def palindrome?(letters)
  letters = letters.chars
  while letters.length > 3 do
      return true if letters[0..3] == letters[0..3].reverse && letters[0] != letters[1]
      letters.shift
  end
end

def bracket_valid?(line)
  brackets = line.scan(/\[\w+\]/)
  brackets.each do |bracket_contents|
    if palindrome?(bracket_contents) == true
      @bracket_palindrome = true
    end
  end
end

def outside_brackets_valid?(line)
  outside_brackets = line.chomp("\n").split(/\[\w+\]/)
  outside_brackets.each do |outside_contents|
    if palindrome?(outside_contents) == true
      @outside_bracket_palindrome = true
    end
  end
end

File.open('lib/day_seven/day_seven.input') do |file|
  @count = 0
  file.each_line do |line|
    @bracket_palindrome = false
    @outside_bracket_palindrome = false
    bracket_valid?(line)
    if @bracket_palindrome == false
      outside_brackets_valid?(line)
      @outside_bracket_palindrome
    end
    @count += 1 if @outside_bracket_palindrome == true
  end
end
p @count
