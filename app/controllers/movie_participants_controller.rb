class MovieParticipantsController < ApplicationController
  before_action :set_movie_participant, only: [:show, :edit, :update, :destroy]

  # GET /movie_participants
  # GET /movie_participants.json
  def index
    @movie_participants = MovieParticipant.all
  end

  # GET /movie_participants/1
  # GET /movie_participants/1.json
  def show
  end

  # GET /movie_participants/new
  def new
    @movie_participant = MovieParticipant.new
  end

  # GET /movie_participants/1/edit
  def edit
  end

  # POST /movie_participants
  # POST /movie_participants.json
  def create
    @movie_participant = MovieParticipant.new(movie_participant_params)

    respond_to do |format|
      if @movie_participant.save
        format.html { redirect_to @movie_participant, notice: 'Movie participant was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie_participant }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movie_participants/1
  # PATCH/PUT /movie_participants/1.json
  def update
    respond_to do |format|
      if @movie_participant.update(movie_participant_params)
        format.html { redirect_to @movie_participant, notice: 'Movie participant was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie_participant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movie_participants/1
  # DELETE /movie_participants/1.json
  def destroy
    @movie_participant.destroy
    respond_to do |format|
      format.html { redirect_to movie_participants_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie_participant
      @movie_participant = MovieParticipant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_participant_params
      params.require(:movie_participant).permit(:participant_id, :name, :birthplace, :birthdate)
    end
end
