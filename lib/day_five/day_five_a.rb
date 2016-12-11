#!usr/bin/env ruby

require 'digest'

door_ID = 'uqwqemis'

password = Array.new(8)
index = 0
spinning_star = %w(|/-\\)

while(password.compact.length < 8)
  md5 = Digest::MD5.new.update(door_ID + index.to_s).hexdigest
  md5.scan(/^00000(\d)(.)/) do |position,value|
    position = position.to_i
    password[position] = value if position < 8 && password[position].nil?
  end
  print "\b"*8 + password.map{|v| v || spinning_star.first}.join
  spinning_star.rotate!
  index += 1
end
