module V1
  class Usd < Grape::API
    resource 'usd' do
      get '/' do
        USD.currency
      end


      get '/history' do
        @history = USD.get_history
      end

      post '/' do
        puts 'Hello'
      end
    end
  end
end