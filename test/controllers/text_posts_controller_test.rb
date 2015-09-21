require 'test_helper'

class TextPostsControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "get new with new post" do
    user1 = users(:user1)
    get :new, {}, {user_id: user1.id}
    text_post = assigns (:text_post)
    assert text_post.new_record?
    assert_response :success
  end




end
