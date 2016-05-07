module NumbersHelper
  def short_number(number)
    if number > 10000000000
      calc = (number / 1000000000.0).round(0)
      "#{calc} B"
    elsif number > 1000000000
      calc = (number / 1000000000.0).round(1)
      "#{calc} B"
    elsif number > 10000000
      calc = (number / 1000000.0).round(0)
      "#{calc} M"
    elsif number > 1000000
      calc = (number / 1000000.0).round(1)
      "#{calc} M"
    elsif number > 10000
      calc = (number / 1000.0).round(0)
      "#{calc} K"
    elsif number > 1000
      calc = (number / 1000.0).round(1)
      "#{calc} K"
    else
      number
    end
  end
end
