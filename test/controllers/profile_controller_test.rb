require "test_helper"

class ProfileControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get profile_index_url
    assert_response :success
  end

  test "should get account" do
    get profile_account_url
    assert_response :success
  end

  test "should get settings" do
    get profile_settings_url
    assert_response :success
  end
end
