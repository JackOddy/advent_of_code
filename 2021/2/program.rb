depth = 0
horizontal_pos = 0
aim = 0

File.foreach("data") do |line|
  command, n = line.split(" ")

  case [command, n.to_i]
  in ["forward", n]
    horizontal_pos += n
    depth += n * aim
  in ["up", n]
    aim -= n
  in ["down", n]
    aim += n
  end
end

puts depth * horizontal_pos
