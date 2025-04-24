require 'rails_helper'

RSpec.describe 'ExchangeRates', type: :request do
  def json_response
    JSON.parse(response.body)
  end

  describe 'GET /preview' do
    it 'returns the right structure' do
      alert = Alert.new(operator: '<', currency_pair: ['eur', 'usd'], value: 0.5)

      get "/preview/#{alert.currency_pair.join("-")}"

      assert_response :success
      print(json_response)
    end
  end
end
