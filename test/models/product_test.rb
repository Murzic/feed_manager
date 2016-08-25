require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  test "should return array of image urls" do
    product = Product.new(image_urls: "http://url1")

    assert_equal "//url1", product.images_array[0]
  end

  test "should return an empty array if image_urls is nil " do
    product = Product.new()

    assert_equal [], product.images_array
  end
end
