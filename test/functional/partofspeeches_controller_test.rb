require 'test_helper'

class PartofspeechesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:partofspeeches)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create partofspeech" do
    assert_difference('Partofspeech.count') do
      post :create, :partofspeech => { }
    end

    assert_redirected_to partofspeech_path(assigns(:partofspeech))
  end

  test "should show partofspeech" do
    get :show, :id => partofspeeches(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => partofspeeches(:one).to_param
    assert_response :success
  end

  test "should update partofspeech" do
    put :update, :id => partofspeeches(:one).to_param, :partofspeech => { }
    assert_redirected_to partofspeech_path(assigns(:partofspeech))
  end

  test "should destroy partofspeech" do
    assert_difference('Partofspeech.count', -1) do
      delete :destroy, :id => partofspeeches(:one).to_param
    end

    assert_redirected_to partofspeeches_path
  end
end
