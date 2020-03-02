class DateProcessor

  attr_reader :input_date, :offsets
  def initialize(input_date)
    @input_date = input_date
    @offset_keys = [*"a".."d"].map(&:to_sym)
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

  def offsets_to_integers
    split_digits.map(&:to_i)
  end

  def process_date
    @offset_keys.zip(offsets_to_integers).to_h
  end

end
