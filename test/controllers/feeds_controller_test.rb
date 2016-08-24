require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  include User::SessionsHelper

  test "redirects to sign_in page if not authenticated" do
    get :index

    assert_redirected_to sign_in_path
  end

  test "gets index with feeds" do
    user = User.create(email: "user@fm.md", password: "password")
    login(user)

    get :index

    assert assigns(:feeds)
  end

  test "gets feed show page with products" do
    feed = Feed.create
    user = User.create(email: "user@fm.md", password: "password")
    login(user)

    get :show, id: feed.id

    assert assigns(:products)
    assert_response :success
  end
end
