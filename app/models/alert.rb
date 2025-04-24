class Alert
  def initialize(operator:, currency_pair:, value:)
    @operator = operator
    @currency_pair = currency_pair
    @value = value
  end

  # a mock
  def self.find(id)
    new(operator: "<", currency_pair: id.split("-"), value: 0.3)
  end

  attr_reader :operator, :currency_pair, :value
end
