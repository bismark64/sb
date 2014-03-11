require 'test_helper'

class ScratchersControllerTest < ActionController::TestCase
  setup do
    @scratcher = scratchers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:scratchers)
  end

  test "should create scratcher" do
    assert_difference('Scratcher.count') do
      post :create, scratcher: {  }
    end

    assert_response 201
  end

  test "should show scratcher" do
    get :show, id: @scratcher
    assert_response :success
  end

  test "should update scratcher" do
    put :update, id: @scratcher, scratcher: {  }
    assert_response 204
  end

  test "should destroy scratcher" do
    assert_difference('Scratcher.count', -1) do
      delete :destroy, id: @scratcher
    end

    assert_response 204
  end
end
