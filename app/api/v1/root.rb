module V1
  class Root < Grape::API
    version 'v1'
    format 'json'
    mount V1::Usd
  end
end