require 'test_helper'

class TimeCardsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get timecard_url
    assert_redirected_to login_url
  end

  test "should get index" do
    get monthly_url
    assert_redirected_to login_url
  end
end
