@keypad = [[],[],[],[],[],[]]
@keypad.map! {|e| e = Array.new(50, '.')}

def draw_rect(dimensions)
  x_dimension = dimensions.scan(/\d+/)[0].to_i
  y_dimension = dimensions.scan(/\d+/)[1].to_i
  y_dimension.times do |y|
    x_dimension.times do |x|
      @keypad[y][x] = 'X'
    end
  end
end

def rotate_row(row, distance)
  @keypad[row].rotate!(-distance)
end

def rotate_column(column, distance)
  temp_array = []
  @keypad.each { |element| temp_array << element[column] }
  temp_array.rotate!(-distance)
  @keypad.each_with_index {|e, i| e[column] = temp_array[i]}
  # @keypad.each {|element| print element.to_s + "\n"}
end


File.open('lib/day_eight/day_eight.input') do |file|
  count = 0
  file.each_line do |line|
    case line.split(/\b/)[0]
    when "rect"
        draw_rect(line.split(/\b/)[2])
    when 'rotate'
        case line.split(/\b/)[2]
        when "column"
          rotate_column(line.scan(/\d+/)[0].to_i, line.scan(/\d+/)[1].to_i)
        when "row"
          rotate_row(line.scan(/\d+/)[0].to_i, line.scan(/\d+/)[1].to_i)
        end
      end
  end
  @keypad.each {|element| print element.to_s + "\n"}
  @keypad.each { |element| count += element.count("X") }
  p count
end
