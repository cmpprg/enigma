class KeyProcessor

  attr_reader :input_key, :key_categories, :counter
  def initialize(input_key)
    @input_key = input_key
    @key_shift_keys = "abcd"
    @counter = 0
    @key_shift_values = {}
  end

  def split_input
    @input_key.split("")
  end

  def process_key
    split_input.each_cons(2) do |pair|
      key_shift_values[@key_shift_keys[@counter].to_sym] = pair.join.to_i
      @counter += 1
    end
  end
end