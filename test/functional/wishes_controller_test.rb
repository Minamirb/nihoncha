require 'test_helper'

class WishesControllerTest < ActionController::TestCase
  setup do
    @wish = wishes(:one)
    @user = users(:one)
    @user.confirm!
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishes)
  end

  test "should create wish" do
    assert_difference('Wish.count') do
      post :create, :wish => @wish.attributes
    end

    assert_redirected_to wish_path(assigns(:wish))
  end

  test "should show wish" do
    get :show, :id => @wish.to_param
    assert_response :success
  end

  test "should destroy wish" do
    assert_difference('Wish.count', -1) do
      delete :destroy, :id => @wish.to_param
    end

    assert_redirected_to wishes_path
  end

  context "on POST :preview" do
    setup do
      post :preview, :wish => {:uri => mock_uri}, :format => 'json'
    end
    should "assign fetched data" do
      assert_not_nil assigns(:wish)[:name]
    end
  end
end
