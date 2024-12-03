def input filename
  File.read filename
end


def get_input_data filename
  input filename
end

def mul str
  digits = str.scan(/\d+/)

  digits.map(&:to_i).reduce { |res, d| res * d }
end

def sum_of_multiplications filename
  file_data = get_input_data filename

  pattern = /mul\(\d+,\d+\)/

  matches = file_data.scan(pattern)

  matches.map{ |m| mul(m) }.sum
end

start = Time.now
puts sum_of_multiplications "input.txt"
puts Time.now - start
