require 'test_helper'

class LogsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get logs_index_url
    assert_response :success
  end

  test "should get home" do
    get logs_home_url
    assert_response :success
  end

end
