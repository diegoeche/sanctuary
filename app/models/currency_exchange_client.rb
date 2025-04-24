class CurrencyExchangeClient
  def initialize
  end

  def exchange_on_date(currency, date)
    {
      "date": DateTime.now, # Just a dummy
      "eur": {
	"usd": 1.13550269
      }
    }
  end
end
