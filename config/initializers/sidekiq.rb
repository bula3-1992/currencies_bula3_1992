require 'refresh_USD_currency_job'
require 'sidekiq/api'

sidekiq_config = { url: ENV['JOB_WORKER_URL'] }

Sidekiq.configure_server do |config|
  config.redis = sidekiq_config
end

Sidekiq.configure_client do |config|
  config.redis = sidekiq_config

  Rails.application.config.after_initialize do
    # You code goes here
    Sidekiq::ScheduledSet.new.clear
    RefreshUSDCurrencyJob.perform_in(1.second)
  end
end