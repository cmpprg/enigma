class Processor

  attr_reader :alphabet
  def initialize
    @alphabet = [*"a".."z"] << " "
  end
end
