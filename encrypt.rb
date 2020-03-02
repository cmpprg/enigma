require "./lib/enigma"

enigma = Enigma.new
from = File.open(ARGV[0], "r")
to = File.open(ARGV[1], "w")

info = from.readlines.map(&:chomp)
results = enigma.encrypt(info[0], info[1], info[2])

results.each do |key, info|
  to.write("#{info}\n")
end

puts "Created '#{ARGV[1]}' with the key #{results[:key]} and date #{results[:date]}"
