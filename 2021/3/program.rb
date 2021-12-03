bits = [0] * 12
count = 0

File.foreach("data") do |line|
  line.chomp.split("").each_with_index do |n, i|
    bits[i] = bits[i] += n.to_i
  end

  count += 1
end

modal_threshold = count / 2

power_consumptions = bits.reduce([[], []]) do |acc, bit|
  gamma = acc.first
  epsilon = acc.last

  above_threshold = bit > modal_threshold

  [
    gamma << (above_threshold ? 1 : 0),
    epsilon << (above_threshold ? 0 : 1)
  ]
end.map(&:join).map { |n| n.to_i(2) }.reduce(:*)


puts power_consumptions

# data1 = File.open('data').readlines.map(&:chomp).map { |l| l.split("") }
# data2 = File.open('data').readlines.map(&:chomp).map { |l| l.split("") }


# def find_binary_number_1(numbers, i = 0)
#   return numbers.first.join if numbers.length == 1
#   return numbers if i == 12

#   zeros, ones = sort_numbers(numbers, i)

#   next_list = ones.length >= zeros.length ? ones : zeros

#   find_binary_number_1(next_list, i + 1)
# end

# def find_binary_number_2(numbers, i = 0)
#   return numbers.first.join if numbers.length == 1
#   return numbers if i == 12

#   zeros, ones = sort_numbers(numbers, i)

#   next_list = zeros.length >= ones.length ? zeros : ones

#   find_binary_number_2(next_list, i + 1)
# end

# def sort_numbers(list, i, ones=[], zeros=[])
#   item = list.pop

#   return zeros, ones if item.nil?

#   ones << item if item[i] == "1"
#   zeros << item if item[i] == "0"

#   sort_numbers(list, i, ones, zeros)
# end

# puts find_binary_number_1(data1).to_i(2) * find_binary_number_2(data2).to_i(2)

