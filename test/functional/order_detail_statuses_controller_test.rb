require 'test_helper'

class OrderDetailStatusesControllerTest < ActionController::TestCase
  setup do
    @order_detail_status = order_detail_statuses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_detail_statuses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_detail_status" do
    assert_difference('OrderDetailStatus.count') do
      post :create, order_detail_status: {  }
    end

    assert_redirected_to order_detail_status_path(assigns(:order_detail_status))
  end

  test "should show order_detail_status" do
    get :show, id: @order_detail_status
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_detail_status
    assert_response :success
  end

  test "should update order_detail_status" do
    put :update, id: @order_detail_status, order_detail_status: {  }
    assert_redirected_to order_detail_status_path(assigns(:order_detail_status))
  end

  test "should destroy order_detail_status" do
    assert_difference('OrderDetailStatus.count', -1) do
      delete :destroy, id: @order_detail_status
    end

    assert_redirected_to order_detail_statuses_path
  end
end
