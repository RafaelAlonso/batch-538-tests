require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "#full_name" do
    u = User.new(first_name: 'mateus', last_name: 'PEREIRA')

    assert_equal "Mateus Pereira", u.full_name
  end

  test "should be invalid without first and last names" do
    u = User.new

    assert_not u.valid?
  end
end
