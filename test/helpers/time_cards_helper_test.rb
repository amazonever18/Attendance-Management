require 'test_helper'

class TimeCardsHelperTest < ActionView::TestCase

  def setup
    @user = User.new(name: '山田太郎', email: 'yamada_taro@example.com',
                     password: 'password', password_confirmation: 'password')
    @time_card = TimeCard.new(user: @user, year: 2022, month: 4, day: 4)
  end

  test 'time_diff_string' do
    now = Time.zone.now
    @time_card.in_at = now

    # 59秒
    @time_card.out_at = now + 59
    assert_equal '00:00', time_diff_str(@time_card.work_hours_in_seconds)

    # 1分
    @time_card.out_at = now + 1.minute
    assert_equal '00:01', time_diff_str(@time_card.work_hours_in_seconds)

    # 59分
    @time_card.out_at = now + 59.minutes
    assert_equal '00:59', time_diff_str(@time_card.work_hours_in_seconds)

    # 1時間
    @time_card.out_at = now + 1.hour
    assert_equal '01:00', time_diff_str(@time_card.work_hours_in_seconds)    

    # 10時間
    @time_card.out_at = now + 10.hours
    assert_equal '10:00', time_diff_str(@time_card.work_hours_in_seconds)    

    # 100時間
    @time_card.out_at = now + 100.hours
    assert_equal '100:00', time_diff_str(@time_card.work_hours_in_seconds)    
  end
end  