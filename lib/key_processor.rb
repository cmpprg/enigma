class KeyProcessor

  attr_reader :input_key, :key_categories, :counter
  def initialize(input_key)
    @input_key = input_key
    @key_categories = "abcd"
    @counter = 0
  end

  def split_input
    @input_key.split("")
  end

  def process_key
    key_shift = {}
    split_input.each_cons(2) do |pair|
      key_shift[key_categories[@counter].to_sym] = pair.join.to_i
      @counter += 1
    end
    key_shift
  end
end
