require 'test_helper'

class TestCardsTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: '山田太郎', email: 'yamada_taro@example.com',
                     password: 'password', password_confirmation: 'password')
  end

  test 'in and out' do
    assert_difference 'TimeCard.count', 0 do
      post timecard_path, xhr: true, params: { in: '出勤' }
    end

    log_in_as(@user)
    assert_difference 'TimeCard.count', 0 do
      post timecard_path, xhr: true, params: { out: '退勤' }
    end
  end
end
