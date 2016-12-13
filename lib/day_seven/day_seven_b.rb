#!usr/bin/env ruby

def aba?(letters)
  letters = letters.chars
  while letters.length > 2 do
    if letters[0..2] == letters[0..2].reverse && letters[0] != letters[1]
      @aba_collection << letters[0..2].join
    end
    letters.shift
  end
end

def bab_transform(aba_collection)
  aba_collection.each do |aba|
    letters = aba.chars
    @bab_collection << letters[1] + letters[0] + letters[1]
  end
end

def find_bab(bab_collection, inside_brackets)
  bab_collection.each do |bab|
    if inside_brackets.to_s.include?(bab)
      @ssl_valid = true
      p bab_collection
      p inside_brackets
    end
  end
end

File.open('lib/day_seven/day_seven.input') do |file|
  @count = 0
  file.each_line do |line|
    @aba_collection = []
    @bab_collection = []
    @ssl_valid = false
    @inside_brackets = line.scan(/\[\w+\]/)
    @outside_brackets = line.chomp("\n").split(/\[\w+\]/)
    @outside_brackets.each do |contents|
      aba?(contents)
    end
    bab_transform(@aba_collection)
    find_bab(@bab_collection, @inside_brackets)
    if @ssl_valid == true
      @count += 1
    end
  end
end
p @count
