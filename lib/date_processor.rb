class DateProcessor

  attr_reader :input_date, :offset_shift_keys,
              :counter, :offset_shift_values
  def initialize(input_date)
    @input_date = input_date
    @offset_shift_keys = "abcd"
    @counter = 0
    @offset_shift_values = {}
  end
end
