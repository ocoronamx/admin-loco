require 'test_helper'

class DemosControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get demos_index_url
    assert_response :success
  end

  test "should get form" do
    get demos_form_url
    assert_response :success
  end

  test "should get show" do
    get demos_show_url
    assert_response :success
  end

  test "should get notices" do
    get demos_notices_url
    assert_response :success
  end

  test "should get landing" do
    get demos_landing_url
    assert_response :success
  end

  test "should get login" do
    get demos_login_url
    assert_response :success
  end

end
