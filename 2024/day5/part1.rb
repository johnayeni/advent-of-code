require "set"

def input(filename)
  File.read(filename)
end

def data(file)
  parts = file.split("\n\n")

  [
    parts[0].split("\n").map { |r| r.split("|").map(&:to_i) },
    parts[1].split("\n").map { |u| u.split(",").map(&:to_i) }
  ]
end

def get_input_data(filename)
  file = input(filename)
  data(file)
end

def middle_pages(filename)
  rules, updates = get_input_data filename

  updates.select { |u|
    u.combination(2).all? { |c|
      rules.include? c
    }
  }.map { |u|
    u[u.length / 2]
  }.sum
end

start = Time.now
puts middle_pages("input.txt")
puts Time.now - start
