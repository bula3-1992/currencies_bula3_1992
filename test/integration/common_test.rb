require 'test_helper'

class CommonTest < ActionDispatch::IntegrationTest

  test "simple" do
    get "/v1/usd"
    assert_response :success

    get "/v1/usd/history"
    assert_response :success

    post "/v1/usd",
         params: { date: "18.10.2019",
                   time: "19:14",
                   currency: "63,9542",
                   forced: false
         }
    assert_response :success
  end
end