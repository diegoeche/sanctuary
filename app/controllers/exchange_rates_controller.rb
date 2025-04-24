class ExchangeRatesController < ApplicationController
  EXCHANGE_CURRENCIES = %w[usd cop eur].freeze
  EXCHANGE_RATES =
    EXCHANGE_CURRENCIES
    .product(EXCHANGE_CURRENCIES)
    .reject { |x| x.first == x.last }.freeze

  def index
    render json: EXCHANGE_RATES
  end
end
