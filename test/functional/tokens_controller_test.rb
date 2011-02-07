require 'test_helper'

class TokensControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tokens)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create token" do
    assert_difference('Token.count') do
      post :create, :token => { }
    end

    assert_redirected_to token_path(assigns(:token))
  end

  test "should show token" do
    get :show, :id => tokens(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => tokens(:one).to_param
    assert_response :success
  end

  test "should update token" do
    put :update, :id => tokens(:one).to_param, :token => { }
    assert_redirected_to token_path(assigns(:token))
  end

  test "should destroy token" do
    assert_difference('Token.count', -1) do
      delete :destroy, :id => tokens(:one).to_param
    end

    assert_redirected_to tokens_path
  end
end
