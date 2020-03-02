class KeyProcessor

  attr_reader :input_key, :keys
  def initialize(input_key)
    @input_key = input_key
    @keys = [*"a".."d"].map(&:to_sym)
  end

  def split_input
    @input_key.split("")
  end

  def create_pairs
    split_input.each_cons(2).with_object([]) do |pair, array_of_pairs|
      array_of_pairs << pair.join.to_i
    end
  end

  def process_key
    @keys.zip(create_pairs).to_h
  end
end
