class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :participations, :media, :recensions, :websites]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  #returns pair of movie and average rating for that movie
  def best_rated
    @movies = Movie.joins(:rating).select('movie.title, count(movie.movie_id) as count, avg(rating.ratingValue) as average').group("movie.movie_id")
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @comments = @movie.comment
    @genres = @movie.genre
    #2 dimensional array of users and the users rating
    ratings = @movie.rating
    user_for_rating = @movie.user
    @user_ratings = user_for_rating.zip(ratings)
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end
  
  def participations
    contribution = @movie.contribution
    participants = @movie.movie_participant
    @movie_participants = contribution.zip(participants)
  end


  def recensions
    @recensions = @movie.recension
  end

  def websites
    @websites = @movie.website
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :release_day, :release_month, :release_year, :duration, :budget, :revenue, :description, :ageRestriction)
    end
end
