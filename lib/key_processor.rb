class KeyProcessor

  attr_reader :input_key, :key_categories
  def initialize(input_key)
    @input_key = input_key
    @key_categories = "abcd"
  end

  def process_key
    key_array = @input_key.split("")
    counter = 0
    key_shift = {}
    key_array.each_cons(2) do |pair|
      key_shift[key_categories[counter].to_sym] = pair.join.to_i
      counter += 1
    end
    key_shift
  end
end
