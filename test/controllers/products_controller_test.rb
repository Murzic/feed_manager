require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  include User::SessionsHelper
  test "should redirect if not authenticated" do
    get :show, id: 1

    assert_equal "You must authenticate", flash[:danger]
    assert_redirected_to sign_in_path
  end

  test "should get show" do
    user = User.create(email: "user@fm.md", password: "password")
    feed = Feed.create
    product = feed.products.create
    login(user)

    get :show, id: product.id

    assert_response :success
  end

  test "should get new" do
    user = User.create(email: "user@fm.md", password: "password")
    feed = Feed.create
    login(user)

    get :new, feed_id: feed.id

    assert assigns(:product).new_record?
    assert_response :success
  end
end
