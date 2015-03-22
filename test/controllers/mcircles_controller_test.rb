require 'test_helper'

class McirclesControllerTest < ActionController::TestCase
  setup do
    @mcircle = mcircles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mcircles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mcircle" do
    assert_difference('Mcircle.count') do
      post :create, mcircle: { network: @mcircle.network, number: @mcircle.number, state: @mcircle.state }
    end

    assert_redirected_to mcircle_path(assigns(:mcircle))
  end

  test "should show mcircle" do
    get :show, id: @mcircle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mcircle
    assert_response :success
  end

  test "should update mcircle" do
    patch :update, id: @mcircle, mcircle: { network: @mcircle.network, number: @mcircle.number, state: @mcircle.state }
    assert_redirected_to mcircle_path(assigns(:mcircle))
  end

  test "should destroy mcircle" do
    assert_difference('Mcircle.count', -1) do
      delete :destroy, id: @mcircle
    end

    assert_redirected_to mcircles_path
  end
end
