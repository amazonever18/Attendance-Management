require 'test_helper'

class TimeCardTest < ActiveSupport::TestCase
  def setup
    @user = users(:user_1)
    @time_card = TimeCard.new(user: @user, year: 2022, month: 4, day: 4)
  end

  def assert_valid
    assert @time_card.valid?
  end

  def assert_not_valid
    assert_not @time_card.valid?
  end

  test 'should be valid' do
    assert_valid
  end

  test 'year shold be present' do
    @time_card.year = nil
    assert_not_valid
  end

  test 'month should be present' do
    @time_card.month = nil
    assert_not_valid
  end

  test 'day should be present' do
    @time_card.day = nil
    assert_not_valid
  end

  test 'year, month, date should be positive integer' do
    time_card = TimeCard.new(user: @user, year: 'abcd', month: 4, day: 4)
    assert_not time_card.valid?

    time_card = TimeCard.new(user: @user, year: -1, month: 4, day: 4)
    assert_not time_card.valid?
    
    time_card = TimeCard.new(user: @user, year: 2022, month: 'ab', day: 4)
    assert_not time_card.valid?
  
    time_card = TimeCard.new(user: @user, year: 2022, month: -1, day: 4)
    assert_not time_card.valid?

    time_card = TimeCard.new(user: @user, year: 2022, month: 4, day: 'ab')
    assert_not time_card.valid?

    time_card = TimeCard.new(user: @user, year: 2022, month: 4, day: -1)
    assert_not time_card.valid?
  end

  test 'combination of year, month, date should be valid date' do
    time_card = TimeCard.new(user: @user, year: 2022, month: 2, day: 29)
    assert_not time_card.valid?
  end

  test 'in_at should be present if out_at is present' do
    @time_card.out_at = Time.now
    assert_not_valid
  end

  test 'out_at should be later than in_at' do
    in_at = Time.now
    out_at = in_at - 10
    @time_card.in_at = in_at
    @time_card.out_at = out_at
    assert_not_valid
  end
end
