#!usr/bin/env ruby
all_triangles = []
valid_triangles = []
File.open('lib/day_three/day_three.txt') do |file|
  until file.eof?
    triangle = []
    triangle << file.read(4).to_i
    triangle << file.read(5).to_i
    triangle << file.read(5).to_i
    all_triangles << triangle.sort
  end
end

all_triangles.each do |triangle|
  if triangle[0] + triangle[1] > triangle[2]
    valid_triangles << triangle
  end
end

p valid_triangles.length
