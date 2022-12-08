def get_input_data file
  input_file = File.open file
  crates, instructions = input_file.read.split "\n\n"
  input_file.close
  [
    crates.split("\n").map(&:chars).transpose.map { |l| l.select { |c| c.match?(/[A-Z]/) } }.reject(&:empty?),
    instructions.scan(/move (\d+) from (\d+) to (\d+)\n?/).map { |l| l.map(&:to_i) }
  ]
end

def top_stack_items file
  crates, instructions = get_input_data file
  instructions.each { |number, from, to|
    crates[to - 1].unshift(*crates[from - 1].shift(number))
  }
  crates.map(&:first).join("")
end

start = Time.now
puts top_stack_items "input.txt"
puts Time.now - start