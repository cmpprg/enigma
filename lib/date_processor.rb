class DateProcessor

  attr_reader :input_date, :offset_shift_keys,
              :counter, :offset_shift_values
  def initialize(input_date)
    @input_date = input_date
    @offset_shift_keys = "abcd"
    @offset_shift_values = {}
  end

  def square_date
    (input_date.to_i ** 2).to_s
  end

  def last_four_digits
    square_date[-4, 4]
  end

  def split_digits
    last_four_digits.split("")
  end

  def process_date
    split_digits.each_with_index do |num, index|
      @offset_shift_values[@offset_shift_keys[index].to_sym] = num.to_i
    end
  end

  def output_offset_values
    process_date
    @offset_shift_values
  end
end
