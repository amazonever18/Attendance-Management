require 'test_helper'

class TestCardsTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:user_1)
  end

  test 'in and out' do
    # TODO: postがうまくtime_card#createに飛ばない
    skip
    assert_difference 'TimeCard.count', 0 do
      post timecard_path, xhr: true, params: { in: '出勤' }
    end

    log_in_as(@user)
    assert_difference 'TimeCard.count', 1 do
      post timecard_path, xhr: true, params: { out: '退社' }
    end
  end
end
