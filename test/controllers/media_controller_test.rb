require 'test_helper'

class MediaControllerTest < ActionController::TestCase
  setup do
    @medium = medium(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:medium)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create medium" do
    assert_difference('Medium.count') do
      post :create, medium: { med_id: @medium.med_id, med_type: @medium.med_type, medium_set_id: @medium.medium_set_id, movie_id: @medium.movie_id }
    end

    assert_redirected_to medium_path(assigns(:medium))
  end

  test "should show medium" do
    get :show, id: @medium
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @medium
    assert_response :success
  end

  test "should update medium" do
    patch :update, id: @medium, medium: { med_id: @medium.med_id, med_type: @medium.med_type, medium_set_id: @medium.medium_set_id, movie_id: @medium.movie_id }
    assert_redirected_to medium_path(assigns(:medium))
  end

  test "should destroy medium" do
    assert_difference('Medium.count', -1) do
      delete :destroy, id: @medium
    end

    assert_redirected_to media_path
  end
end
