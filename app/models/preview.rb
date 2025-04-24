class Preview
  def initialize()
    @client = CurrencyExchangeClient.new
  end

  attr_reader :client

  def call(alert)
    currency_pair = alert.currency_pair
    data = get_rates(currency_pair)

    # This 'cons' works similarly to the zip/offset idea.
    today_yesterday_values = data.each_cons(2).map { |yesterday, today| [today, yesterday] }

    result = today_yesterday_values.map do |today, yesterday|
      today_rate = today[currency_pair.first.to_sym][currency_pair.second.to_sym]
      yesterday_rate = yesterday[currency_pair.first.to_sym][currency_pair.second.to_sym]
      is_activated = operate(alert.operator, today_rate, yesterday_rate)
      {
        date: today[:date].iso8601,
        rate: today[:rate].to_s,
        alert_sent: is_activated
      }
    end

    { data: result }
  end

  def operate(operator, x, y)
    case operator
    when '<' then x < y
    when '>' then x > y
    else
      raise ArgumentError, "Unsupported operator: #{operator}"
    end
  end

  def get_rates(currency_pair)
    # Get 8 days. We need the "last day" yesterday
    (0..7).map do |days|
      client.exchange_on_date(currency_pair.first, DateTime.now - days)
    end
  end
end
