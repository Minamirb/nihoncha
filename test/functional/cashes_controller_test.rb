require 'test_helper'

class CashesControllerTest < ActionController::TestCase
  setup do
    @cash = cashes(:one)
    @user = users(:one)
    @user.confirm!
    sign_in @user
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cashes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cash" do
    assert_difference('Cash.count') do
      post :create, :cash => @cash.attributes
    end

    assert_redirected_to cash_path(assigns(:cash))
  end

  test "should show cash" do
    get :show, :id => @cash.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @cash.to_param
    assert_response :success
  end

  test "should update cash" do
    put :update, :id => @cash.to_param, :cash => @cash.attributes
    assert_redirected_to cash_path(assigns(:cash))
  end

  test "should destroy cash" do
    assert_difference('Cash.count', -1) do
      delete :destroy, :id => @cash.to_param
    end

    assert_redirected_to cashes_path
  end
end
