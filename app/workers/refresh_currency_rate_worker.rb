class RefreshCurrencyRateWorker
  include Sidekiq::Worker

  def perform()
    Rate.find_in_batches(batch_size: 100) do |rates|
      rates.each do |rate|
        responce = CurrencyApi::Conversions.new(rate.currency_from.contraction, rate.currency_to.contraction,1).convert
        rate.update(amount: responce['amount'])
      end
    end
  end
end
