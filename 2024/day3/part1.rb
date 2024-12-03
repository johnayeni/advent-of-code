def input filename
  File.read filename
end


def get_input_data filename
  input filename
end

def multiplication str
  pattern = /\d+,\d+/

  matches = str.scan(pattern)

  nums = matches[0].to_s.split ","

  nums[0].to_i * nums[1].to_i
end

def sum_of_multiplications filename
  file_data = get_input_data filename

  pattern = /mul\(\d+,\d+\)/

  matches = file_data.scan(pattern)

  matches.map{ |m| multiplication m }.sum
end

start = Time.now
puts sum_of_multiplications "input.txt"
puts Time.now - start
