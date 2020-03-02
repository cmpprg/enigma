require "./lib/processor"

class KeyProcessor < Processor

  attr_reader :input_key
  def initialize(input_key)
    @input_key = input_key
    super()
  end

  def create_pairs
    split(@input_key).each_cons(2).with_object([]) do |pair, array_of_pairs|
      array_of_pairs << pair.join.to_i
    end
  end

  def create_keys
    @alphabet.first(4).map(&:to_sym)
  end

  def output_hash
    process_to_hash(create_keys, create_pairs)
  end
end
