require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user is valid with any string as email and password" do
    user = User.new(email: "anystring", password: "password")

    assert user.valid?
  end

  test "user is not valid without password" do
    user = User.new(email: "anystring")

    assert_not user.valid?
  end

  test "user is not valid without email" do
    user = User.new(password: "password")

    assert_not user.valid?
  end
end
