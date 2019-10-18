class AdminController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @history = USD.get_history
  end

  def update
    USD.update params
  end
end