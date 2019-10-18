require 'refresh_USD_currency_job'
require 'sidekiq/api'

Sidekiq.configure_client do |config|
  Rails.application.config.after_initialize do
    # You code goes here
    Sidekiq::ScheduledSet.new.clear
    RefreshUSDCurrencyJob.perform_in(1.second)
  end
end