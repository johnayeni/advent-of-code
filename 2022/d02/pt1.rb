def get_input_data file
  input_file = File.open file
  file_data = input_file.readlines.map(&:chomp)
  input_file.close
  return file_data
end


def rock_paper_scissors file
  file_data = get_input_data file

  total_score = 0

  file_data.each { |round|
    plays = round.split ""
    playerA = plays.first
    playerB = plays.last
    if playerA == "A"
      if playerB == "X"
        total_score += 4
      elsif playerB == "Y"
        total_score += 8
      elsif playerB == "Z"
        total_score += 3
      end
    elsif playerA == "B"
      if playerB == "Y"
        total_score += 5
      elsif playerB == "Z"
        total_score += 9
      elsif playerB == "X"
        total_score += 1
      end
    elsif playerA == "C"
      if playerB == "Z"
        total_score += 6
      elsif playerB == "X"
        total_score += 7
      elsif playerB == "Y"
        total_score += 2
      end
    end
  }
  return total_score
end

puts rock_paper_scissors "input.txt"
