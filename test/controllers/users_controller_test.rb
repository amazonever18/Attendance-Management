require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get signup_path
    assert_response :success
  end

  test "form class" do
    get signup_path
    assert_select 'form[action="/users"]'
  end
end
