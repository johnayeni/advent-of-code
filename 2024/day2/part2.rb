def input filename
  File.read filename
end

def data file
  file.split("\n").map { |line| line.split(' ').map(&:to_i) }
end


def get_input_data filename
  file = input filename
  data file
end


def safe? report
  diffs = report.each_cons(2).map { |a, b| a - b }

  diffs.all? { |d| (1..3).include?(d) } ||  diffs.all? { |d| (-3..-1).include?(d) }
end


def number_of_safe_reports file
  file_data = get_input_data file

  file_data = get_input_data file

  file_data.count { |d|
    d.combination(d.size - 1).any? { |c| safe?(c) }
  }
end

start = Time.now
puts number_of_safe_reports "input.txt"
puts Time.now - start
