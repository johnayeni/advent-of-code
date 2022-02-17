def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  return file_data
end


def positon file 
  file_data = get_input_data file

  horizontal = 0
  depth = 0

  for i in 0..file_data.length
    instruction = file_data[i].to_s.split " "
    puts instruction
    if instruction[0] == "forward"
      horizontal += instruction[1].to_i
    elsif instruction[0] == "down"
      depth += instruction[1].to_i
    elsif instruction[0] == "up"
      depth -= instruction[1].to_i
    end
  end

  return horizontal * depth
end

puts positon "input.txt"
