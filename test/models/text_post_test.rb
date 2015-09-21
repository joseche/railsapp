require 'test_helper'

class TextPostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def setup
    @post1 = text_posts(:post1)
  end

  test "validates user_id presence" do
    @post1.user_id = nil
    assert_not @post1.valid?
    @post1.user_id = 1
  end

  test "textpost requires body" do
    @post1.body = nil
    assert_not @post1.valid?
  end

end
