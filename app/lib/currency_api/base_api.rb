module CurrencyApi
  class BaseApi
    include HTTParty
    base_uri ENV['AMDOREN_API_BASE_URI']

    def initialize(currency_from, currency_to, amount)
      api_key = ENV['AMDOREN_API_KEY']
      @opts = { query: { api_key: api_key, from: currency_from, to: currency_to, amount: amount } }
    end
  end
end