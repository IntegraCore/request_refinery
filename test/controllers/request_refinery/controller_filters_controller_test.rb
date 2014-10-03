require 'test_helper'

module RequestRefinery
  class ControllerFiltersControllerTest < ActionController::TestCase
    setup do
      @controller_filter = controller_filters(:one)
    end

    test "should get index" do
      get :index
      assert_response :success
      assert_not_nil assigns(:controller_filters)
    end

    test "should get new" do
      get :new
      assert_response :success
    end

    test "should create controller_filter" do
      assert_difference('ControllerFilter.count') do
        post :create, controller_filter: { action_name: @controller_filter.action_name, controller: @controller_filter.controller, http_method: @controller_filter.http_method }
      end

      assert_redirected_to controller_filter_path(assigns(:controller_filter))
    end

    test "should show controller_filter" do
      get :show, id: @controller_filter
      assert_response :success
    end

    test "should get edit" do
      get :edit, id: @controller_filter
      assert_response :success
    end

    test "should update controller_filter" do
      patch :update, id: @controller_filter, controller_filter: { action_name: @controller_filter.action_name, controller: @controller_filter.controller, http_method: @controller_filter.http_method }
      assert_redirected_to controller_filter_path(assigns(:controller_filter))
    end

    test "should destroy controller_filter" do
      assert_difference('ControllerFilter.count', -1) do
        delete :destroy, id: @controller_filter
      end

      assert_redirected_to controller_filters_path
    end
  end
end
