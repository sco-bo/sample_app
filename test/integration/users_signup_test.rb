require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  
  test "invalid signup information" do 
    get signup_path
    assert_no_difference 'User.count' do 
      post users_path, user: {
        name: "", 
        email: "scott@notvalid",
        password: "foob",
        password_confirmation: "boof"
      }
    end
    assert_template 'users/new'
  end

  test "valid signup info" do 
    get signup_path
    assert_difference 'User.count', 1 do 
      post_via_redirect users_path, user: {
        name: "Zach Weive", 
        email: "zack@gmail.com",
        password: "nunyabidness",
        password_confirmation: "nunyabidness"
      }
    end
    assert_template 'users/show'
    assert is_logged_in?
  end
end
