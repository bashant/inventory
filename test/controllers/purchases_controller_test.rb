require 'test_helper'

class PurchasesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get purchases_index_url
    assert_response :success
  end

  test "should get home" do
    get purchases_home_url
    assert_response :success
  end

end
