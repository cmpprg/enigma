class KeyProcessor

  attr_reader :input_key, :key_shift_keys, :counter, :key_shift_values
  def initialize(input_key)
    @input_key = input_key
    @key_shift_keys = "abcd"
    @key_shift_values = {}
  end

  def split_input
    @input_key.split("")
  end

  def process_key
    split_input.each_cons(2).with_index do |pair, index|
      @key_shift_values[@key_shift_keys[index].to_sym] = pair.join.to_i
    end
  end

  def output_key_values
    process_key
    @key_shift_values
  end
end
