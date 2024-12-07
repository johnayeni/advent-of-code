def input(filename)
  File.read(filename)
end

def data(file_content)
  file_content.split("\n")
    .map { |line|
      target, equation = line.split(":")

      [
        target.to_i,
        equation.split("\s").map(&:to_i)
      ]
   }
end

def get_input_data(filename)
  file = input(filename)
  data(file)
end

def solution1?(target, equation)

  find_solution = lambda do |target, rem, val|

    if rem.empty?
      return val == target
    end

    return find_solution.call(target, rem[1..-1], val * rem[0]) || find_solution.call(target, rem[1..-1], val + rem[0])
  end

  find_solution.call(target, equation[1..-1], equation[0])
end

def solution2?(target, equation)

  find_solution = lambda do |target, rem, val|

    if rem.empty?
      return val == target
    end

    return find_solution.call(target, rem[1..-1], val * rem[0]) ||
           find_solution.call(target, rem[1..-1], val + rem[0]) ||
           find_solution.call(target, rem[1..-1], "#{val}#{rem[0]}".to_i)
  end

  find_solution.call(target, equation[1..-1], equation[0])
end

def part_1(filename)

  data = get_input_data(filename)

  data.select { |d|
    target, equation = d
    solution1?(target, equation)
  }.map(&:first).sum
end

def part_2(filename)

  data = get_input_data(filename)

  data.select { |d|
    target, equation = d
    solution2?(target, equation)
  }.map(&:first).sum
end

start = Time.now
puts "Part 1: #{part_1('input.txt')}"
elapsed_time = ((Time.now - start) * 1000).to_i
puts "Elapsed time: #{elapsed_time} milliseconds"

start = Time.now
puts "Part 2: #{part_2('input.txt')}"
elapsed_time = ((Time.now - start) * 1000).to_i
puts "Elapsed time: #{elapsed_time} milliseconds"
