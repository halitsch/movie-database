require 'test_helper'

class RecensionsControllerTest < ActionController::TestCase
  setup do
    @recension = recension(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:recension)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create recension" do
    assert_difference('Recension.count') do
      post :create, recension: { content: @recension.content, movie_id: @recension.movie_id, time: @recension.time, website_id: @recension.website_id }
    end

    assert_redirected_to recension_path(assigns(:recension))
  end

  test "should show recension" do
    get :show, id: @recension
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @recension
    assert_response :success
  end

  test "should update recension" do
    patch :update, id: @recension, recension: { content: @recension.content, movie_id: @recension.movie_id, time: @recension.time, website_id: @recension.website_id }
    assert_redirected_to recension_path(assigns(:recension))
  end

  test "should destroy recension" do
    assert_difference('Recension.count', -1) do
      delete :destroy, id: @recension
    end

    assert_redirected_to recensions_path
  end
end
