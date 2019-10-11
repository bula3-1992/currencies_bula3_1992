require 'refreshUSDcurrency'
require 'sidekiq/api'

Sidekiq.configure_client do |config|
  Rails.application.config.after_initialize do
    # You code goes here
    Sidekiq::ScheduledSet.new.clear
    RefreshUSDCurrency.new.perform
  end
end