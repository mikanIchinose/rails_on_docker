require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "login with invalid information" do
    get login_path
    assert_template 'sessions/new'
    post login_path, params: { session: { email: '', password: '' } }
    assert_template 'sessions/new'
    # フラッシュメッセージが作成されているか
    assert_not flash.empty?
    # 新しいリクエストを出すとフラッシュメッセージは破棄されるか
    get root_path
    assert flash.empty?
  end
end
