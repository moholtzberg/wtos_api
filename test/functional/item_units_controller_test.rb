require 'test_helper'

class ItemUnitsControllerTest < ActionController::TestCase
  setup do
    @item_unit = item_units(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:item_units)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create item_unit" do
    assert_difference('ItemUnit.count') do
      post :create, item_unit: {  }
    end

    assert_redirected_to item_unit_path(assigns(:item_unit))
  end

  test "should show item_unit" do
    get :show, id: @item_unit
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @item_unit
    assert_response :success
  end

  test "should update item_unit" do
    put :update, id: @item_unit, item_unit: {  }
    assert_redirected_to item_unit_path(assigns(:item_unit))
  end

  test "should destroy item_unit" do
    assert_difference('ItemUnit.count', -1) do
      delete :destroy, id: @item_unit
    end

    assert_redirected_to item_units_path
  end
end
