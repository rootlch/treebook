require 'test_helper'

class StatusTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "content should never be empty" do
    status = Status.new
    assert !status.save
    assert !status.errors[:content].empty?
  end

  test "user id should not be empty" do
    status = Status.new
    assert !status.save
    assert !status.errors[:user_id].empty?
  end

end
