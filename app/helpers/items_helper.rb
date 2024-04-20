module ItemsHelper
  def sweet_date(date)
    if date.year == Date.today.year
      date.strftime("%d %b")
    else
      date.strftime("%b %Y")
    end
  end

  def color_of(date)
    case days_difference(date)
    when -Float::INFINITY...1
      "badge text-bg-dark"
    when 1..2
      "badge text-bg-danger"
    when 3..5
      "badge text-bg-warning"
    when 6..9
      "badge text-bg-success"
    when 9..Float::INFINITY
      "badge text-bg-light"
    end
  end

  def badge_of(date)
    remaining = days_difference(date)
    case remaining
    when -Float::INFINITY...1
      "EXPIRED"
    when 1..9
      "IN #{remaining} DAYS"
    when 10..Float::INFINITY
      "FUTURE"
    end
  end

  private

  def days_difference(date)
    (date.to_date - Date.today).to_i
  end
end
