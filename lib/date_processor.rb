class DateProcessor

  attr_reader :input_date, :offset_shift_keys,
              :counter, :offset_shift_values
  def initialize(input_date)
    @input_date = input_date
    @offset_shift_keys = "abcd"
    @counter = 0
    @offset_shift_values = {}
    process_date
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
    split_digits.each do |num|
      @offset_shift_values[@offset_shift_keys[@counter].to_sym] = num.to_i
      @counter += 1
    end
  end
end
