set :environment, 'development'
set :output,  "#{path}/log/cron.log"

every 1.minute do
  runner "RefreshCurrencyRateWorker.perform_async()"
end