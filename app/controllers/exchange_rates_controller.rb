class ExchangeRatesController < ApplicationController
  def preview
    alert = Alert.find(params[:id])

    render json: Preview.new.call(alert)
  end
end
