require 'USD'

class HomescreenController < ApplicationController
  def index
    usd = USD.new
    @currency = usd.get
  end
end