module CurrencyApi
  class Conversions < BaseApi

    def convert
      response = self.class.get('/', @opts)
      response.parsed_response
    end
  end
end