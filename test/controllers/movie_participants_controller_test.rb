require 'test_helper'

class MovieParticipantsControllerTest < ActionController::TestCase
  setup do
    @movie_participant = movie_participant(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movie_participant)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie_participant" do
    assert_difference('MovieParticipant.count') do
      post :create, movie_participant: { birthdate: @movie_participant.birthdate, birthplace: @movie_participant.birthplace, name: @movie_participant.name, participant_id: @movie_participant.participant_id }
    end

    assert_redirected_to movie_participant_path(assigns(:movie_participant))
  end

  test "should show movie_participant" do
    get :show, id: @movie_participant
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie_participant
    assert_response :success
  end

  test "should update movie_participant" do
    patch :update, id: @movie_participant, movie_participant: { birthdate: @movie_participant.birthdate, birthplace: @movie_participant.birthplace, name: @movie_participant.name, participant_id: @movie_participant.participant_id }
    assert_redirected_to movie_participant_path(assigns(:movie_participant))
  end

  test "should destroy movie_participant" do
    assert_difference('MovieParticipant.count', -1) do
      delete :destroy, id: @movie_participant
    end

    assert_redirected_to movie_participants_path
  end
end
