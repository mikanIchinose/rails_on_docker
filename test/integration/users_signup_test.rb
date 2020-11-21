require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "form layout" do
    get signup_path
    assert_select 'h1', 'New User'
    assert_select 'input#user_name[type="text"]'
    assert_select 'input#user_email[type="email"]'
    assert_select 'input#user_password[type="password"]'
    assert_select 'input#user_password_confirmation[type="password"]'
  end

  test "form action" do
    get signup_path
    assert_select 'form[action="/signup"]'
  end

  # ユーザー情報が無効の状態で登録ボタンを押したときにユーザーが作成されない
  test "invalid signup information" do
    get signup_path
    # 無効なデータをpostしてもUser.countの数が変化しない
    assert_no_difference -> { User.count } do
      post signup_path, params: { user: { name: "",
                                        email: "",
                                        password: "pass",
                                        password_confirmation: "word" } }
    end
    assert_template 'users/new'

    # エラーメッセージが正しく表示されている
    assert_select 'div#error_explanation'
    assert_select 'div.alert.alert-danger'
    assert_select 'li', 'Name can\'t be blank'
    assert_select 'li', 'Email can\'t be blank'
    assert_select 'li', 'Password confirmation doesn\'t match Password'
    assert_select 'li', 'Password is too short (minimum is 6 characters)'
  end
end
