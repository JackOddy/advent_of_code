current_values = [0, 0, 0]
previous_total = 0
count = 0

data = File.foreach("data") do |line|
  value = line.to_i
  current_values.rotate!
  current_values[-1] = value


  total = current_values.sum

  count += 1 if total > previous_total

  previous_total = total
end


puts count - 3
