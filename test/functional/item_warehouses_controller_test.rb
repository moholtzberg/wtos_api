require 'test_helper'

class ItemWarehousesControllerTest < ActionController::TestCase
  setup do
    @item_warehouse = item_warehouses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_warehouses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_warehouse" do
    assert_difference('ItemWarehouse.count') do
      post :create, item_warehouse: {  }
    end

    assert_redirected_to item_warehouse_path(assigns(:item_warehouse))
  end

  test "should show item_warehouse" do
    get :show, id: @item_warehouse
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_warehouse
    assert_response :success
  end

  test "should update item_warehouse" do
    put :update, id: @item_warehouse, item_warehouse: {  }
    assert_redirected_to item_warehouse_path(assigns(:item_warehouse))
  end

  test "should destroy item_warehouse" do
    assert_difference('ItemWarehouse.count', -1) do
      delete :destroy, id: @item_warehouse
    end

    assert_redirected_to item_warehouses_path
  end
end
