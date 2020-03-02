require "./lib/enigma"

enigma = Enigma.new
from = File.open(ARGV[0], "r")
to = File.open(ARGV[1], "w")

info = from.readlines.map(&:chomp)
from.close
p info

unless info == [""] || info.length > 3
  results = enigma.encrypt(info[0], info[1], info[2]) if info.length == 3
  results = enigma.encrypt(info[0], info[1]) if info.length == 2
  results = enigma.encrypt(info[0]) if info.length == 1

  results.each do |key, info|
    to.write("#{info}\n")
  end
  to.close

  puts "Created '#{ARGV[1]}' with the key #{results[:key]} and date #{results[:date]}"

else
  puts "Your encrypt source file is invalid, you should have a txt file with three lines.

        The Message
        The Key (optional)
        The Date (optional)

        Please try again with a proper source txt file."
end
