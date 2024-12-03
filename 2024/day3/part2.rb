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

  operations = /mul\(\d+,\d+\)|do\(\)|don't\(\)/

  all_operations = file_data.scan(operations)

  mul_enabled = true
  sum = 0

  all_operations.each { |m|
    case m
    when "do()"
      mul_enabled = true
    when "don't()"
      mul_enabled = false
    else
      sum += mul(m) if mul_enabled
    end
  }

  sum
end

start = Time.now
puts sum_of_multiplications "input.txt"
puts Time.now - start
