require "./lib/processor"

class DateProcessor < Processor

  attr_reader :input_date, :offset_keys
  def initialize(input_date)
    @input_date = input_date
    super()
  end

  def square_date
    (input_date.to_i ** 2).to_s
  end

  def last_four_digits
    square_date[-4, 4]
  end

  def offsets_to_integers
    split(last_four_digits).map(&:to_i)
  end

  def output_hash
    process_to_hash(create_sym_keys(4), offsets_to_integers)
  end
end
