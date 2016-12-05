#!usr/bin/env ruby
all_triangles = []
valid_triangles = []
File.open('lib/day_three/day_three.txt') do |file|
  until file.eof?
    triangle1 = []
    triangle2 = []
    triangle3 = []
    3.times do
      triangle1 << file.read(4).to_i
      triangle2 << file.read(5).to_i
      triangle3 << file.read(5).to_i
    end
    all_triangles << triangle1.sort
    all_triangles << triangle2.sort
    all_triangles << triangle3.sort
  end
end

all_triangles.each do |triangle|
  if triangle[0] + triangle[1] > triangle[2]
    valid_triangles << triangle
  end
end

p valid_triangles.length
