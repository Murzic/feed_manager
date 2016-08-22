require 'test_helper'

class FeedsControllerTest < ActionController::TestCase
  test "redirects to sign_in page if not authenticated" do
    get :index

    assert_redirected_to sign_in_path
  end
end
