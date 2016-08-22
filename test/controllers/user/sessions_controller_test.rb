require 'test_helper'

class User::SessionsControllerTest < ActionController::TestCase
  include User::SessionsHelper

  test 'should get sign in page' do
    get :new

    assert_response :success
  end

  test 'should redirect to root page if already signed in' do
    user = User.create(email: "user@fm.md", password: "password")
    login(user)

    get :new

    assert_redirected_to root_path
  end

  test 'should sign in user' do
    user = User.create(email: "user@fm.md", password: "password")
    
    post :create, {session: {email: "user@fm.md", password: "password"}}

    assert_equal user.id, session[:user_id] 
    assert_redirected_to root_path
  end

  test 'should sign out user' do
    user = User.create(email: "user@fm.md", password: "password")
    login(user)

    delete :destroy

    assert_not session[:user_id] 
    assert_redirected_to root_path
  end
end
