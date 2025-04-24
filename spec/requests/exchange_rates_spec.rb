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

      p json_response
    end
  end
end
