class KeyProcessor

  attr_reader :input_key, :keys, :key_shift_values
  def initialize(input_key)
    @input_key = input_key
    @keys = "abcd".split("").map(&:to_sym)
    @key_shift_values = {}
  end

  def split_input
    @input_key.split("")
  end

  def process_key
    split_input.each_cons(2).with_index do |pair, index|
      @key_shift_values[@keys[index]] = pair.join.to_i
    end
  end

  def output_key_values
    process_key
    @key_shift_values
  end
end
