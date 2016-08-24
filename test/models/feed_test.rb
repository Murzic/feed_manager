require 'test_helper'

class FeedTest < ActiveSupport::TestCase
  test "on destroy should also destroy associated products" do
    feed = Feed.create
    product = feed.products.create

    feed.destroy

    assert_not feed.persisted?
    assert_not product.persisted?, "Feed's product was not destroyed"
  end
end
