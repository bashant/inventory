require 'test_helper'

class StocksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stocks_index_url
    assert_response :success
  end

  test "should get home" do
    get stocks_home_url
    assert_response :success
  end

end
