require 'test_helper'

class CalllogsControllerTest < ActionController::TestCase
  setup do
    @calllog = calllogs(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calllogs)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calllog" do
    assert_difference('Calllog.count') do
      post :create, calllog: { called_on: @calllog.called_on, caller: @calllog.caller, duration: @calllog.duration, user_id: @calllog.user_id }
    end

    assert_redirected_to calllog_path(assigns(:calllog))
  end

  test "should show calllog" do
    get :show, id: @calllog
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calllog
    assert_response :success
  end

  test "should update calllog" do
    patch :update, id: @calllog, calllog: { called_on: @calllog.called_on, caller: @calllog.caller, duration: @calllog.duration, user_id: @calllog.user_id }
    assert_redirected_to calllog_path(assigns(:calllog))
  end

  test "should destroy calllog" do
    assert_difference('Calllog.count', -1) do
      delete :destroy, id: @calllog
    end

    assert_redirected_to calllogs_path
  end
end
