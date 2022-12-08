def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  return file_data
end

def duplicate_assignment_pairs file
  file_data = get_input_data file

  total = 0

  file_data.each { |pair|
    first, second = pair.split ","
    firstSet = first.split("-").map(&:to_i)
    secondSet = second.split("-").map(&:to_i)
    firstIterable = (firstSet.first..firstSet.last).to_a
    secondIterable = (secondSet.first..secondSet.last).to_a
    if firstIterable & secondIterable == firstIterable || secondIterable & firstIterable == secondIterable
      total += 1
    end
  }
  return total
end

start = Time.now
puts duplicate_assignment_pairs "input.txt"
puts Time.now - start