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
      sum += multiplication m if mul_enabled
    end
  }

  sum
end

start = Time.now
puts sum_of_multiplications "input.txt"
puts Time.now - start
