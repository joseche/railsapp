require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should get new user" do
    get :new
    user = assigns(:user)
    assert user.new_record?
    assert_response :success
  end

  test "should create a user" do
    params = {
        user: {
            email: "user@example.com",
            password: "password",
            password_confirmation: "password"
        }
    }
    post :create, params
    assert_redirected_to root_url
  end

  test "should show user" do
    user = users(:user1)
    get :show, id: user.id
    assert assigns(:user)
    assert_response :success
  end

  test "should follow user" do
    user1 = users(:user1)
    user2 = users(:user2)
    get :follow, {id: user2.id}, {user_id: user1.id}
    assert user1.following? user2
    assert_redirected_to user_url(user2)
  end

  test "follow should require login" do
    user = users(:user1)
    get :follow, {id: user.id}
    assert_redirected_to login_url
  end

end
