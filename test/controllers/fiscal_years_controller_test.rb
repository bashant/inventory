require 'test_helper'

class FiscalYearsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fiscal_years_index_url
    assert_response :success
  end

  test "should get home" do
    get fiscal_years_home_url
    assert_response :success
  end

end
