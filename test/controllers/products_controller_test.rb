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

  test "should create new product" do
    user = User.create(email: "user@fm.md", password: "password")
    feed = Feed.create
    login(user)

    assert_difference("Product.count", 1) do
      post :create, feed_id: feed.id, product: {title: "test_string", aff_code: "test_string", price: "test_string", campaign_name: "test_string", image_urls: "test_string", description: "test_string"}
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should get edit page" do
    user = User.create(email: "user@fm.md", password: "password")
    feed = Feed.create
    product = feed.products.create
    login(user)

    get :edit, id: product.id

    assert_response :success
  end

  test "should update a product" do
    user = User.create(email: "user@fm.md", password: "password")
    feed = Feed.create
    product = feed.products.create
    login(user)

    patch :update, id: product.id, product: {title: "updated", aff_code: "updated", price: "updated", campaign_name: "updated", image_urls: "updated", description: "updated"}

    assert_equal "updated", assigns(:product).title
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy a product" do
    user = User.create(email: "user@fm.md", password: "password")
    feed = Feed.create
    product = feed.products.create
    login(user)

    assert_difference("Product.count", -1) do
      delete :destroy, id: product.id 
    end

    assert_redirected_to feed_path(feed)
  end
end
