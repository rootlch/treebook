require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "profile name should be unique" do
    user = users(:chl)
    model_validate_attribute user, :profile_name
  end

  test "email should be unique" do
    user = users(:copycat)
    user.email = users(:chl).email
    model_validate_attribute user, :email
  end

  test "must have first name" do
    user = users(:chl)
    user.first_name = ""
    model_validate_attribute user, :first_name
  end

  test "must have last name" do
    user = users(:chl)
    user.last_name = ""
    model_validate_attribute user, :last_name
  end

  test "profile name may not contain spaces" do
    user = User.new
    user.profile_name = "aefae awefa"
    model_validate_attribute user, :profile_name
  end

  test "profile name may contain _ and - " do
    user = User.new
    user.profile_name = "hiby-y_ou"
    user.save
    assert user.errors[:profile_name].empty?
  end
end
