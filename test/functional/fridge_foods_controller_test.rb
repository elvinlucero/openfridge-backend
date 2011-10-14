require 'test_helper'

class FridgeFoodsControllerTest < ActionController::TestCase
  setup do
    @fridge_food = fridge_foods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:fridge_foods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create fridge_food" do
    assert_difference('FridgeFood.count') do
      post :create, :fridge_food => @fridge_food.attributes
    end

    assert_redirected_to fridge_food_path(assigns(:fridge_food))
  end

  test "should show fridge_food" do
    get :show, :id => @fridge_food.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @fridge_food.to_param
    assert_response :success
  end

  test "should update fridge_food" do
    put :update, :id => @fridge_food.to_param, :fridge_food => @fridge_food.attributes
    assert_redirected_to fridge_food_path(assigns(:fridge_food))
  end

  test "should destroy fridge_food" do
    assert_difference('FridgeFood.count', -1) do
      delete :destroy, :id => @fridge_food.to_param
    end

    assert_redirected_to fridge_foods_path
  end
end
