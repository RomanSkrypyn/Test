class RateCreator

  def initialize(rate_params)
    @rate_params = rate_params
  end

  def self.call(rate_params)
    new(rate_params).call
  end

  def call
    build_rate
  end

  private

  def api_call
    response = CurrencyApi::Conversions.new(api_call_params[:currency_from], api_call_params[:currency_to], 1).convert
    if response['error'] == 0
      OpenStruct.new(amount: response['amount'])
    else
      raise CurrencyApiError, response['error_message']
    end
  end

  def build_rate
    api_call
    @rate_params.merge!(amount: api_call.amount)
    Rate.new(@rate_params)
  end

  def api_call_params
    currency_from = Currency.find(@rate_params['currency_from_id']).contraction
    currency_to = Currency.find(@rate_params['currency_to_id']).contraction
    { currency_from: currency_from, currency_to: currency_to }
  end
end