require 'test_helper'

class User::SessionsHelperTest < ActionView::TestCase
  test "should set user_id in session" do
    login(Struct.new(:id).new(1))

    assert_equal 1, session[:user_id]
  end

  test "should delete user_id from session" do
    session[:user_id] = 1
    logout

    assert_not session[:user_id]
  end

  test "should return the current user" do
    user = users(:dummy)
    login(user)

    assert_equal user, current_user
  end

  test "should return true if user is signed in" do
    user = users(:dummy)
    login(user)

    assert signed_in?
  end
end
