require 'test_helper'

class OrderDetailBinsControllerTest < ActionController::TestCase
  setup do
    @order_detail_bin = order_detail_bins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_detail_bins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_detail_bin" do
    assert_difference('OrderDetailBin.count') do
      post :create, order_detail_bin: {  }
    end

    assert_redirected_to order_detail_bin_path(assigns(:order_detail_bin))
  end

  test "should show order_detail_bin" do
    get :show, id: @order_detail_bin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_detail_bin
    assert_response :success
  end

  test "should update order_detail_bin" do
    put :update, id: @order_detail_bin, order_detail_bin: {  }
    assert_redirected_to order_detail_bin_path(assigns(:order_detail_bin))
  end

  test "should destroy order_detail_bin" do
    assert_difference('OrderDetailBin.count', -1) do
      delete :destroy, id: @order_detail_bin
    end

    assert_redirected_to order_detail_bins_path
  end
end
