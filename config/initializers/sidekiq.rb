require 'refreshUSDcurrency'

Sidekiq.configure_client do |config|
  Rails.application.config.after_initialize do
    # You code goes here
    RefreshUSDCurrency.new.perform
  end
end