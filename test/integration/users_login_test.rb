require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.new(name: '山田太郎', email: 'yamada_taro@example.com',
                     password: 'password', password_confirmation: 'password')
  end
  
  test "login with valid information followed by logout" do
    get login_path
    post login_path, params: { session: { email: @user.email,
                                          password: @user.password } }
    assert is_logged_in?
    assert_redirected_to root_path
    follow_redirect!
    assert_select 'h1', 'マイページ'

    delete logout_path
    assert_not is_logged_in?
    follow_redirect!
    assert_select 'h1', 'ログイン'
  end
end
