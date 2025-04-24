require 'rails_helper'

RSpec.describe 'ExchangeRates', type: :request do
  describe 'GET /index' do
    it 'responds with 200 on the list endpoint' do
      get '/exchange_rates'

      assert_response :success
    end

    it 'returns the right amount of entries' do
      get '/exchange_rates'

      json_response = JSON.parse(response.body)

      total_currencies = ExchangeRatesController::EXCHANGE_CURRENCIES.length
      expect(json_response.length).to eq(total_currencies ** 2 - total_currencies)
    end
  end

  describe 'GET /index' do
    it 'responds with 200 on the list endpoint' do
      get '/exchange_rates/usd'

      assert_response :success
    end

    it 'returns the right amount of entries' do
      get '/exchange_rates/usd'

      json_response = JSON.parse(response.body)

      total_currencies = ExchangeRatesController::EXCHANGE_CURRENCIES.length
      expect(json_response.length).to eq(total_currencies - 1)
    end
  end
end
