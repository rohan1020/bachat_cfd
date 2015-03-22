require 'test_helper'

class CallplansControllerTest < ActionController::TestCase
  setup do
    @callplan = callplans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:callplans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create callplan" do
    assert_difference('Callplan.count') do
      post :create, callplan: { description: @callplan.description, name: @callplan.name, network: @callplan.network, plantype: @callplan.plantype, price: @callplan.price, ratepermin: @callplan.ratepermin, ratepermin_std: @callplan.ratepermin_std, ratepersec: @callplan.ratepersec, ratepersec_std: @callplan.ratepersec_std, state: @callplan.state }
    end

    assert_redirected_to callplan_path(assigns(:callplan))
  end

  test "should show callplan" do
    get :show, id: @callplan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @callplan
    assert_response :success
  end

  test "should update callplan" do
    patch :update, id: @callplan, callplan: { description: @callplan.description, name: @callplan.name, network: @callplan.network, plantype: @callplan.plantype, price: @callplan.price, ratepermin: @callplan.ratepermin, ratepermin_std: @callplan.ratepermin_std, ratepersec: @callplan.ratepersec, ratepersec_std: @callplan.ratepersec_std, state: @callplan.state }
    assert_redirected_to callplan_path(assigns(:callplan))
  end

  test "should destroy callplan" do
    assert_difference('Callplan.count', -1) do
      delete :destroy, id: @callplan
    end

    assert_redirected_to callplans_path
  end
end
