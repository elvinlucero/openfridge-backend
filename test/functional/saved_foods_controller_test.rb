require 'test_helper'

class SavedFoodsControllerTest < ActionController::TestCase
  setup do
    @saved_food = saved_foods(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:saved_foods)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create saved_food" do
    assert_difference('SavedFood.count') do
      post :create, :saved_food => @saved_food.attributes
    end

    assert_redirected_to saved_food_path(assigns(:saved_food))
  end

  test "should show saved_food" do
    get :show, :id => @saved_food.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @saved_food.to_param
    assert_response :success
  end

  test "should update saved_food" do
    put :update, :id => @saved_food.to_param, :saved_food => @saved_food.attributes
    assert_redirected_to saved_food_path(assigns(:saved_food))
  end

  test "should destroy saved_food" do
    assert_difference('SavedFood.count', -1) do
      delete :destroy, :id => @saved_food.to_param
    end

    assert_redirected_to saved_foods_path
  end
end
