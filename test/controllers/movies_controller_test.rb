require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @movie = movie(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post :create, movie: { ageRestriction: @movie.ageRestriction, budget: @movie.budget, description: @movie.description, duration: @movie.duration, release_day: @movie.release_day, release_month: @movie.release_month, release_year: @movie.release_year, revenue: @movie.revenue, title: @movie.title }
    end

    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should show movie" do
    get :show, id: @movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie
    assert_response :success
  end

  test "should update movie" do
    patch :update, id: @movie, movie: { ageRestriction: @movie.ageRestriction, budget: @movie.budget, description: @movie.description, duration: @movie.duration, release_day: @movie.release_day, release_month: @movie.release_month, release_year: @movie.release_year, revenue: @movie.revenue, title: @movie.title }
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie
    end

    assert_redirected_to movies_path
  end
end
