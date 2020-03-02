class DateProcessor

  attr_reader :input_date, :offsets
  def initialize(input_date)
    @input_date = input_date
    @offsets = [*"a".."d"].map(&:to_sym)
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
    split_digits.each_with_object({}).with_index do |(num, hash), index|
      hash[@offsets[index]] = num.to_i
    end
  end

end
