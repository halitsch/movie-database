require 'test_helper'

class WishlistsControllerTest < ActionController::TestCase
  setup do
    @wishlist = wishlist(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wishlist)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wishlist" do
    assert_difference('Wishlist.count') do
      post :create, wishlist: { movie_id: @wishlist.movie_id, user_id: @wishlist.user_id, wis_date: @wishlist.wis_date, wis_id: @wishlist.wis_id }
    end

    assert_redirected_to wishlist_path(assigns(:wishlist))
  end

  test "should show wishlist" do
    get :show, id: @wishlist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wishlist
    assert_response :success
  end

  test "should update wishlist" do
    patch :update, id: @wishlist, wishlist: { movie_id: @wishlist.movie_id, user_id: @wishlist.user_id, wis_date: @wishlist.wis_date, wis_id: @wishlist.wis_id }
    assert_redirected_to wishlist_path(assigns(:wishlist))
  end

  test "should destroy wishlist" do
    assert_difference('Wishlist.count', -1) do
      delete :destroy, id: @wishlist
    end

    assert_redirected_to wishlists_path
  end
end
