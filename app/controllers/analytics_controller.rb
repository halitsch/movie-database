class AnalyticsController < ApplicationController

  #returns pair of movie and average rating for that movie
  def best_rated
    if params[:genre].blank?
      @movies = Movie.joins(:rating).
                select('movie.movie_id, movie.title, count(movie.movie_id) as count, avg(rating.ratingValue) as average').
                group("movie.movie_id").
                order("average DESC").paginate(per_page: 10, page: params[:page])
    else
      @movies = Movie.joins(:genre).
                where('genre.name = ?', params[:genre]).joins(:rating).
                select('movie.movie_id, movie.title, count(movie.movie_id) as count, avg(rating.ratingValue) as average').
                group("movie.movie_id").
                order("average DESC").paginate(per_page: 10, page: params[:page])
    end
    
    get_genre_list
  end
=begin
  def genre_loans
    movies = Movie.joins(:loan).
              select('movie.movie_id, movie.title, count(movie.movie_id) as count').
              group("movie.movie_id").order('count DESC')

    @movies_count_and_genre = Array.new

    if params[:genre].blank?
      movies.each do |mov|
        @movies_count_and_genre << [mov.title, mov.count, mov.genre]
      end
    else
      movies.each do |mov|
        if mov.genre.inspect.include?(params[:genre])
          @movies_count_and_genre << [mov.title, mov.count, mov.genre]
        end
      end
    end
    
    get_genre_list
  end
=end

  def charts
    # Get array of genres and number of movies of each genre
    genres_and_movies = Genre.joins(:movie).
                        select('genre.genre_id, genre.name as name, count(*) as count').
                        group('genre.genre_id')

    @genre_and_movie_count = Array.new
    genres_and_movies.each do |genre|
      @genre_and_movie_count << [genre.name, genre.count]
    end    

    # Get array of months and number of wishes in that month
    wishlist_by_month = Wishlist.all.group_by { |w| w.wis_date.beginning_of_month }
    
    @month_and_wishes = Array.new
    wishlist_by_month.each do |date, wish| 
      @month_and_wishes << [date.strftime('%B %Y'), wish.length]
    end

    # Get array of months and number of ratings in that month
    ratings_by_month = Rating.all.group_by { |r| r.time.beginning_of_month }
    
    @month_and_ratings = Array.new
    ratings_by_month.each do |date, ratings| 
      @month_and_ratings << [date.strftime('%B %Y'), ratings.length]
    end

  end

  def most_commented
    @movies = Movie.joins(:comment).
              select('movie.movie_id, movie.title, count(movie.movie_id) as count').
              group('movie.movie_id').
              order('count DESC').take(10)
    end

  def most_active
    @users_comments = User.joins(:comment).
                      select('user.user_id, user.user_name, user.first_name, user.last_name, count(user.user_id) as count').
                      group('user.user_id').
                      order('count DESC').take(10)

    @users_ratings = User.joins(:rating).
                      select('user.user_id, user.user_name, user.first_name, user.last_name, count(user.user_id) as count').
                      group('user.user_id').
                      order('count DESC').take(10)
  end

  # Returns pair of genre name and count of movies of that genre
  # It's in pure SQL and not active record approach because I had this query writen before. 
  def movies_genres_count
    @genres = Genre.joins(:movie).
                        select('genre.genre_id, genre.name as name, count(*) as count').
                        group('genre.genre_id').
                        order('count DESC')
  end
private
  
  def get_genre_list
    @genre_names = Genre.select('name')
  end

end