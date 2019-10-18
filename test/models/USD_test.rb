require 'test_helper'

class USDTest < ActiveSupport::TestCase
  test "the truth" do
    params = Hash.new
    params[:date] = "18.10.2019"
    params[:time] = "19:14"
    params[:currency] = "63,9542"
    params[:forced] = false
    USD.update params

    params = Hash.new
    params[:date] = "18.10.2019"
    params[:time] = "20:00"
    params[:currency] = "10"
    params[:forced] = true
    USD.update params

    assert_equal '10', USD.currency

    params = Hash.new
    params[:date] = "18.10.2019"
    params[:time] = "19:15"
    params[:currency] = "63,9542"
    params[:forced] = false
    USD.update params

    assert_equal 1, USD.get_history.size
    assert_equal '10', USD.currency

    params = Hash.new
    params[:date] = "18.10.2019"
    params[:time] = "20:15"
    params[:currency] = "63,9542"
    params[:forced] = false
    USD.update params

    assert_equal '63,9542', USD.currency
  end
end