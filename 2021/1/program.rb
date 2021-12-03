previous_value = 0
count = 0

File.foreach("data") do |line|
  value = line&.to_i

  count += 1 if value > previous_value
  previous_value = value
end


puts count - 1
