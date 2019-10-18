require 'USD'

class HomescreenController < ApplicationController
  def index
    @currency = USD.currency
  end
end