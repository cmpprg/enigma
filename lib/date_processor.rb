class DateProcessor

  attr_reader :input_date, :offset_shift_keys,
              :counter, :offset_shift_values
  def initialize(input_date)
    @input_date = input_date
    @offset_shift_keys = "abcd"
    @counter = 0
    @offset_shift_values = {}
  end

  def square_date
    (input_date.to_i ** 2).to_s
  end

  def process_date
    last_four_nums = square_date[-4, 4]

    split_four_nums = last_four_nums.split("")

    x = split_four_nums.each do |num|
      @offset_shift_values[@offset_shift_keys[@counter].to_sym] = num.to_i
      @counter += 1
    end
  end
end
