def input filename
  File.read filename
end


def get_input_data filename
  input filename
end


def clean_str str
  do_str = "do()"
  dont_str = "don't()"

  new_str = ""

  i = 0
  while i < str.length
    if str.slice(i, dont_str.length) == dont_str
      i = i + dont_str.length - 1
      while i < str.length
        if str.slice(i, do_str.length) == do_str
          i = i + do_str.length - 1
          break
        end
        i += 1
      end

    else
      new_str.concat str[i]
      i += 1
    end
  end

  new_str
end


def multiplication str
  pattern = /\d+,\d+/

  matches = str.scan(pattern)

  nums = matches[0].to_s.split ","

  nums[0].to_i * nums[1].to_i
end

def sum_of_multiplications filename
  file_data = get_input_data filename

  cleaned_str = clean_str file_data

  pattern = /mul\(\d+,\d+\)/

  matches = cleaned_str.scan(pattern)

  matches.map{ |m| multiplication m }.sum
end

start = Time.now
puts sum_of_multiplications "input.txt"
puts Time.now - start
