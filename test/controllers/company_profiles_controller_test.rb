require 'test_helper'

class CompanyProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get company_profiles_index_url
    assert_response :success
  end

  test "should get home" do
    get company_profiles_home_url
    assert_response :success
  end

end
