module ApplicationHelper
  def comma_separater(number)
    number_with_precision(number, signigicant: 'true', delimiter:',', precision: 0)
  end
end
