require "./lib/enigma"

def error_message
  puts  """
        Your encrypt source file is invalid, you should have a txt file with three lines.

        The Message
        The Key;              '12345', must be 5 digits
        The Date (optional);  'ddmmyy' must be 6 digits

        Please try again with a valid source txt file.
        """
end

enigma = Enigma.new
from = File.open(ARGV[0], "r")
to = File.open(ARGV[1], "w")

info = from.readlines.map(&:chomp)
from.close

unless info == [""] || info.length > 3
  results = enigma.encrypt(info[0], info[1], info[2]) if info.length == 3
  results = enigma.encrypt(info[0], info[1]) if info.length == 2

  if results == "Invalid Input"
    error_message
  else
    results.each do |key, info|
      to.write("#{info}\n")
    end
    to.close
    puts "Created '#{ARGV[1]}' with the key #{results[:key]} and date #{results[:date]}"

  end
else
  error_message
end
