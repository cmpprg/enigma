class Processor

  attr_reader :alphabet
  def initialize
    @alphabet = [*"a".."z"] << " "
  end

  def split(string)
    string.split("")
  end

  def process_to_hash(keys, values)
    keys.zip(values).to_h
  end

  def create_sym_keys(quantity)
    @alphabet.first(quantity).map(&:to_sym)
  end
end
