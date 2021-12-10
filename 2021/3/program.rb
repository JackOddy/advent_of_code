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

# part 2

def split_list(list, bit_position)
  sorted = list.sort { |a, b| a[bit_position].to_i <=> b[bit_position].to_i }
  first_1 = sorted.find_index { |bit| bit[bit_position] == "1" }

  zeros = sorted.slice!(0...first_1) # removes zeroes from array
  ones = sorted

  return zeros, ones
end

def find_system_value(list, system, bit_position=0)
  return list.first if list.length == 1

    zeros, ones = split_list(list, bit_position)

    if system == :o2
      next_list = ones.length < zeros.length ? zeros : ones
    end

    if system == :co2
      next_list = zeros.length > ones.length ? ones : zeros
    end

    find_system_value(next_list, system, bit_position + 1)
end

data = File.open('data').readlines.map(&:chomp).map { |l| l.split("") }

puts find_system_value(data, :co2).join.to_i(2) * find_system_value(data, :o2).join.to_i(2)



