module ItemsHelper
  def color_of(date)
    case days_difference(date)
    when -Float::INFINITY...1
      "badge text-bg-danger"
    when 1..3
      "badge text-bg-warning"
    when 4..9
      "badge text-bg-info"
    when 9..Float::INFINITY
      "badge text-bg-light"
    end
  end

  def badge_of(date)
    case days_difference(date)
    when -Float::INFINITY...1
      "EXPIRED"
    when 1..3
      "IN 3 DAYS"
    when 4..9
      "IN A WEEK"
    when 9..Float::INFINITY
      "FUTURE"
    end
  end

  private

  def days_difference(date)
    (date.to_date - Date.today).to_i
  end
end
